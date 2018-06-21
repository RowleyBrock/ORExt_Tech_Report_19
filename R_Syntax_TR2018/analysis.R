# Packages ----------------------------------------------------------------

library(tidyverse)
library(fs)
library(janitor)
library(r2Winsteps)


# Data prep ---------------------------------------------------------------

files <- dir_ls("raw", glob = "*.txt")

# Remove ORora
files <- files[-grep("XO", files)]

d <- map_df(files, read_delim, delim = "|", na = "N", .id = "content") %>%
  clean_names("old_janitor") %>% 
  mutate(content = str_extract(content, "XE|XM|XS"),
         content = case_when(content == "XE" ~ "ELA",
                             content == "XM" ~ "Math",
                             TRUE ~ "Science"),
         grade_for_match = parse_number(enrlgrattst),
         grade_for_match = ifelse(grade_for_match == 12, 
                                  11, 
                                  grade_for_match)) %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) 

item_ids <- map_df(dir_ls("tests"), 
                     ~read_csv(.) %>% select(Item, `Item ID`), 
                     .id = "file") %>% 
  janitor::clean_names() %>% 
  mutate(content = str_extract(file, "ELA|Math|Science"),
         grade_for_match = as.numeric(gsub(".+/G(\\d.?)(_.+)", "\\1", file))) %>% 
  select(-file)

nested <- left_join(d, item_ids) %>% 
  select(-item) %>% 
  group_by(grade_for_match, content) %>% 
  nest() %>% 
  mutate(data = map(data, ~spread(., item_id, response))) %>% 
  mutate(data  = map(data, ~remove_empty(., "cols")),
         dems  = map(data, ~select(., testeventid, ssid, enrlgrattst, 
                                   asmtprmrydsbltycd, asmtscndrydsbltycd)),
         items = map(data, ~select(., -testeventid:-tstcmpltdt)),
         items = map(items, ~map_df(., ~ifelse(is.na(.), 0, .))))

old_ifiles <- map_df(dir_ls("ifiles17"), read_csv, .id = "file") %>% 
  group_by(file) %>% 
  nest() %>% 
  mutate(content = str_extract(file, "ELA|Math|Sci"),
         content = ifelse(content == "Sci", "Science", content),
         grade_for_match = as.numeric(gsub(".+/g(\\d\\d?).+", "\\1", file))) %>% 
  rename(old_ifiles = data) %>% 
  select(-file)

nested <- left_join(nested, old_ifiles)

#dir_create("anchor_files")
afile_names <- with(nested, 
                    glue::glue("anchor_files/{content}{grade_for_match}afile"))
pwalk(list(rawItmsDta = nested$items, 
           eqIfile = nested$old_ifiles, 
           anchorFileName = afile_names),
      write.anchor)

field <- seq(16, 38, 2)

# Analysis ----------------------------------------------------------------

person_pars <- batchRunWinsteps(nested$items, 
                         nested$dems, 
                         titleL = as.list(paste0(nested$content, 
                                                 nested$grade_for_match)),
                         anchorFileL = as.list(paste0(afile_names, ".txt")),
                         idelete = field,
                         dec = 4)

item_pars <- batchRunWinsteps(nested$items, 
                         nested$dems, 
                         titleL = as.list(paste0(nested$content, 
                                                 nested$grade_for_match)),
                         anchorFileL = as.list(paste0(afile_names, ".txt")),
                         dec = 4)

# Check TCCs
math <- item_pars[grep("Math", names(item_pars))][-1]
math <- math[order(parse_number(names(math)))]
class(math) <- class(item_pars)
plot(math) 

ela <- item_pars[grep("ELA", names(item_pars))][-1]
ela <- ela[order(parse_number(names(ela)))]
class(ela) <- class(item_pars)
plot(ela) 


# Write out items (field test items included)
# dir_create("ifiles18")

items <- map(item_pars, "ItemParameters")

grades  <- parse_number(names(items))
content <- gsub("\\d", "", names(items))
ifile_names <- paste0("ifiles18/g", grades, content, "ifiles18.csv")

walk2(items, ifile_names, ~write_csv(.x, .y))

# Write out persons (field test items not included)
# dir_create("pfiles18")

pers <- map(person_pars, "PersonParameters")

grades  <- parse_number(names(pers))
content <- gsub("\\d", "", names(pers))
pfile_names <- paste0("pfiles18/g", grades, content, "pfiles18.csv")

walk2(pers, pfile_names, ~write_csv(.x, .y))


