library(tidyverse)
ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth(aes(col = factor(cyl)))

ggplot(mpg, aes(x = factor(cyl), y = cty)) +
  geom_boxplot() +
  geom_jitter(aes(color = manufacturer))

# Not run, just example code
library(rio)
d <- import("file.sav", setclass = "tbl_df") # setclass argument is optional, to set it as a tibble

# Install r2Winsteps
# devtools::install_github("DJAnderson07/r2Winsteps")
library(r2Winsteps)
itms <- select(science, starts_with("item"))
dems <- select(science, Sex, LastName, FirstName, MiddleName)
pars <- runWinsteps(itms)



