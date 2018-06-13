
setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/ORExt_Final_Data_Analyses/FINAL_ODEPfiles_G3_11")
library(tidyverse)
library(scales)
library(reshape)

#### read in the pfiles ===============================
g3ela <- read.csv("ELA_Grade3_FinalPfile.csv")
g4ela <- read.csv("ELA_Grade4_FinalPfile.csv")
g5ela <- read.csv("ELA_Grade5_FinalPfile.csv")
g6ela <- read.csv("ELA_Grade6_FinalPfile.csv")
g7ela <- read.csv("ELA_Grade7_FinalPfile.csv")
g8ela <- read.csv("ELA_Grade8_FinalPfile.csv")
g11ela <- read.csv("ELA_Grade11_FinalPfile.csv")

g3Math <- read.csv("Math_Grade3_FinalPfile.csv")
g4Math <- read.csv("Math_Grade4_FinalPfile.csv")
g5Math <- read.csv("Math_Grade5_FinalPfile.csv")
g6Math <- read.csv("Math_Grade6_FinalPfile.csv")
g7Math <- read.csv("Math_Grade7_FinalPfile.csv")
g8Math <- read.csv("Math_Grade8_FinalPfile.csv")
g11Math <- read.csv("Math_Grade11_FinalPfile.csv")

g5Sci <- read.csv("Sci_Grade5_FinalPfile.csv")
g8Sci <- read.csv("Sci_Grade8_FinalPfile.csv")
g11Sci <- read.csv("Sci_Grade11_FinalPfile.csv")


### percent function

percent <- function(x, y) {
				per <- (x/y)
return(per)
}


######## analyze percent proficient based on RIT scores

g3ela$AMO_lvl <- ifelse(g3ela$ElaRIT <= 191, 1,
		ifelse (g3ela$ElaRIT > 191 & g3ela$ElaRIT < 213, 2,
		ifelse (g3ela$ElaRIT >= 213 & g3ela$ElaRIT < 228, 3,
		ifelse (g3ela$ElaRIT >= 228, 4, 0))))

g4ela$AMO_lvl <- ifelse(g4ela$ElaRIT <= 199, 1,
		ifelse (g4ela$ElaRIT > 199 & g4ela$ElaRIT < 213, 2,
		ifelse (g4ela$ElaRIT >= 213 & g4ela$ElaRIT < 228, 3,
		ifelse (g4ela$ElaRIT >= 228, 4, 0))))

g5ela$AMO_lvl <- ifelse(g5ela$ElaRIT <= 201, 1,
		ifelse (g5ela$ElaRIT > 201 & g5ela$ElaRIT < 220, 2,
		ifelse (g5ela$ElaRIT >= 220 & g5ela$ElaRIT < 232, 3,
		ifelse (g5ela$ElaRIT >= 232, 4, 0))))

g6ela$AMO_lvl <- ifelse(g6ela$ElaRIT <= 204, 1,
		ifelse (g6ela$ElaRIT > 204 & g6ela$ElaRIT < 220, 2,
		ifelse (g6ela$ElaRIT >= 220 & g6ela$ElaRIT < 233, 3,
		ifelse (g6ela$ElaRIT >= 233, 4, 0))))

g7ela$AMO_lvl <- ifelse(g7ela$ElaRIT <= 207, 1,
		ifelse (g7ela$ElaRIT > 207 & g7ela$ElaRIT < 222, 2,
		ifelse (g7ela$ElaRIT >= 222 & g7ela$ElaRIT < 236, 3,
		ifelse (g7ela$ElaRIT >= 236, 4, 0))))

g8ela$AMO_lvl <- ifelse(g8ela$ElaRIT <= 212, 1,
		ifelse (g8ela$ElaRIT > 212 & g8ela$ElaRIT < 224, 2,
		ifelse (g8ela$ElaRIT >= 224 & g8ela$ElaRIT < 236, 3,
		ifelse (g8ela$ElaRIT >= 236, 4, 0))))

g11ela$AMO_lvl <- ifelse(g11ela$ElaRIT <= 898, 1,
		ifelse (g11ela$ElaRIT > 898 & g11ela$ElaRIT < 920, 2,
		ifelse (g11ela$ElaRIT >= 920 & g11ela$ElaRIT < 927, 3,
		ifelse (g11ela$ElaRIT >= 927, 4, 0))))

