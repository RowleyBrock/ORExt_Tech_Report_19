library(tidyverse)
library(readxl)
library(janitor)
library(fs)
theme_set(theme_minimal())

files <- dir_ls("ELA", regexp = "ELA/g")
d <- map_df(files, read_excel, .id = "grade") %>% 
  mutate(grade = parse_number(grade)) %>% 
  clean_names()%>% 
  mutate(free_est = difficulty + displacement)

outside_range <- function(g3ELA) {
  g3ELA %>% 
    filter(difficulty < lwr | 
             difficulty > upr) %>% 
    select(item_id, difficulty, free_est)
}

nested <- d %>% 
  nest(-grade)

# new cols to create: data2, plot
estimates <- nested %>% 
  mutate(model = map(data, ~lm(difficulty ~ free_est, .)),
         data2 = map2(data, model, 
                      ~cbind(.x, 
                             predict(.y, 
                                     interval = "prediction"))),
         plot = map2(data2, grade, ~
           ggplot(.x, aes(free_est, difficulty)) +
             geom_point(color = "gray40") +
             geom_ribbon(aes(ymin = lwr, ymax = upr),
                         fill = "cornflowerblue", 
                         alpha = 0.2) +
              geom_line(aes(y = fit), 
                        color = "magenta", 
                        lwd = 1.2) +
               labs(title = paste("Grade", .y,
                                  "Item-Parameter Drift"))),
         remove = map(data2, outside_range))       

estimates %>% 
  select(grade, remove) %>% 
  unnest()%>%
 write_csv ("ela_drifted_items.csv")

dir_create("plots")
plot_titles <- paste0("plots/g", estimates$grade, "ELAipdrift.pdf")
walk2(plot_titles, estimates$plot,
     ~ggsave(.x, .y, width = 6.5, height = 8))


#This is where D.A coded for TCC
diffs <- map_df(dir_ls("allfiles", glob = "*.xlsx"), read_xlsx, .id = "file") %>% 
  janitor::clean_names() %>% 
  mutate(content = gsub(".+g\\d*\\d(.+)ifile.+", "\\1", file),
         grade = gsub(".+g(\\d*\\d).+", "\\1", file)) %>% 
  nest(-content, -grade)

prob <- function(diff, discrim = 1, theta = seq(-3, 3, .01)) {
  1 / (1 + exp(-(discrim*(theta - diff))))
}

probs <- diffs %>% 
  mutate(difficulties = map(data, "difficulty"),
         difficulties = map2(data, difficulties, ~set_names(.y, .x$item_id)),
         probs = map(difficulties, 
                     ~map_df(., prob) %>% 
                       rowid_to_column() %>%
                       gather(item, prob, -rowid) %>% 
                       group_by(rowid) %>% 
                       summarize(tot = sum(prob, na.rm = TRUE)) %>% 
                       mutate(theta = seq(-3, 3, .01))))

probs %>% 
  select(content, grade, probs) %>% 
  unnest() %>% 
  ggplot(aes(theta, tot, color = grade)) +
  geom_line(lwd = 1.3) + 
  scale_color_brewer(palette = "Set1")+
  facet_wrap(~content)
