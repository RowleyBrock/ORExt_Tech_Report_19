
setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/ORExt_Final_Data_Analyses/FINAL_ODEPfiles_G3_11/Final_ODEPfiles_AMO")
library(tidyverse)
library(sundry)

#### read in the pfiles ===============================
g3ela <- read.csv("ELA2017_AMO_G3.csv")
g4ela <- read.csv("ELA2017_AMO_G4.csv")
g5ela <- read.csv("ELA2017_AMO_G5.csv")
g6ela <- read.csv("ELA2017_AMO_G6.csv")
g7ela <- read.csv("ELA2017_AMO_G7.csv")
g8ela <- read.csv("ELA2017_AMO_G8.csv")
g11ela <- read.csv("ELA2017_AMO_G11.csv")

g3Math <- read.csv("Math2017_AMO_G3.csv")
g4Math <- read.csv("Math2017_AMO_G4.csv")
g5Math <- read.csv("Math2017_AMO_G5.csv")
g6Math <- read.csv("Math2017_AMO_G6.csv")
g7Math <- read.csv("Math2017_AMO_G7.csv")
g8Math <- read.csv("Math2017_AMO_G8.csv")
g11Math <- read.csv("Math2017_AMO_G11.csv")

g5Sci <- read.csv("Sci2017_AMO_G5.csv")
g8Sci <- read.csv("Sci2017_AMO_G8.csv")
g11Sci <- read.csv("Sci2017_AMO_G11.csv")

head(g3ela)

## read in disability information ========================
disab <- read.csv("./IDEAExceptFile/Disab17.csv")
head(disab)

## merge all files =====================================

g3ela_dis <- merge(g3ela, disab, all.x=TRUE)
g4ela_dis <- merge(g4ela, disab, all.x=TRUE)
g5ela_dis <- merge(g5ela, disab, all.x=TRUE)
g6ela_dis <- merge(g6ela, disab, all.x=TRUE)
g7ela_dis <- merge(g7ela, disab, all.x=TRUE)
g8ela_dis <- merge(g8ela, disab, all.x=TRUE)
g11ela_dis <- merge(g11ela, disab, all.x=TRUE)
head(g3ela_dis)

ELA <- list(g3ela_dis, g4ela_dis, g5ela_dis, g6ela_dis, g7ela_dis, g8ela_dis, g11ela_dis)

g3Math_dis <- merge(g3Math, disab, all.x=TRUE)
g4Math_dis <- merge(g4Math, disab, all.x=TRUE)
g5Math_dis <- merge(g5Math, disab, all.x=TRUE)
g6Math_dis <- merge(g6Math, disab, all.x=TRUE)
g7Math_dis <- merge(g7Math, disab, all.x=TRUE)
g8Math_dis <- merge(g8Math, disab, all.x=TRUE)
g11Math_dis <- merge(g11Math, disab, all.x=TRUE)

Math <- list(g3Math_dis, g4Math_dis, g5Math_dis, g6Math_dis, g7Math_dis, g8Math_dis, g11Math_dis)

g5Sci_dis <- merge(g5Sci, disab, all.x=TRUE)
g8Sci_dis <- merge(g8Sci, disab, all.x=TRUE)
g11Sci_dis <- merge(g11Sci, disab, all.x=TRUE)

Sci <- list(g5Sci_dis, g8Sci_dis, g11Sci_dis)

## Create tables with n-sizes by disability=======

table(g3ela_dis$Disab)
table(g4ela_dis$Disab)
table(g5ela_dis$Disab)
table(g6ela_dis$Disab)
table(g7ela_dis$Disab)
table(g8ela_dis$Disab)
table(g11ela_dis$Disab)

table(g3Math_dis$Disab)
table(g4Math_dis$Disab)
table(g5Math_dis$Disab)
table(g6Math_dis$Disab)
table(g7Math_dis$Disab)
table(g8Math_dis$Disab)
table(g11Math_dis$Disab)

table(g5Sci_dis$Disab)
table(g8Sci_dis$Disab)
table(g11Sci_dis$Disab)

## students per grade assessed =========================
nrow(g3ela_dis)
nrow(g4ela_dis)
nrow(g5ela_dis)
nrow(g6ela_dis)
nrow(g7ela_dis)
nrow(g8ela_dis)
nrow(g11ela_dis)

nrow(g3Math_dis)
nrow(g4Math_dis)
nrow(g5Math_dis)
nrow(g6Math_dis)
nrow(g7Math_dis)
nrow(g8Math_dis)
nrow(g11Math_dis)

nrow(g5Sci_dis)
nrow(g8Sci_dis)
nrow(g11Sci_dis)

## try to do it more efficiently with lists and functions ++++++++
names(ELA) <- paste0("g", c(3:8, 11))
n_stats <- function(x) {
	as.data.frame(table(x[ ,ncol(x)]))
}
l <- lapply(ELA, n_stats)

library(purrr)
l <- map2(l, paste0("g", c(3:8, 11)), ~ {
		names(.x)[2] <- .y
return(.)
})

names(Math) <- paste0("g", c(3:8, 11))
n_stats <- function(x) {
	as.data.frame(table(x[ ,ncol(x)]))
}
l <- lapply(Math, n_stats)

library(purrr)
l <- map2(l, paste0("g", c(3:8, 11)), ~ {
		names(.x)[2] <- .y
return(.)
})

names(Sci) <- paste0("g", c(5,8,11))
n_stats <- function(x) {
	as.data.frame(table(x[ ,ncol(x)]))
}
l <- lapply(Sci, n_stats)

library(purrr)
l <- map2(l, paste0("g", c(5,8,11)), ~ {
		names(.x)[2] <- .y
return(.)
})


tbl <- Reduce(function(...) merge(..., by = "Var1"), l)
names(tbl)[1] <- "except"
tbl