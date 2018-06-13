## set working drive to item parameter files

setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/2017TechnicalReport/2017ItemParameters")

install.packages("cacIRT")
library(cacIRT)

## Read in ifiles
#ELA
g3elaI <- read.csv("g3ELAifiles17.csv")
g3emat <- matrix(c(rep(1, nrow(g3elaI)), g3elaI$Difficulty, rep(0, nrow(g3elaI))), ncol = 3)

g4elaI <- read.csv("g4ELAifiles17.csv")
g4emat <- matrix(c(rep(1, nrow(g4elaI)), g4elaI$Difficulty, rep(0, nrow(g4elaI))), ncol = 3)

g5elaI <- read.csv("g5ELAifiles17.csv")
g5emat <- matrix(c(rep(1, nrow(g5elaI)), g5elaI$Difficulty, rep(0, nrow(g5elaI))), ncol = 3)

g6elaI <- read.csv("g6ELAifiles17.csv")
g6emat <- matrix(c(rep(1, nrow(g6elaI)), g6elaI$Difficulty, rep(0, nrow(g6elaI))), ncol = 3)

g7elaI <- read.csv("g7ELAifiles17.csv")
g7emat <- matrix(c(rep(1, nrow(g7elaI)), g7elaI$Difficulty, rep(0, nrow(g7elaI))), ncol = 3)

g8elaI <- read.csv("g8ELAifiles17.csv")
g8emat <- matrix(c(rep(1, nrow(g8elaI)), g8elaI$Difficulty, rep(0, nrow(g8elaI))), ncol = 3)

g11elaI <- read.csv("g11ELAifiles17.csv")
g11emat <- matrix(c(rep(1, nrow(g11elaI)), g11elaI$Difficulty, rep(0, nrow(g11elaI))), ncol = 3)

#Math
g3MathI <- read.csv("g3Mathifiles17.csv")
g3mmat <- matrix(c(rep(1, nrow(g3MathI)), g3MathI$Difficulty, rep(0, nrow(g3MathI))), ncol = 3)

g4MathI <- read.csv("g4Mathifiles17.csv")
g4mmat <- matrix(c(rep(1, nrow(g4MathI)), g4MathI$Difficulty, rep(0, nrow(g4MathI))), ncol = 3)

g5MathI <- read.csv("g5Mathifiles17.csv")
g5mmat <- matrix(c(rep(1, nrow(g5MathI)), g5MathI$Difficulty, rep(0, nrow(g5MathI))), ncol = 3)

g6MathI <- read.csv("g6Mathifiles17.csv")
g6mmat <- matrix(c(rep(1, nrow(g6MathI)), g6MathI$Difficulty, rep(0, nrow(g6MathI))), ncol = 3)

g7MathI <- read.csv("g7Mathifiles17.csv")
g7mmat <- matrix(c(rep(1, nrow(g7MathI)), g7MathI$Difficulty, rep(0, nrow(g7MathI))), ncol = 3)

g8MathI <- read.csv("g8Mathifiles17.csv")
g8mmat <- matrix(c(rep(1, nrow(g8MathI)), g8MathI$Difficulty, rep(0, nrow(g8MathI))), ncol = 3)

g11MathI <- read.csv("g11Mathifiles17.csv")
g11mmat <- matrix(c(rep(1, nrow(g11MathI)), g11MathI$Difficulty, rep(0, nrow(g11MathI))), ncol = 3)

#Science
g5SciI <- read.csv("g5Sciifiles17.csv")
g5smat <- matrix(c(rep(1, nrow(g5SciI)), g5SciI$Difficulty, rep(0, nrow(g5SciI))), ncol = 3)

g8SciI <- read.csv("g8Sciifiles17.csv")
g8smat <- matrix(c(rep(1, nrow(g8SciI)), g8SciI$Difficulty, rep(0, nrow(g8SciI))), ncol = 3)

g11SciI <- read.csv("g11Sciifiles17.csv")
g11smat <- matrix(c(rep(1, nrow(g11SciI)), g11SciI$Difficulty, rep(0, nrow(g11SciI))), ncol = 3)


## Read in P files
setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/2017TechnicalReport/2017PersonFiles")
library(sundry)
#ELA
g3elaP <- read.csv("ELA2017_AMO_G3.csv")
g4elaP <- read.csv("ELA2017_AMO_G4.csv")
g5elaP <- read.csv("ELA2017_AMO_G5.csv")
g6elaP <- read.csv("ELA2017_AMO_G6.csv")
g7elaP <- read.csv("ELA2017_AMO_G7.csv")
g8elaP <- read.csv("ELA2017_AMO_G8.csv")
g11elaP <- read.csv("ELA2017_AMO_G11.csv")

