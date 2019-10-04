```{r ORora}
library(tidyverse)
library(here)
library(fs)
library(janitor)

df <- read_csv(here("data", "db-export", "query_result.csv")) %>% 
  mutate(grade = parse_number(grade), 
         score = parse_number(score))

eth <- read_csv(here("data", "race_eth", "race_eth.csv")) %>%
  rename(SSID = ssid, gender = gndr_cd) %>% 
  mutate(SSID = as.character(SSID))

tot_df <- left_join(df, eth)

orora <- tot_df %>% 
  filter(form == "ORora") %>% 
  mutate(gender = ifelse(gender == "f", "F", gender)) %>% 
  group_by(SSID, gender, ideaEligCode1, race_eth, grade, form) %>% 
  summarize(tot = sum(score, na.rm = TRUE),
            tot_poss = n()*4) %>% 
  ungroup()

nrow(orora)

orora %>%
  count(grade) 

orora %>% 
  count(gender) %>% 
  mutate(proportion = n/sum(n))

orora %>% 
  count(race_eth) %>% 
  mutate(proportion = n/sum(n))

orora %>% 
  summarize(av = mean(tot),
            perc = av/mean(tot_poss))

orora %>% 
  group_by(race_eth) %>% 
  summarize(av = mean(tot),
            perc = av/mean(tot_poss))

orora %>% 
  group_by(gender) %>% 
  summarize(av = mean(tot),
            perc = av/mean(tot_poss))

domain <- tot_df %>%
  filter(form == "ORora") %>% 
  mutate(itemNum = parse_number(itemNum),
         domain = case_when(itemNum <  6 ~ "(LOI) attention",
                            itemNum > 5 & itemNum < 11 ~ "(LOI) basic math",
                            itemNum > 10 & itemNum < 16 ~ "(COM) receptive",
                            itemNum > 15 & itemNum < 21 ~ "(COM) expressive")) 

av_domain <- domain %>% 
  group_by(domain) %>% 
  summarize(av = mean(score))     
```