g3elaAMO <- table(g3ela$AMO_lvl)
g4elaAMO <- table(g4ela$AMO_lvl)
g5elaAMO <- table(g5ela$AMO_lvl)
g6elaAMO <- table(g6ela$AMO_lvl)
g7elaAMO <- table(g7ela$AMO_lvl)
g8elaAMO <- table(g8ela$AMO_lvl)
g11elaAMO <- table(g11ela$AMO_lvl)

g3elaAMO <- as.data.frame(g3elaAMO)
g4elaAMO <- as.data.frame(g4elaAMO)
g5elaAMO <- as.data.frame(g5elaAMO)
g6elaAMO <- as.data.frame(g6elaAMO)
g7elaAMO <- as.data.frame(g7elaAMO)
g8elaAMO <- as.data.frame(g8elaAMO)
g11elaAMO <- as.data.frame(g11elaAMO)


perc_prof <- function(x, y) {
	n <- count(x$y)
		for (i in levels(x)) {
		lvl_ct <- count(x[i])
		pp <- (lvl_ct/n)
		return(table(pp))
	}
}
	

pFun <- function(tbl, color, grade, contentArea) {
	p <- ggplot(tbl, aes(Var1, Freq)) + geom_bar(stat = "identity", fill = color) 
	p +	geom_text(aes(label = sprintf("%.2f%%", Freq / sum(Freq) * 100)), vjust = -0.5) + 
		labs(x = "AMO Performance Level", y = "Frequency", title = paste("Grade", grade, contentArea)) +
		theme_classic()
}

pFun(g3elaAMO, "steelblue", 3, "ELA")
pFun(g4elaAMO, "steelblue", 4, "ELA")
pFun(g5elaAMO, "steelblue", 5, "ELA")
pFun(g6elaAMO, "steelblue", 6, "ELA")
pFun(g7elaAMO, "steelblue", 7, "ELA")
pFun(g8elaAMO, "steelblue", 8, "ELA")
pFun(g11elaAMO, "steelblue", 11, "ELA")

##### Math Performance Level calculations and plots =================================
g3Math$AMO_lvl <- ifelse(g3Math$MathRIT <= 191, 1,
		ifelse (g3Math$MathRIT > 191 & g3Math$MathRIT < 201, 2,
		ifelse (g3Math$MathRIT >= 201 & g3Math$MathRIT < 218, 3,
		ifelse (g3Math$MathRIT >= 218, 4, 0))))

g4Math$AMO_lvl <- ifelse(g4Math$MathRIT <= 192, 1,
		ifelse (g4Math$MathRIT > 192 & g4Math$MathRIT < 206, 2,
		ifelse (g4Math$MathRIT >= 206 & g4Math$MathRIT < 219, 3,
		ifelse (g4Math$MathRIT >= 219, 4, 0))))

g5Math$AMO_lvl <- ifelse(g5Math$MathRIT <= 192, 1,
		ifelse (g5Math$MathRIT > 192 & g5Math$MathRIT < 206, 2,
		ifelse (g5Math$MathRIT >= 206 & g5Math$MathRIT < 220, 3,
		ifelse (g5Math$MathRIT >= 220, 4, 0))))

g6Math$AMO_lvl <- ifelse(g6Math$MathRIT <= 203, 1,
		ifelse (g6Math$MathRIT > 203 & g6Math$MathRIT < 208, 2,
		ifelse (g6Math$MathRIT >= 208 & g6Math$MathRIT < 222, 3,
		ifelse (g6Math$MathRIT >= 222, 4, 0))))

g7Math$AMO_lvl <- ifelse(g7Math$MathRIT <= 206, 1,
		ifelse (g7Math$MathRIT > 206 & g7Math$MathRIT < 209, 2,
		ifelse (g7Math$MathRIT >= 209 & g7Math$MathRIT < 223, 3,
		ifelse (g7Math$MathRIT >= 223, 4, 0))))

g8Math$AMO_lvl <- ifelse(g8Math$MathRIT <= 207, 1,
		ifelse (g8Math$MathRIT > 207 & g8Math$MathRIT < 212, 2,
		ifelse (g8Math$MathRIT >= 212 & g8Math$MathRIT < 226, 3,
		ifelse (g8Math$MathRIT >= 226, 4, 0))))


g11Math$AMO_lvl <- ifelse(g11Math$MathRIT <= 900, 1,
		ifelse (g11Math$MathRIT > 900 & g11Math$MathRIT < 907, 2,
		ifelse (g11Math$MathRIT >= 907 & g11Math$MathRIT < 922, 3,
		ifelse (g11Math$MathRIT >= 922, 4, 0))))