# ODE Files ---------------------------------------------------------------
ode <- bind_rows(pers, .id = "grade_content") %>% 
  tbl_df() %>% 
  mutate(grade   = parse_number(grade_content),
         content = gsub("\\d", "", grade_content)) %>% 
  select(-grade_content) %>% 
  filter(enrlgrattst != 12) %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, content, RawScore, Theta, SE)

cuts <- data_frame(content = 
                     c(rep(c("ELA", "Math"), each = 7), rep("Science", 3)),
                   grade = c(rep(c(3:8, 11), 2), c(5, 8, 11)),
                   multiply = c(rep(200, 6), 900,
                                rep(200, 6), 900,
                                500, 800, 900),
                   c1      = c(192, 200, 202, 205, 208, 213, 899,
                               192, 193, 193, 204, 207, 208, 901,
                               506, 810, 901),
                   c2      = c(213, 213, 220, 220, 222, 224, 920,
                               201, 206, 206, 208, 209, 212, 907,
                               517, 820, 914),
                   c3      = c(228, 228, 232, 233, 236, 236, 927,
                               218, 219, 220, 222, 223, 226, 922,
                               530, 831, 929))


ode <- left_join(ode, cuts) %>% 
  mutate(Theta  = round(Theta, 4),
         SE     = round(SE, 4),
         RIT    = round((Theta * 10) + multiply),
         RIT_SE = round(SE*10, 2)) %>% 
  mutate(amo_lvl = case_when(RIT < c1 ~ 1,
                             RIT >= c1 & RIT < c2 ~ 2,
                             RIT >= c2 & RIT < c3 ~ 3,
                             RIT >= c3 ~ 4)) %>%
  select(-c1, -c2, -c3, -multiply) %>% 
  group_by(grade, content) %>% 
  nest()

walk2(ode$data,
      with(ode, paste0("ode18/g", grade, tolower(content), "_RIT.csv")),
      ~write_csv(.x, .y))

# Reading and writing subscores ------------------------------------------

rdwri <- nested %>% 
  filter(content == "ELA") %>% 
  mutate(read = map(items, ~.[ ,setdiff(grep("RF|RI|RL", names(.)), field)]),
         wri  = map(items, ~.[ ,setdiff(grep("WR", names(.)), field)]))
  
rdg_afile_names <- with(rdwri, 
                    glue::glue("anchor_files/rdg{grade_for_match}afile"))

pwalk(list(rawItmsDta = rdwri$read, 
           eqIfile = rdwri$old_ifiles, 
           anchorFileName = rdg_afile_names),
      write.anchor)

wri_afile_names <- with(rdwri, 
                    glue::glue("anchor_files/wri{grade_for_match}afile"))

pwalk(list(rawItmsDta = rdwri$wri, 
           eqIfile = rdwri$old_ifiles, 
           anchorFileName = wri_afile_names),
      write.anchor)


rdg_pars <- batchRunWinsteps(rdwri$read, 
                             rdwri$dems, 
                             titleL = as.list(paste0("rdg", 
                                                 rdwri$grade_for_match)),
                             anchorFileL = as.list(
                               paste0(rdg_afile_names, ".txt")))

pers_rdg <- map(rdg_pars, "PersonParameters")

grades  <- parse_number(names(pers_rdg))
pfile_names <- paste0("pfiles18/g", grades, "Rdg", "pfiles18.csv")

walk2(pers_rdg, pfile_names, ~write_csv(.x, .y))

wri_pars <- batchRunWinsteps(rdwri$wri, 
                             rdwri$dems, 
                             titleL = as.list(paste0("wri", 
                                                 rdwri$grade_for_match)),
                             anchorFileL = as.list(
                               paste0(wri_afile_names, ".txt")))

pers_wri <- map(wri_pars, "PersonParameters")

grades  <- parse_number(names(pers_wri))
pfile_names <- paste0("pfiles18/g", grades, "Wri", "pfiles18.csv")

walk2(pers_wri, pfile_names, ~write_csv(.x, .y))

## ODE Files
ode <- bind_rows(pers_rdg, pers_wri, .id = "grade_content") %>% 
  tbl_df() %>% 
  mutate(grade   = parse_number(grade_content),
         content = gsub("\\d", "", grade_content)) %>% 
  select(-grade_content) %>% 
  filter(enrlgrattst != 12) %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, content, RawScore, Theta, SE)

