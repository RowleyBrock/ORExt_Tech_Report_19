library(tidyverse)
library(fs)
library(glue)
library(sundry)
library(janitor)
library(dplyr)

d <- map_df(dir_ls("data/ode18"), read_csv, .id = "file")
d$file <- gsub("data/ode18/", "", d$file)
d <- d %>% 
  mutate(content = str_extract(file, "ela|math|science|wri|rdg"),
         grade   = parse_number(file))
  
disab <- read_csv("data/jm05162018_SSIDsExtAssessmentt_Blenhardt_6049.csv") %>% 
  distinct() %>% 
  rename(disab_missing = asmtscndrydsbltycd)

d <- left_join(d, disab)
d <- d %>% 
  mutate(asmtprmrydsbltycd = ifelse(asmtprmrydsbltycd == 0, 
                                    disab_missing, 
                                    asmtprmrydsbltycd)) 

d %>% 
  filter(is.na(asmtprmrydsbltycd)) %>% 
  select(ssid, Theta, asmtprmrydsbltycd, asmtscndrydsbltycd)

d <- d %>% 
  select(-disab_missing) %>% 
  rename(disab1 = asmtprmrydsbltycd,
         disab2 = asmtscndrydsbltycd)

means <- d %>% 
  group_by(content, grade, disab1) %>% 
  summarize(mean = mean(RIT), 
            sd   = sd(RIT))


d %>% 
  filter(grade < 11 & (content == "ela" | content == "math")) %>% 
ggplot(aes(amo_lvl, RIT, fill = factor(disab1))) +
  geom_bar(stat = "summary", fun.y = "mean", position = "dodge") +
  facet_wrap(~grade) +
  scale_fill_viridis_d()

View(d)

count(d, asmtprmrydsbltycd) %>% 
  filter(asmtprmrydsbltycd == 0)

d %>% 
  group_by(content_area) %>% 
  count(asmtprmrydsbltycd) %>% 
  View()

d %>% 
  count(ssid) %>% 
  count(n)