g3MathAMO <- table(g3Math$AMO_lvl)
g4MathAMO <- table(g4Math$AMO_lvl)
g5MathAMO <- table(g5Math$AMO_lvl)
g6MathAMO <- table(g6Math$AMO_lvl)
g7MathAMO <- table(g7Math$AMO_lvl)
g8MathAMO <- table(g8Math$AMO_lvl)
g11MathAMO <- table(g11Math$AMO_lvl)

g3MathAMO <- as.data.frame(g3MathAMO)
g4MathAMO <- as.data.frame(g4MathAMO)
g5MathAMO <- as.data.frame(g5MathAMO)
g6MathAMO <- as.data.frame(g6MathAMO)
g7MathAMO <- as.data.frame(g7MathAMO)
g8MathAMO <- as.data.frame(g8MathAMO)
g11MathAMO <- as.data.frame(g11MathAMO)


pFun(g3MathAMO, "dark green", 3, "Math")
pFun(g4MathAMO, "dark green", 4, "Math")
pFun(g5MathAMO, "dark green", 5, "Math")
pFun(g6MathAMO, "dark green", 6, "Math")
pFun(g7MathAMO, "dark green", 7, "Math")
pFun(g8MathAMO, "dark green", 8, "Math")
pFun(g11MathAMO, "dark green", 11, "Math")

##### Science Performance Level calculations and plots 

g5Sci$AMO_lvl <- ifelse(g5Sci$SciRIT <= 505, 1,
		ifelse (g5Sci$SciRIT > 505 & g5Sci$SciRIT < 517, 2,
		ifelse (g5Sci$SciRIT >= 517 & g5Sci$SciRIT < 530, 3,
		ifelse (g5Sci$SciRIT >= 530, 4, 0))))

g8Sci$AMO_lvl <- ifelse(g8Sci$SciRIT <= 809, 1,
		ifelse (g8Sci$SciRIT > 809 & g8Sci$SciRIT < 820, 2,
		ifelse (g8Sci$SciRIT >= 820 & g8Sci$SciRIT < 831, 3,
		ifelse (g8Sci$SciRIT >= 831, 4, 0))))

g11Sci$AMO_lvl <- ifelse(g11Sci$SciRIT <= 900, 1,
		ifelse (g11Sci$SciRIT > 900 & g11Sci$SciRIT < 914, 2,
		ifelse (g11Sci$SciRIT >= 914 & g11Sci$SciRIT < 929, 3,
		ifelse (g11Sci$SciRIT >= 929, 4, 0))))

g5SciAMO <- table(g5Sci$AMO_lvl)
g8SciAMO <- table(g8Sci$AMO_lvl)
g11SciAMO <- table(g11Sci$AMO_lvl)

g5SciAMO <- as.data.frame(g5SciAMO)
g8SciAMO <- as.data.frame(g8SciAMO)
g11SciAMO <- as.data.frame(g11SciAMO)

pFun(g5SciAMO, "dark red", 5, "Science")
pFun(g8SciAMO, "dark red", 8, "Science")
pFun(g11SciAMO, "dark red", 11, "Science")

##Write Final ODE PFiles with AMO Levels Included
dir.create("Final_ODEPfiles_AMO")
setwd("./Final_ODEPfiles_AMO")

## generate final csv files
write.csv(g3ela, "ELA2017_AMO_G3.csv")
write.csv(g4ela, "ELA2017_AMO_G4.csv")
write.csv(g5ela, "ELA2017_AMO_G5.csv")
write.csv(g6ela, "ELA2017_AMO_G6.csv")
write.csv(g7ela, "ELA2017_AMO_G7.csv")
write.csv(g8ela, "ELA2017_AMO_G8.csv")
write.csv(g11ela, "ELA2017_AMO_G11.csv")

write.csv(g3Math, "Math2017_AMO_G3.csv")
write.csv(g4Math, "Math2017_AMO_G4.csv")
write.csv(g5Math, "Math2017_AMO_G5.csv")
write.csv(g6Math, "Math2017_AMO_G6.csv")
write.csv(g7Math, "Math2017_AMO_G7.csv")
write.csv(g8Math, "Math2017_AMO_G8.csv")
write.csv(g11Math, "Math2017_AMO_G11.csv")

write.csv(g5Sci, "Sci2017_AMO_G5.csv")
write.csv(g8Sci, "Sci2017_AMO_G8.csv")
write.csv(g11Sci, "Sci2017_AMO_G11.csv")
