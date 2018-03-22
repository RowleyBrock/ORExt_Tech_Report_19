library(tidyverse)
library(fs)
library(purrr)
library(glue)
library(sundry)
library(janitor)

files <- dir_ls("data/FINAL_ODEPfiles_G3_11", glob = "*.csv")
files <- files[is.na(str_extract(files, "Rdg|Wri"))]

read_sub_files <- function(file) {
  out <- read_csv(file) %>% 
    mutate(content_area = str_extract(file, "ELA|Rdg|Wri|Math|Sci"),
           grade = parse_number(gsub(".+_(.+)_.+", "\\1", file))) %>% 
    select(content_area, grade, everything())  %>% 
    janitor::clean_names()
  names(out)[grep("rit", names(out))] <- "rit"
  out
}

d <- map_df(files, read_sub_files)
######## analyze percent proficient based on RIT scores
cuts <- data_frame(content_area = 
                     c(rep(c("ELA", "Math"), each = 7), rep("Sci", 3)),
                   grade = c(rep(c(3:8, 11), 2), c(5, 8, 11)),
                   c1      = c(192, 200, 202, 205, 208, 213, 899,
                               192, 193, 193, 204, 207, 208, 901,
                               506, 810, 901),
                   c2      = c(213, 213, 220, 220, 222, 224, 920,
                               201, 206, 206, 208, 209, 212, 907,
                               517, 820, 914),
                   c3      = c(228, 228, 232, 233, 236, 236, 927,
                               218, 219, 220, 222, 223, 226, 922,
                               530, 831, 929))

# left_join(d, cuts) %>%
#   mutate(amo_lvl = case_when(rit < c1 ~ 1,
#                              rit >= c1 & rit < c2 ~ 2,
#                              rit >= c2 & rit < c3 ~ 3,
#                              rit >= c3 ~ 4)) %>%
#   select(-c1, -c2, -c3) %>%
#   group_by(amo_lvl, grade, content_area) %>%
#   summarize(min = min(rit, na.rm = TRUE),
#             max = max(rit, na.rm = TRUE)) %>%
#   unite(range, c("min", "max"), sep = "-") %>%
#   spread(amo_lvl, range) %>%
#   arrange(content_area, grade) %>%
#   split(.$content_area)

d <- left_join(d, cuts) %>% 
  mutate(amo_lvl = case_when(rit < c1 ~ 1,
                             rit >= c1 & rit < c2 ~ 2,
                             rit >= c2 & rit < c3 ~ 3,
                             rit >= c3 ~ 4)) %>% 
  select(-c1, -c2, -c3)

tbls_plc <- d %>% 
  group_by(content_area, grade) %>% 
  count(amo_lvl) %>% 
  mutate(percent = round(n / sum(n), 2)) %>% 
  select(-n) %>% 
  spread(amo_lvl, percent) %>% 
  split(.$content_area)

#map(tbls_plc, knitr::kable)

by_grade <- d %>% 
  group_by(content_area, grade) %>% 
  count(amo_lvl) %>% 
  mutate(percent = n / sum(n)) %>% 
  group_by(grade) %>% 
  nest()
  
theme_set(theme_light())

by_grade <- by_grade %>% 
  mutate(plot = map2(data, c(3:8, 11), 
                    ~ggplot(.x, aes(factor(amo_lvl), percent)) +
                      geom_col(aes(fill = factor(content_area)), 
                               position = "dodge", 
                               alpha = 0.8) +
                      scale_fill_viridis_d("Content Area", option = "magma") +
                      scale_y_continuous(labels = scales::percent) +
                      labs(x = "AMO Level",
                           y = "Percent",
                           title = glue("Percent Proficient in Each ",
                                        "Performance Level Category: ", 
                                        "Grade {.y}"))))
  
# Options for viridis pallette are: "viridis", "magma", "inferno", or "plasma"
walk(by_grade$plot, print)

# Next steps
# * Calculate descriptive stats for each grade/content area: Mean, SD, min/max
#   (check out sundry::descrips)

d %>% 
  group_by(content_area, grade) %>% 
  descrips(rit)

# * Calculate percentages of each ethnicity (similar to above, with group_by)

d %>%
  group_by(ethniccd, content_area, grade) %>%
  count() %>% 
  group_by(content_area, grade) %>% 
  mutate(percent = n/sum(n))
  
d %>% 
  group_by(ethniccd, content_area, grade) %>%
  descrips(rit) 
  
# * Reading in disability file

disfiles <- dir_ls("data/FINAL_ODEPfiles_G3_11/Final_ODEPfiles_AMO/IDEAExceptFile", glob = "*.csv")
disab <- read_csv(disfiles) %>% 
  janitor::clean_names()

# Take care of students with multiple disabilities
disab %>% 
  count(ssid) %>% 
  count(n)

disab <- disab %>% 
  group_by(ssid) %>% 
  mutate(index = 1:n()) %>% 
  spread(index, disab)

disab %>% 
  filter(!is.na(`2`)) %>% 
  filter(`1` != `2`)

disab <- disab %>% 
  select(-`2`) %>% 
  rename(disability = `1`)

# * Join disability file with d
d <- left_join(d, disab)
d <- d %>% 
  mutate(disability = ifelse(is.na(disability), "missing", disability))

d %>% 
  group_by(content_area) %>% 
  count(disability) %>% 
  View()

#     + Calculate means by disability

d %>% 
  group_by(disability, content_area, grade) %>%
  descrips(rit)

#     + Plot means for each disability group (include SE) # < similar to above 
#       with purrr::nest and purrr::map


#     + Add gender in the group_by to see if there's any differences between 
#       genders within disabilities (maybe do a t-test)

#     + Maybe revisit ethinicity by disability (i.e., include it in the 
#       group_by)

# * Create a White/Non-White variable, with somethin like (where d is your 
#   dataset): `d %>% mutate(minority = ifelse(ethniccd == "W", "Yes", "No")`
#     + Calculate means by minority status (and maybe do a t-test)
# * Talk to me about correlations between content areas within grade
# * Talk to me about removing groups with low n
# Next steps are item-level analyses (pt biserial, etc)

# More example code
# d %>% 
#   group_by(content_area, grade) %>% 
#   count(ethniccd)

