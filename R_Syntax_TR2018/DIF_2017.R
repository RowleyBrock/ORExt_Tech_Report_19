setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/ORExt_Final_Data_Analyses/2017CleanData")
library(tidyverse)
library(sundry)
#install.packages("difR")
library(difR)

####======read in data files=====================
## ELA
G3ELA <- read.csv("g3ELA.csv")
G4ELA <- read.csv("g4ELA.csv")
G5ELA <- read.csv("g5ELA.csv")
G6ELA <- read.csv("g6ELA.csv")
G7ELA <- read.csv("g7ELA.csv")
G8ELA <- read.csv("g8ELA.csv")
G11ELA <- read.csv("g11ELA.csv")

## Math
G3Math <- read.csv("g3Math.csv")
G4Math <- read.csv("g4Math.csv")
G5Math <- read.csv("g5Math.csv")
G6Math <- read.csv("g6Math.csv")
G7Math <- read.csv("g7Math.csv")
G8Math <- read.csv("g8Math.csv")
G11Math <- read.csv("g11Math.csv")

## Science
G5Sci <- read.csv("g5Sci.csv")
G8Sci <- read.csv("g8Sci.csv")
G11Sci <- read.csv("g11Sci.csv")

## Race ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Develop White/NonWhite Variable
G3ELA$White <- as.numeric(G3ELA$EthnicCd)
G3ELA$White <- ifelse(G3ELA$White == 7, 1, 0)

G4ELA$White <- as.numeric(G4ELA$EthnicCd)
G4ELA$White <- ifelse(G4ELA$White == 7, 1, 0)

G5ELA$White <- as.numeric(G5ELA$EthnicCd)
G5ELA$White <- ifelse(G5ELA$White == 8, 1, 0)

G6ELA$White <- as.numeric(G6ELA$EthnicCd)
G6ELA$White <- ifelse(G6ELA$White == 7, 1, 0)

G7ELA$White <- as.numeric(G7ELA$EthnicCd)
G7ELA$White <- ifelse(G7ELA$White == 7, 1, 0)

G8ELA$White <- as.numeric(G8ELA$EthnicCd)
G8ELA$White <- ifelse(G8ELA$White == 7, 1, 0)

G11ELA$White <- as.numeric(G11ELA$EthnicCd)
G11ELA$White <- ifelse(G11ELA$White == 7, 1, 0)

### Math

G3Math$White <- as.numeric(G3Math$EthnicCd)
G3Math$White <- ifelse(G3Math$White == 7, 1, 0)

G4Math$White <- as.numeric(G4Math$EthnicCd)
G4Math$White <- ifelse(G4Math$White == 7, 1, 0)

G5Math$White <- as.numeric(G5Math$EthnicCd)
G5Math$White <- ifelse(G5Math$White == 8, 1, 0)

G6Math$White <- as.numeric(G6Math$EthnicCd)
G6Math$White <- ifelse(G6Math$White == 7, 1, 0)

G7Math$White <- as.numeric(G7Math$EthnicCd)
G7Math$White <- ifelse(G7Math$White == 7, 1, 0)

G8Math$White <- as.numeric(G8Math$EthnicCd)
G8Math$White <- ifelse(G8Math$White == 7, 1, 0)

G11Math$White <- as.numeric(G11Math$EthnicCd)
G11Math$White <- ifelse(G11Math$White == 7, 1, 0)

## Science
G5Sci$White <- as.numeric(G5Sci$EthnicCd)
G5Sci$White <- ifelse(G5Sci$White == 8, 1, 0)

G8Sci$White <- as.numeric(G8Sci$EthnicCd)
G8Sci$White <- ifelse(G8Sci$White == 7, 1, 0)

G11Sci$White <- as.numeric(G11Sci$EthnicCd)
G11Sci$White <- ifelse(G11Sci$White == 7, 1, 0)

## Make the Gndr code a numeric Male variable

## ELA
G3ELA$Male <- as.numeric(G3ELA$Gndr)
G3ELA$Male <- ifelse(G3ELA$Male == 2, 1, 0)

G4ELA$Male <- as.numeric(G4ELA$Gndr)
G4ELA$Male <- ifelse(G4ELA$Male == 2, 1, 0)

G5ELA$Male <- as.numeric(G5ELA$Gndr)
G5ELA$Male <- ifelse(G5ELA$Male == 2, 1, 0)

G6ELA$Male <- as.numeric(G6ELA$Gndr)
G6ELA$Male <- ifelse(G6ELA$Male == 2, 1, 0)

G7ELA$Male <- as.numeric(G7ELA$Gndr)
G7ELA$Male <- ifelse(G7ELA$Male == 2, 1, 0)

G8ELA$Male <- as.numeric(G8ELA$Gndr)
G8ELA$Male <- ifelse(G8ELA$Male == 2, 1, 0)

G11ELA$Male <- as.numeric(G11ELA$Gndr)
G11ELA$Male <- ifelse(G11ELA$Male == 2, 1, 0)

