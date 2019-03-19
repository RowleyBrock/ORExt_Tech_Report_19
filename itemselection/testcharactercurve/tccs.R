library(tidyverse)
library(readxl)
library(fs)
library(janitor)
theme_set(theme_minimal())

#Left Join all grade 3 Math files for difficulty.
g3standards <- read_xlsx("Math_All_Items_v5.xlsx", sheet = "G3Track") %>% 
  clean_names()
g3math_diff <- read_csv("14_17_itemdata/g3Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g3math_diff16 <- read_csv("14_17_itemdata/1516_g3MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g3math_diff17 <- read_csv("14_17_itemdata/1617_g3MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g3math_diff18 <- read_xlsx("14_17_itemdata/g3Mathifiles18_ItemPlanning_v4 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g3 <- left_join(g3standards, g3math_diff)
g3 <- left_join(g3, g3math_diff16)
g3 <- left_join(g3, g3math_diff17)
g3 <- left_join(g3, g3math_diff18)

View(g3)

#Left Join all grade 4 Math files for difficulty.
g4standards <- read_xlsx("Math_All_Items.xlsx", sheet = "G4Track") %>% 
  clean_names()
g4math_diff <- read_csv("14_17_itemdata/g4Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g4math_diff16 <- read_csv("14_17_itemdata/1516_g4MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g4math_diff17 <- read_csv("14_17_itemdata/1617_g4MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g4math_diff18 <- read_xlsx("14_17_itemdata/g4Mathifiles18_ItemPlanning_v3 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g4 <- left_join(g4standards, g4math_diff)
g4 <- left_join(g4, g4math_diff16)
g4 <- left_join(g4, g4math_diff17)
g4 <- left_join(g4, g4math_diff18)

View(g4)

#Left Join all grade 5 Math files for difficulty.
g5standards <- read_xlsx("Math_All_Items.xlsx", sheet = "G5Track") %>% 
  clean_names()
g5math_diff <- read_csv("14_17_itemdata/g5Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g5math_diff16 <- read_csv("14_17_itemdata/1516_g5MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g5math_diff17 <- read_csv("14_17_itemdata/1617_g5MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g5math_diff18 <- read_xlsx("14_17_itemdata/g5Mathifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g5 <- left_join(g5standards, g5math_diff)
g5 <- left_join(g5, g5math_diff16)
g5 <- left_join(g5, g5math_diff17)
g5 <- left_join(g5, g5math_diff18)

View(g5)

#Left Join all grade 6 Math files for difficulty.
g6standards <- read_xlsx("Math_All_Items.xlsx", sheet = "G6Track") %>% 
  clean_names()
g6math_diff <- read_csv("14_17_itemdata/g6Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g6math_diff16 <- read_csv("14_17_itemdata/1516_g6MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g6math_diff17 <- read_csv("14_17_itemdata/1617_g6MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g6math_diff18 <- read_xlsx("14_17_itemdata/g6Mathifiles18_ItemPlanning_v3 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g6 <- left_join(g6standards, g6math_diff)
g6 <- left_join(g6, g6math_diff16)
g6 <- left_join(g6, g6math_diff17)
g6 <- left_join(g6, g6math_diff18)

View(g6)

#Left Join all grade 7 Math files for difficulty.
g7standards <- read_xlsx("Math_All_Items.xlsx", sheet = "G7Track") %>% 
  clean_names()
g7math_diff <- read_csv("14_17_itemdata/g7Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g7math_diff16 <- read_csv("14_17_itemdata/1516_g7MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g7math_diff17 <- read_csv("14_17_itemdata/1617_g7MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g7math_diff18 <- read_xlsx("14_17_itemdata/g7Mathifiles18_ItemPlanning_v3 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g7 <- left_join(g7standards, g7math_diff)
g7 <- left_join(g7, g7math_diff16)
g7 <- left_join(g7, g7math_diff17)
g7 <- left_join(g7, g7math_diff18)

View(g7)

#Left Join all grade 8 Math files for difficulty.
g8standards <- read_xlsx("Math_All_Items.xlsx", sheet = "G8Track") %>% 
  clean_names()
g8math_diff <- read_csv("14_17_itemdata/g8Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g8math_diff16 <- read_csv("14_17_itemdata/1516_g8MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g8math_diff17 <- read_csv("14_17_itemdata/1617_g8MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g8math_diff18 <- read_xlsx("14_17_itemdata/g8Mathifiles18_ItemPlanning_v3 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g8 <- left_join(g8standards, g8math_diff)
g8 <- left_join(g8, g8math_diff16)
g8 <- left_join(g8, g8math_diff17)
g8 <- left_join(g8, g8math_diff18)

View(g8)

#Left Join all grade 11 Math files for difficulty.
g11standards <- read_xlsx("Math_All_Items_v5.xlsx", sheet = "G11Track") %>% 
  clean_names()
g11math_diff <- read_csv("14_17_itemdata/g11Math_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g11math_diff16 <- read_csv("14_17_itemdata/1516_g11MathIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g11math_diff17 <- read_csv("14_17_itemdata/1617_g11MathIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g11math_diff18 <- read_xlsx("14_17_itemdata/g11Mathifiles18_ItemPlanning_v2.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g11 <- left_join(g11standards, g11math_diff)
g11 <- left_join(g11, g11math_diff16)
g11 <- left_join(g11, g11math_diff17)
g11 <- left_join(g11, g11math_diff18)

View(g11)

write_csv(g3,'G3_Math_Items.csv')
          
write_csv(g4,'G4_Math_Items.csv')

write_csv(g5,'G5_Math_Items.csv')

write_csv(g6,'G6_Math_Items.csv')

write_csv(g7,'G7_Math_Items.csv')

write_csv(g8,'G8_Math_Items.csv')

write_csv(g11,'G11_Math_Items.csv')

#Left Join all grade 3 ELA files for difficulty.
g3ELAstandards <- read_xlsx("ELA_ALL_Items_v5.xlsx", sheet = "Gr 3") %>% 
  clean_names()
g3ela_diff <- read_csv("14_17_itemdata/g3ELA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g3ela_diff16 <- read_csv("14_17_itemdata/1516_g3ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g3ela_diff17 <- read_csv("14_17_itemdata/1617_g3ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g3ela_diff18 <- read_xlsx("14_17_itemdata/g3ELAifiles18_ItemPlanning_v3 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g3ela <- left_join(g3ELAstandards, g3ela_diff)
g3ela <- left_join(g3ela, g3ela_diff16)
g3ela <- left_join(g3ela, g3ela_diff17)
g3ela <- left_join(g3ela, g3ela_diff18)

View(g3ela)

#Left Join all grade 4 ELA files for difficulty.
g4ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 4") %>% 
  clean_names()
g4ela_diff <- read_csv("14_17_itemdata/g4ELA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g4ela_diff16 <- read_csv("14_17_itemdata/1516_g4ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g4ela_diff17 <- read_csv("14_17_itemdata/1617_g4ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g4ela_diff18 <- read_xlsx("14_17_itemdata/g4ELAifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g4ela <- left_join(g4ELAstandards, g4ela_diff)
g4ela <- left_join(g4ela, g4ela_diff16)
g4ela <- left_join(g4ela, g4ela_diff17)
g4ela <- left_join(g4ela, g4ela_diff18)

View(g4ela)

#Left Join all grade 5 ELA files for difficulty.
g5ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 5") %>% 
  clean_names()
g5ela_diff <- read_csv("14_17_itemdata/g5ELA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g5ela_diff16 <- read_csv("14_17_itemdata/1516_g5ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g5ela_diff17 <- read_csv("14_17_itemdata/1617_g5ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g5ela_diff18 <- read_xlsx("14_17_itemdata/g5ELAifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g5ela <- left_join(g5ELAstandards, g5ela_diff)
g5ela <- left_join(g5ela, g5ela_diff16)
g5ela <- left_join(g5ela, g5ela_diff17)
g5ela <- left_join(g5ela, g5ela_diff18)

View(g5ela)

#Left Join all grade 6 ELA files for difficulty.
g6ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 6") %>% 
  clean_names()
g6ela_diff <- read_csv("14_17_itemdata/g6ELA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g6ela_diff16 <- read_csv("14_17_itemdata/1516_g6ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g6ela_diff17 <- read_csv("14_17_itemdata/1617_g6ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g6ela_diff18 <- read_xlsx("14_17_itemdata/g6ELAifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g6ela <- left_join(g6ELAstandards, g6ela_diff)
g6ela <- left_join(g6ela, g6ela_diff16)
g6ela <- left_join(g6ela, g6ela_diff17)
g6ela <- left_join(g6ela, g6ela_diff18)

View(g6ela)

#Left Join all grade 7 ELA files for difficulty.
g7ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 7") %>% 
  clean_names()
g7ela_diff <- read_csv("14_17_itemdata/g7ELA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g7ela_diff16 <- read_csv("14_17_itemdata/1516_g7ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g7ela_diff17 <- read_csv("14_17_itemdata/1617_g7ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g7ela_diff18 <- read_xlsx("14_17_itemdata/g7ELAifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g7ela <- left_join(g7ELAstandards, g7ela_diff)
g7ela <- left_join(g7ela, g7ela_diff16)
g7ela <- left_join(g7ela, g7ela_diff17)
g7ela <- left_join(g7ela, g7ela_diff18)

View(g7ela)

#Left Join all grade 8 ELA files for difficulty.
g8ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 8") %>% 
  clean_names()
g8ela_diff <- read_csv("14_17_itemdata/g8ElA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g8ela_diff16 <- read_csv("14_17_itemdata/1516_g8ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g8ela_diff17 <- read_csv("14_17_itemdata/1617_g8ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g8ela_diff18 <- read_xlsx("14_17_itemdata/g8ELAifiles18_ItemPlanning_v2 copy.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g8ela <- left_join(g8ELAstandards, g8ela_diff)
g8ela <- left_join(g8ela, g8ela_diff16)
g8ela <- left_join(g8ela, g8ela_diff17)
g8ela <- left_join(g8ela, g8ela_diff18)

View(g8ela)

#Left Join all grade 11 ELA files for difficulty.
g11ELAstandards <- read_xlsx("ELA_All_Items_v5.xlsx", sheet = "Gr 11") %>% 
  clean_names()
g11ela_diff <- read_csv("14_17_itemdata/g11ElA_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g11ela_diff16 <- read_csv("14_17_itemdata/1516_g11ELAIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g11ela_diff17 <- read_csv("14_17_itemdata/1617_g11ELAIfiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g11ela_diff18 <- read_xlsx("14_17_itemdata/g11ELAifiles18_ItemPlanning_v2.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g11ela <- left_join(g11ELAstandards, g11ela_diff)
g11ela <- left_join(g11ela, g11ela_diff16)
g11ela <- left_join(g11ela, g11ela_diff17)
g11ela <- left_join(g11ela, g11ela_diff18)

View(g11ela)

write_csv(g3ela,'G3_ELA_Items.csv')

write_csv(g4ela,'G4_ELA_Items.csv')

write_csv(g5ela,'G5_ELA_Items.csv')

write_csv(g6ela,'G6_ELA_Items.csv')

write_csv(g7ela,'G7_ELA_Items.csv')

write_csv(g8ela,'G8_ELA_Items.csv')

write_csv(g11ela,'G11_ELA_Items.csv')

#Left Join all grade 5 Science files for difficulty.
g5Scistandards <- read_xlsx("Science_All_Items_v3.xlsx", sheet = "Grade 5") %>% 
  clean_names()
g5sci_diff <- read_csv("14_17_itemdata/g5Sci_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g5sci_diff16 <- read_csv("14_17_itemdata/1516_g5SciIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g5sci_diff17 <- read_csv("14_17_itemdata/1617_g5Sciifiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g5sci_diff18 <- read_xlsx("14_17_itemdata/g5Scienceifiles18_ItemPlanning_v2.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g5sci <- left_join(g5Scistandards, g5sci_diff)
g5sci <- left_join(g5sci, g5sci_diff16)
g5sci <- left_join(g5sci, g5sci_diff17)
g5sci <- left_join(g5sci, g5sci_diff18)

View(g5sci)

#Left Join all grade 8 Science files for difficulty.
g8Scistandards <- read_xlsx("Science_All_Items_v3.xlsx", sheet = "Grade 8") %>% 
  clean_names()
g8sci_diff <- read_csv("14_17_itemdata/g8Sci_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g8sci_diff16 <- read_csv("14_17_itemdata/1516_g8SciIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g8sci_diff17 <- read_csv("14_17_itemdata/1617_g8Sciifiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g8sci_diff18 <- read_xlsx("14_17_itemdata/g8Scienceifiles18_ItemPlanning_v2.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g8sci <- left_join(g8Scistandards, g8sci_diff)
g8sci <- left_join(g8sci, g8sci_diff16)
g8sci <- left_join(g8sci, g8sci_diff17)
g8sci <- left_join(g8sci, g8sci_diff18)

View(g8sci)

#Left Join all grade 11 Science files for difficulty.
g11Scistandards <- read_xlsx("Science_All_Items_v3.xlsx", sheet = "Grade 11") %>% 
  clean_names()
g11sci_diff <- read_csv("14_17_itemdata/g11Sci_AYP.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff15 = difficulty)

g11sci_diff16 <- read_csv("14_17_itemdata/1516_g11SciIfile.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff16 = difficulty)

g11sci_diff17 <- read_csv("14_17_itemdata/1617_g11Sciifiles17.csv") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff17 = difficulty)

g11sci_diff18 <- read_xlsx("14_17_itemdata/g11Scienceifiles18_ItemPlanning_v2.xlsx") %>% 
  clean_names() %>% 
  select(item_id, difficulty) %>% 
  rename(diff18 = difficulty)

g11sci <- left_join(g11Scistandards, g11sci_diff)
g11sci <- left_join(g11sci, g11sci_diff16)
g11sci <- left_join(g11sci, g11sci_diff17)
g11sci <- left_join(g11sci, g11sci_diff18)

View(g11sci)

write_csv(g5sci,'G5_Science_Items.csv')
write_csv(g8sci,'G8_Science_Items.csv')
write_csv(g11sci,'G11_Science_Items.csv')


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
                       summarize(tot = sum(prob)) %>% 
                       mutate(theta = seq(-3, 3, .01))))

probs %>% 
  select(content, grade, probs) %>% 
  unnest() %>% 
  ggplot(aes(theta, tot, color = grade)) +
    geom_line(lwd = 1.3) + 
    scale_color_brewer(palette = "Set1")+
    facet_wrap(~content)