cuts <- data_frame(content = 
                     c(rep(c("rdg", "wri"), each = 7)),
                   grade = c(rep(c(3:8, 11), 2)),
                   multiply = c(rep(200, 6), 900,
                                rep(200, 6), 900),
                   c1      = rep(c(192, 200, 202, 205, 208, 213, 899), 2),
                   c2      = rep(c(213, 213, 220, 220, 222, 224, 920), 2),
                   c3      = rep(c(228, 228, 232, 233, 236, 236, 927), 2))


ode <- left_join(ode, cuts) %>% 
   mutate(Theta  = round(Theta, 4),
         SE     = round(SE, 4),
         RIT    = round((Theta * 10) + multiply),
         RIT_SE = round(SE*10, 2)) %>% 
  mutate(amo_lvl = case_when(RIT < c1 ~ 1,
                             RIT >= c1 & RIT < c2 ~ 2,
                             RIT >= c2 & RIT < c3 ~ 3,
                             RIT >= c3 ~ 4)) %>%
  select(-c1, -c2, -c3, -multiply) %>% 
  group_by(grade, content) %>% 
  nest()

walk2(ode$data,
      with(ode, paste0("ode18/g", grade, content, "_RIT.csv")),
      ~write_csv(.x, .y))

# G12 Analyses ------------------------------------------------------------

g12mth <- person_pars[["Math11"]]$PersonParameters %>% 
  filter(enrlgrattst == 12) %>% 
  rename(grade = enrlgrattst) %>% 
  tbl_df() %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, RawScore, Theta, SE) %>% 
  mutate(RIT    = (Theta*10) + 900,
         RIT_SE = SE*10) %>% 
  mutate(c1 = 901, 
         c2 = 907, 
         c3 = 922,
         amo_lvl = case_when(RIT < c1 ~ 1,
                           RIT >= c1 & RIT < c2 ~ 2,
                           RIT >= c2 & RIT < c3 ~ 3,
                           TRUE ~ 4)) %>% 
  select(-starts_with("c"))

theme_set(theme_minimal())

ggplot(g12mth, aes(RIT)) + 
  geom_histogram(bins = 15, fill = "gray80", color = "gray90",
                 data = select(g12mth, -amo_lvl)) +
  geom_histogram(aes(fill = factor(amo_lvl)), bins = 15,color = "gray30") +
  scale_fill_viridis_d() +
  facet_wrap(~amo_lvl, nrow = 1) +
  labs(title = "RIT Score Distributions",
       subtitle = "Grade 12 Math") 
ggsave("plots/g12mth_hist_background.pdf", width = 9, height = 6.5)

panels_mth <- data.frame(xlow  = c(-Inf, 901, 907, 922), 
                         xhigh = c(901, 907, 922, Inf),
                         ylow  = 0,
                         yhigh  = Inf)

ggplot(g12mth, aes(RIT)) + 
  geom_rect(aes(xmin = xlow, 
                 xmax = xhigh, 
                 ymin = ylow, 
                 ymax = yhigh), 
             fill = viridisLite::viridis(4),
             data = panels_mth,
             alpha = 0.5,
             inherit.aes = FALSE) +
  geom_histogram(bins = 15, fill = "gray80", color = "gray20") +
  geom_vline(xintercept = panels_mth$xlow[-1],
             color = viridisLite::viridis(5)[2],
             lwd = 1.5) +
  labs(title = "RIT Score Distributions",
       subtitle = "Grade 12 Math") 
ggsave("plots/g12mth_singlehist.pdf", width = 6.5, height = 8)


g12ela <- person_pars[["ELA11"]]$PersonParameters %>% 
  filter(enrlgrattst == 12) %>% 
  rename(grade = enrlgrattst) %>% 
  tbl_df() %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, RawScore, Theta, SE) %>% 
  mutate(RIT    = (Theta*10) + 900,
         RIT_SE = SE*10) %>% 
  mutate(c1 = 899, 
         c2 = 920, 
         c3 = 927,
         amo_lvl = case_when(RIT < c1 ~ 1,
                           RIT >= c1 & RIT < c2 ~ 2,
                           RIT >= c2 & RIT < c3 ~ 3,
                           TRUE ~ 4)) %>% 
  select(-starts_with("c"))

ggplot(g12ela, aes(RIT)) +
  geom_histogram(bins = 15, fill = "gray80", color = "gray90",
                 data = select(g12ela, -amo_lvl)) +
  geom_histogram(aes(fill = factor(amo_lvl)), bins = 15,color = "gray30") +
  scale_fill_viridis_d("Proficiency Level") +
  facet_wrap(~amo_lvl, nrow = 1) +
  labs(title = "RIT Score Distributions",
       subtitle = "Grade 12 ELA") +
  theme_minimal() 