## Math
G3Math$Male <- as.numeric(G3Math$Gndr)
G3Math$Male <- ifelse(G3Math$Male == 2, 1, 0)

G4Math$Male <- as.numeric(G4Math$Gndr)
G4Math$Male <- ifelse(G4Math$Male == 2, 1, 0)

G5Math$Male <- as.numeric(G5Math$Gndr)
G5Math$Male <- ifelse(G5Math$Male == 2, 1, 0)

G6Math$Male <- as.numeric(G6Math$Gndr)
G6Math$Male <- ifelse(G6Math$Male == 2, 1, 0)

G7Math$Male <- as.numeric(G7Math$Gndr)
G7Math$Male <- ifelse(G7Math$Male == 2, 1, 0)

G8Math$Male <- as.numeric(G8Math$Gndr)
G8Math$Male <- ifelse(G8Math$Male == 2, 1, 0)

G11Math$Male <- as.numeric(G11Math$Gndr)
G11Math$Male <- ifelse(G11Math$Male == 2, 1, 0)

## Science
G5Sci$Male <- as.numeric(G5Sci$Gndr)
G5Sci$Male <- ifelse(G5Sci$Male == 2, 1, 0)

G8Sci$Male <- as.numeric(G8Sci$Gndr)
G8Sci$Male <- ifelse(G8Sci$Male == 2, 1, 0)

G11Sci$Male <- as.numeric(G11Sci$Gndr)
G11Sci$Male <- ifelse(G11Sci$Male == 2, 1, 0)

## Select only desired variables

G3ELA <- G3ELA[ , c(1, 13:62)]
G4ELA <- G4ELA[ , c(1, 13:62)]
G5ELA <- G5ELA[ , c(1, 13:62)]
G6ELA <- G6ELA[ , c(1, 13:62)]
G7ELA <- G7ELA[ , c(1, 13:62)]
G8ELA <- G8ELA[ , c(1, 13:62)]
G11ELA <- G11ELA[ , c(1, 13:62)]

G3Math <- G3Math[ , c(1, 13:62)]
G4Math <- G4Math[ , c(1, 13:62)]
G5Math <- G5Math[ , c(1, 13:62)]
G6Math <- G6Math[ , c(1, 13:62)]
G7Math <- G7Math[ , c(1, 13:62)]
G8Math <- G8Math[ , c(1, 13:62)]
G11Math <- G11Math[ , c(1, 13:62)]

G5Sci <- G5Sci[ , c(1, 13:62)]
G8Sci <- G8Sci[ , c(1, 13:62)]
G11Sci <- G11Sci[ , c(1, 13:62)]

## Put all of the variables in the order desired

G3ELA <- G3ELA[ , c(1,50, 51, 2:49)]
G4ELA <- G4ELA[ , c(1,50, 51, 2:49)]
G5ELA <- G5ELA[ , c(1,50, 51, 2:49)]
G6ELA <- G6ELA[ , c(1,50, 51, 2:49)]
G7ELA <- G7ELA[ , c(1,50, 51, 2:49)]
G8ELA <- G8ELA[ , c(1,50, 51, 2:49)]
G11ELA <- G11ELA[ , c(1,50, 51, 2:49)]

G3Math <- G3Math[ , c(1,50, 51, 2:49)]
G4Math <- G4Math[ , c(1,50, 51, 2:49)]
G5Math <- G5Math[ , c(1,50, 51, 2:49)]
G6Math <- G6Math[ , c(1,50, 51, 2:49)]
G7Math <- G7Math[ , c(1,50, 51, 2:49)]
G8Math <- G8Math[ , c(1,50, 51, 2:49)]
G11Math <- G11Math[ , c(1,50, 51, 2:49)]

G5Sci <- G5Sci[ , c(1,50, 51, 2:49)]
G8Sci <- G8Sci[ , c(1,50, 51, 2:49)]
G11Sci <- G11Sci[ , c(1,50, 51, 2:49)]

## Tables of respective grade level/content area 
## White
table(G3ELA$White)
nrow(G3ELA)
table(G4ELA$White)
nrow(G4ELA)
table(G5ELA$White)
nrow(G5ELA)
table(G6ELA$White)
nrow(G6ELA)
table(G7ELA$White)
nrow(G7ELA)
table(G8ELA$White)
nrow(G8ELA)
table(G11ELA$White)
nrow(G11ELA)

table(G3Math$White)
nrow(G3Math)
table(G4Math$White)
nrow(G4Math)
table(G5Math$White)
nrow(G5Math)
table(G6Math$White)
nrow(G6Math)
table(G7Math$White)
nrow(G7Math)
table(G8Math$White)
nrow(G8Math)
table(G11Math$White)
nrow(G11Math)

table(G5Sci$White)
nrow(G5Sci)
table(G8Sci$White)
nrow(G8Sci)
table(G11Sci$White)
nrow(G11Sci)

