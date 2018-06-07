library(tidyverse)
d <- read_csv("./Math_2017/Math2017_AMO_G3.csv")
d
str(d)
Math2017_AMO_G3.csv
d
head(d, n=12)

d
library (ggplot2)
library(ggthemes)
ggplot(d, aes(x=Infit, y=Outfit, color = EthnicCd)) + 
  geom_plot() +
  geom_smooth(se=FALSE) +
  theme_calc()
?geom_histogram
ggplot(d, aes(Theta)) +
geom_histogram() +
  facet_wrap(~EthnicCd)

ggplot(d, aes(Theta)) +
  geom_histogram(aes(fill = factor(AMO_lvl))) +
  facet_wrap(~BlackRaceFg)

d %>% 
  group_by(EthnicCd) %>% 
  count(AMO_lvl) %>% 
  ggplot(aes(AMO_lvl, n)) +
    geom_bar(stat = "identity") +
    facet_wrap(~EthnicCd)


d %>% 
  group_by(EthnicCd) %>% 
  count(AMO_lvl) %>%
  mutate(prop = n/sum(n)) %>% 
  ggplot(aes(AMO_lvl, prop)) +
  geom_bar(aes(fill = EthnicCd), 
           stat = "identity",  
           position = "dodge") +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  labs(x = "AMO", 
       y = "Proportion", 
       title = "What up dog?", 
       subtitle = "yeah") + 
  theme(legend.position = "bottom", 
        legend.direction = "horizontal") + theme(panel.grid.major = element_line(size = 0.9, 
    linetype = "blank"), panel.grid.minor = element_line(size = 1.5, 
    linetype = "dotdash"), panel.background = element_rect(fill = "forestgreen", 
    linetype = "longdash"), plot.background = element_rect(fill = "cadetblue2", 
    linetype = "dotdash"), legend.background = element_rect(fill = "dodgerblue2"))
 + theme(panel.grid.major = element_line(colour = "khaki3", 
    linetype = "dashed"), panel.grid.minor = element_line(linetype = "longdash"), 
    panel.background = element_rect(fill = "green", 
        colour = "azure", size = 0.6, linetype = "solid"), 
    plot.background = element_rect(fill = "cadetblue", 
        colour = "aliceblue"))