ggsave("plots/g12ela_hist_background.pdf", width = 9, height = 6.5)

panels_ela <- data.frame(xlow  = c(-Inf, 899, 920, 927), 
                         xhigh = c(899, 920, 927, Inf),
                         ylow  = 0,
                         yhigh  = Inf)

ggplot(g12ela, aes(RIT)) + 
  geom_rect(aes(xmin = xlow, 
                 xmax = xhigh, 
                 ymin = ylow, 
                 ymax = yhigh), 
             fill = viridisLite::viridis(4),
             data = panels_ela,
             alpha = 0.5,
             inherit.aes = FALSE) +
  geom_histogram(bins = 15, fill = "gray80", color = "gray20") +
  geom_vline(xintercept = panels_ela$xlow[-1],
             color = viridisLite::viridis(5)[2],
             lwd = 1.5) +
  labs(title = "RIT Score Distributions",
       subtitle = "Grade 12 ELA") 
ggsave("plots/g12ela_singlehist.pdf", width = 6.5, height = 8)


#dir_create("ode18")
write_csv(mutate(g12mth, RIT = round(RIT)), "ode18/g12math_RIT.csv")
write_csv(mutate(g12ela, RIT = round(RIT)), "ode18/g12ela_RIT.csv")

g12rdg <- rdg_pars[["rdg11"]]$PersonParameters %>% 
  filter(enrlgrattst == 12) %>% 
  rename(grade = enrlgrattst) %>% 
  tbl_df() %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, RawScore, Theta, SE) %>% 
  mutate(RIT    = (Theta*10) + 900,
         RIT_SE = SE*10) %>% 
  mutate(c1 = 899, 
         c2 = 920, 
         c3 = 927,
         amo_lvl = case_when(RIT < c1 ~ 1,
                           RIT >= c1 & RIT < c2 ~ 2,
                           RIT >= c2 & RIT < c3 ~ 3,
                           TRUE ~ 4)) %>% 
  select(-starts_with("c"))

write_csv(mutate(g12rdg, RIT = round(RIT)), "ode18/g12rdg_RIT.csv")

g12wri <- wri_pars[["wri11"]]$PersonParameters %>% 
  filter(enrlgrattst == 12) %>% 
  rename(grade = enrlgrattst) %>% 
  tbl_df() %>% 
  select(ssid, testeventid, asmtprmrydsbltycd, asmtscndrydsbltycd, 
         grade, RawScore, Theta, SE) %>% 
  mutate(RIT    = (Theta*10) + 900,
         RIT_SE = SE*10) %>% 
  mutate(c1 = 899, 
         c2 = 920, 
         c3 = 927,
         amo_lvl = case_when(RIT < c1 ~ 1,
                           RIT >= c1 & RIT < c2 ~ 2,
                           RIT >= c2 & RIT < c3 ~ 3,
                           TRUE ~ 4)) %>% 
  select(-starts_with("c"))

write_csv(mutate(g12wri, RIT = round(RIT)), "ode18/g12wri_RIT.csv")

# Proficiency level plots -------------------------------------------------
d <- map_df(dir_ls("ode18"), read_csv, .id = "file") %>% 
  mutate(grade = gsub("[^[:digit:]]", "", file),
         grade = as.numeric(substr(grade, 3, nchar(grade))),
         content = gsub(".+\\d(.+)_.+", "\\1", file)) 

d %>% 
  filter(content != "rdg" & content != "wri") %>% 
  group_by(grade, content, amo_lvl) %>% 
  count() %>% 
  group_by(grade, content) %>% 
  mutate(percent = n/sum(n),
         amo_lvl = factor(amo_lvl, levels = 1:4)) %>% 
ggplot(aes(amo_lvl, percent)) +
  geom_col(aes(fill = amo_lvl)) +
  facet_grid(content ~ grade) +
  theme_light() +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_grey("AMO Level") +
  labs(title = "Percentage of Students in each AMO Category",
       x = "AMO Level",
       y = "Percentage")
  
d %>% 
  filter(grade < 11 & content != "science") %>% 
ggplot(aes(RIT)) +
  geom_histogram(aes(fill = factor(amo_lvl)), bins = 15) +
  facet_grid(content ~ grade) +
  theme_light() +
  scale_fill_viridis_d("AMO Level") +
  labs(title = "Percentage of Students in each AMO Category",
       x = "AMO Level",
       y = "Percentage")
  
