library(tidyverse)
library(fs)
library(janitor)

orora_file <- dir_ls(file.path("data", "raw"))
orora_file <- orora_file[grep("XO", orora_file)]
orora <- read_delim(orora_file, delim = "|") %>% 
  clean_names("old_janitor")

nrow(orora)

# Table 1
orora %>% 
  count(ssidenrlgrdcd)

orora %>% 
  count(gndr) %>% 
  mutate(n/sum(n))

orora %>% 
  count(ethniccd) %>% 
  mutate(n/sum(n))

orora %>% 
  gather(item, response, starts_with("item")) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))
  
# LOI domain 1-10
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item < 11) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# LOI attention 1-5
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item < 6) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# LOI attention 6-10
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 5 & item < 11) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# LOI communication 11-20
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 10) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# LOI receptive language 11-15
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 10 & item < 16) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# LOI expressive language 16-20
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 15) %>% 
  group_by(ssid) %>% 
  summarize(score = sum(response),
            tot_poss = n()*4) %>% 
  ungroup() %>% 
  summarize(mean = mean(score),
            perc = mean/mean(tot_poss))

# Table 1 (you can calculate % on your own)
orora %>% 
  group_by(ssidenrlgrdcd) %>% 
  count()

# LOI domain 1-10
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item < 11) %>% 
  summarize(mean = mean(response))

# LOI attention 1-5
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item < 6) %>% 
  summarize(mean = mean(response))

# LOI attention 6-10
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 5 & item < 11) %>% 
  summarize(mean = mean(response))

# LOI communication 11-20
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 10) %>% 
  summarize(mean = mean(response))

# LOI receptive language 11-15
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 10 & item < 16) %>% 
  summarize(mean = mean(response))

# LOI expressive language 16-20
orora %>% 
  gather(item, response, starts_with("item")) %>% 
  mutate(item = parse_number(item)) %>% 
  filter(item > 15) %>% 
  summarize(mean = mean(response))
