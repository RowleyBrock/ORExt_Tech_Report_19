library(tidyverse)
library(fs)
library(rio)
library(RColorBrewer)
display.brewer.all()

d <- import("data/irr/RaterReliability.csv", setclass = "tbl_df") %>% 
  janitor::clean_names()

theme_set(theme_minimal())
# Counts for responses
d %>% 
  gather(var, response, test_security:minimum_participation) %>% 
  group_by(var) %>%
  count(response) %>%
  mutate(response = factor(response, 
                           levels = c("Exemplary", 
                                      "Appropriate", 
                                      "Somewhat Appropriate",
                                      "Inappropriate"))) %>% 
  ggplot(aes(response, n)) +
  geom_col(aes(fill = response)) +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~var, labeller = label_parsed) +
  guides(fill = "none")
          
  # Percentage for responses    
d %>% 
  gather(var, response, test_security:minimum_participation) %>% 
  group_by(var) %>%
  count(response)%>%
  mutate(tot = sum(n),
         percent = (n/tot)*100) %>% 
  select(-n, -tot) %>% 
  spread(response, percent, fill = 0) %>% 
  select(Exemplary, Appropriate, `Somewhat Appropriate`, Inappropriate)

# Counts for responses by subject_area and student_grade
d %>% 
  gather(var, response, test_security:minimum_participation) %>% 
  group_by(var, subject_area, student_grade) %>% 
  count(response) %>% 
  spread(response, n, fill = 0) %>%
  select(Exemplary, Appropriate, `Somewhat Appropriate`, Inappropriate)

# Proportion of respondents who provide a rating of "Mark As Disagree"
d %>% 
  select(starts_with("item")) %>% 
  gather(item, response) %>% 
  count(response) %>% 
  mutate(tot = sum(n),
         percent = (n/tot)*100)
