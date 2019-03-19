#This is code for TCC
library(tidyverse)
library(readxl)
library(janitor)
library(fs)
theme_set(theme_minimal())

diffs <- map_df(dir_ls("Math_ItemPlanning", glob = "*.xlsx"), read_xlsx, .id = "file") %>% 
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
  geom_line(lwd = 1.3)+ 
  scale_color_brewer(palette = "Set1")+
  facet_wrap(~content)