head(g3elaR)
names(g3elaR)
#Math
g3MathP <- read.csv("Math2017_AMO_G3.csv")
g4MathP <- read.csv("Math2017_AMO_G4.csv")
g5MathP <- read.csv("Math2017_AMO_G5.csv")
g6MathP <- read.csv("Math2017_AMO_G6.csv")
g7MathP <- read.csv("Math2017_AMO_G7.csv")
g8MathP <- read.csv("Math2017_AMO_G8.csv")
g11MathP <- read.csv("Math2017_AMO_G11.csv")

#Science
g5SciP<- read.csv("Sci2017_AMO_G5.csv")
g8SciP<- read.csv("Sci2017_AMO_G8.csv")
g11SciP<- read.csv("Sci2017_AMO_G11.csv")
head(g11SciP)
nms(g11SciP)
## Read in response matrix files

setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2016_17/2017TechnicalReport/2017CleanData")

#ELA
g3elaR <- read.csv("g3ELA.csv")
g4elaR <- read.csv("g4ELA.csv")
g5elaR <- read.csv("g5ELA.csv")
g6elaR <- read.csv("g6ELA.csv")
g7elaR <- read.csv("g7ELA.csv")
g8elaR <- read.csv("g8ELA.csv")
g11elaR <- read.csv("g11ELA.csv")

head(g3elaR)
nms(g3elaR)
#Math
g3MathR <- read.csv("g3Math.csv")
g4MathR <- read.csv("g4Math.csv")
g5MathR <- read.csv("g5Math.csv")
g6MathR <- read.csv("g6Math.csv")
g7MathR <- read.csv("g7Math.csv")
g8MathR <- read.csv("g8Math.csv")
g11MathR <- read.csv("g11Math.csv")

#Science
g5SciR <- read.csv("g5Sci.csv")
g8SciR <- read.csv("g8Sci.csv")
g11SciR <- read.csv("g11Sci.csv")


### Final CA and CC syntax 

#ELA
class.Rud(1.3, g3emat, ability = g3elaI$Theta, se = g3elaI$SE, rdm = subset(g3elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(1.3, g4emat, ability = g4elaI$Theta, se = g4elaI$SE, rdm = subset(g4elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.0, g5emat, ability = g5elaI$Theta, se = g5elaI$SE, rdm = subset(g5elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.0, g6emat, ability = g6elaI$Theta, se = g6elaI$SE, rdm = subset(g6elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.2, g7emat, ability = g7elaI$Theta, se = g7elaI$SE, rdm = subset(g7elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.4, g8emat, ability = g8elaI$Theta, se = g8elaI$SE, rdm = subset(g8elaR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.0, g11emat, ability = g11elaI$Theta, se = g11elaI$SE, rdm = subset(g11elaR, , c(13:60)), D = 1.0)$Marginal

#Mathematics
class.Rud(0.1, g3mmat, ability = g3MathI$Theta, se = g3MathI$SE, rdm = subset(g3MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(0.6, g4mmat, ability = g4MathI$Theta, se = g4MathI$SE, rdm = subset(g4MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(0.6, g5mmat, ability = g5MathI$Theta, se = g5MathI$SE, rdm = subset(g5MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(0.8, g6mmat, ability = g6MathI$Theta, se = g6MathI$SE, rdm = subset(g6MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(0.9, g7mmat, ability = g7MathI$Theta, se = g7MathI$SE, rdm = subset(g7MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(1.2, g8mmat, ability = g8MathI$Theta, se = g8MathI$SE, rdm = subset(g8MathR, , c(13:60)), D = 1.0)$Marginal
class.Rud(0.7, g11mmat, ability = g11MathI$Theta, se = g11MathI$SE, rdm = subset(g11MathR, , c(13:60)), D = 1.0)$Marginal

#Science
class.Rud(1.7, g5smat, ability = g5SciI$Theta, se = g5SciI$SE, rdm = subset(g5SciR, , c(13:60)), D = 1.0)$Marginal
class.Rud(2.0, g8smat, ability = g8SciI$Theta, se = g8SciI$SE, rdm = subset(g8SciR, , c(13:60)), D = 1.0)$Marginal
class.Rud(1.4, g11smat, ability = g11SciI$Theta, se = g11SciI$SE, rdm = subset(g11SciR, , c(13:60)), D = 1.0)$Marginal




## Other syntax
params<-matrix(g3elaR, , c(13:60))
    rdm<-sim(params, rnorm(100))
    class.Rud(2, params, rdm = rdm)$Marginal