## Male
table(G3ELA$Male)
nrow(G3ELA)
table(G4ELA$Male)
nrow(G4ELA)
table(G5ELA$Male)
nrow(G5ELA)
table(G6ELA$Male)
nrow(G6ELA)
table(G7ELA$Male)
nrow(G7ELA)
table(G8ELA$Male)
nrow(G8ELA)
table(G11ELA$Male)
nrow(G11ELA)

table(G3Math$Male)
nrow(G3Math)
table(G4Math$Male)
nrow(G4Math)
table(G5Math$Male)
nrow(G5Math)
table(G6Math$Male)
nrow(G6Math)
table(G7Math$Male)
nrow(G7Math)
table(G8Math$Male)
nrow(G8Math)
table(G11Math$Male)
nrow(G11Math)

table(G5Sci$Male)
nrow(G5Sci)
table(G8Sci$Male)
nrow(G8Sci)
table(G11Sci$Male)
nrow(G11Sci)

## DIF analyses for White ++++++++++++++++++++++++++++++++++++++++++++++++
g3ELA_difW <- difMH(G3ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g4ELA_difW <- difMH(G4ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g5ELA_difW <- difMH(G5ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g6ELA_difW <- difMH(G6ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g7ELA_difW <- difMH(G7ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g8ELA_difW <- difMH(G8ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g11ELA_difW <- difMH(G11ELA[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)

EdifW <- list(g3ELA_difW,
	g4ELA_difW,
	g5ELA_difW,
	g6ELA_difW,
	g7ELA_difW,
	g8ELA_difW,
	g11ELA_difW)

unlist(lapply(EdifW, function(x) x$names[x$DIFitems]))

g3Math_difW <- difMH(G3Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g4Math_difW <- difMH(G4Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g5Math_difW <- difMH(G5Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g6Math_difW <- difMH(G6Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g7Math_difW <- difMH(G7Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g8Math_difW <- difMH(G8Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g11Math_difW <- difMH(G11Math[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)

MdifW <- list(g3Math_difW,
	g4Math_difW,
	g5Math_difW,
	g6Math_difW,
	g7Math_difW,
	g8Math_difW,
	g11Math_difW)

unlist(lapply(MdifW, function(x) x$names[x$DIFitems]))

g5Sci_difW <- difMH(G5Sci[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g8Sci_difW <- difMH(G8Sci[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)
g11Sci_difW <- difMH(G11Sci[, -c(1,3)], group = 1, focal.name = 1, purify = TRUE)

SdifW <- list(g5Sci_difW,
	g8Sci_difW,
	g11Sci_difW)

unlist(lapply(SdifW, function(x) x$names[x$DIFitems]))

## DIF analyses for Male +++++++++++++++++++++++++++++++++++++++++++++++++++
g3ELA_difM <- difMH(G3ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g4ELA_difM <- difMH(G4ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g5ELA_difM <- difMH(G5ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g6ELA_difM <- difMH(G6ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g7ELA_difM <- difMH(G7ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g8ELA_difM <- difMH(G8ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g11ELA_difM <- difMH(G11ELA[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)

EdifM <- list(g3ELA_difM,
	g4ELA_difM,
	g5ELA_difM,
	g6ELA_difM,
	g7ELA_difM,
	g8ELA_difM,
	g11ELA_difM)

unlist(lapply(EdifM, function(x) x$names[x$DIFitems]))

g3Math_difM <- difMH(G3Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g4Math_difM <- difMH(G4Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g5Math_difM <- difMH(G5Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g6Math_difM <- difMH(G6Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g7Math_difM <- difMH(G7Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g8Math_difM <- difMH(G8Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g11Math_difM <- difMH(G11Math[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)

MdifM <- list(g3Math_difM,
	g4Math_difM,
	g5Math_difM,
	g6Math_difM,
	g7Math_difM,
	g8Math_difM,
	g11Math_difM)

unlist(lapply(MdifM, function(x) x$names[x$DIFitems]))


g5Sci_difM <- difMH(G5Sci[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g8Sci_difM <- difMH(G8Sci[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)
g11Sci_difM <- difMH(G11Sci[, -c(1,2)], group = 1, focal.name = 1, purify = TRUE)

SdifM <- list(g5Sci_difM,
	g8Sci_difM,
	g11Sci_difM)

unlist(lapply(SdifM, function(x) x$names[x$DIFitems]))

### Extra coding from previous efforts (not used) +++++++++
### Extract alpha MH values
# g3ela_alphaMH <- g3ela_dif$alphaMH

# ### Create beta MH values
# g3ela_betaMH <- log(g3ela_alphaMH)

# ### Create delta MH 
# g3ela_deltaMH <- -2.35*log(g3ela_alphaMH)

# ### Compile results into dataframe
# g3ela_estimates <- data.frame(row.names = names(g3ela_dif)[-1], 
#   alpha = g3ela_alphaMH, beta = g3ela_betaMH, delta = g3ela_deltaMH)

# g3ela_estimates

plot(g11Sci_difM)
plot(g11Sci_difW)

?difMH

