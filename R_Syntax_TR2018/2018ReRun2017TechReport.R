library(tidyverse)
library(sundry)

####======read in data files=====================
## ELA
G3ELA <- read.csv("./ELA_2017/ELA2017_AMO_G3.csv")
G4ELA <- read.csv("./ELA_2017/ELA2017_AMO_G4.csv")
G5ELA <- read.csv("./ELA_2017/ELA2017_AMO_G5.csv")
G6ELA <- read.csv("./ELA_2017/ELA2017_AMO_G6.csv")
G7ELA <- read.csv("./ELA_2017/ELA2017_AMO_G7.csv")
G8ELA <- read.csv("./ELA_2017/ELA2017_AMO_G8.csv")
G11ELA <- read.csv("./ELA_2017/ELA2017_AMO_G11.csv")

## Reading
G3Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade3_FinalPfile.csv")
G4Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade4_FinalPfile.csv")
G5Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade5_FinalPfile.csv")
G6Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade6_FinalPfile.csv")
G7Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade7_FinalPfile.csv")
G8Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade8_FinalPfile.csv")
G11Read <- read.csv("./ELA_2017/ReadingSubscores/Rdg1617_Grade11_FinalPfile.csv")


## Writing
G3Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade3_FinalPfile.csv")
G4Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade4_FinalPfile.csv")
G5Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade5_FinalPfile.csv")
G6Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade6_FinalPfile.csv")
G7Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade7_FinalPfile.csv")
G8Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade8_FinalPfile.csv")
G11Wri <- read.csv("./ELA_2017/WritingSubscores/Wri1617_Grade11_FinalPfile.csv")

## Math
G3Math <- read.csv("./Math_2017/Math2017_AMO_G3.csv")
G4Math <- read.csv("./Math_2017/Math2017_AMO_G4.csv")
G5Math <- read.csv("./Math_2017/Math2017_AMO_G5.csv")
G6Math <- read.csv("./Math_2017/Math2017_AMO_G6.csv")
G7Math <- read.csv("./Math_2017/Math2017_AMO_G7.csv")
G8Math <- read.csv("./Math_2017/Math2017_AMO_G8.csv")
G11Math <- read.csv("./Math_2017/Math2017_AMO_G11.csv")

## Science
G5Sci <- read.csv("./Science_2017/Sci2017_AMO_G5.csv")
G8Sci <- read.csv("./Science_2017/Sci2017_AMO_G8.csv")
G11Sci <- read.csv("./Science_2017/Sci2017_AMO_G11.csv")

head(G11ELA)
head(G5Read)
head(G5Wri)
head(G5Math)
head(G5Sci)

nms(G3ELA)
nms(G3Read)
str(G11Wri)
nms(G3Math)
nms(G5Sci)

## Data prep for Ethnicity and Disability Analyses
G3ELA <-  subset(G3ELA, select = c(20:22,30,32:33))
G4ELA <-  subset(G4ELA, select = c(20:22,30,32:33))
G5ELA <-  subset(G5ELA, select = c(20:22,30,32:33))
G6ELA <-  subset(G6ELA, select = c(20:22,30,32:33))
G7ELA <-  subset(G7ELA, select = c(20:22,30,32:33))
G8ELA <-  subset(G8ELA, select = c(20:22,30,32:33))
G11ELA <- subset(G11ELA, select = c(20:22,30,32:33))

G3Math <- subset(G3Math, select = c(20:22,30,32:33))
G4Math <- subset(G4Math, select = c(20:22,30,32:33))
G5Math <- subset(G5Math, select = c(20:22,30,32:33))
G6Math <- subset(G6Math, select = c(20:22,30,32:33))
G7Math <- subset(G7Math, select = c(20:22,30,32:33))
G8Math <- subset(G8Math, select = c(20:22,30,32:33))
G11Math <- subset(G11Math, select = c(20:22,30,32:33))

G5Sci <- subset(G5Sci, select = c(20:22,30,32:33))
G8Sci <- subset(G8Sci, select = c(20:22,30,32:33))
G11Sci <- subset(G11Sci, select = c(20:22,30,32:33))

### Read in exceptionality file ++++++++++++++++++++++++
Disab17 <- read.csv("2017_DisabilityCategory.csv")
head(Disab17)
list.files()
DisabG3ELA <- merge(G3ELA, Disab17, by = "SSID")
DisabG4ELA <- merge(G4ELA, Disab17, by = "SSID")
DisabG5ELA <- merge(G5ELA, Disab17, by = "SSID")
DisabG6ELA <- merge(G6ELA, Disab17, by = "SSID")
DisabG7ELA <- merge(G7ELA, Disab17, by = "SSID")
DisabG8ELA <- merge(G8ELA, Disab17, by = "SSID")
DisabG11ELA <- merge(G11ELA, Disab17, by = "SSID")

DisabG3Math <- merge(G3Math, Disab17, by = "SSID")
DisabG4Math <- merge(G4Math, Disab17, by = "SSID")
DisabG5Math <- merge(G5Math, Disab17, by = "SSID")
DisabG6Math <- merge(G6Math, Disab17, by = "SSID")
DisabG7Math <- merge(G7Math, Disab17, by = "SSID")
DisabG8Math <- merge(G8Math, Disab17, by = "SSID")
DisabG11Math <- merge(G11Math, Disab17, by = "SSID")

DisabG5Sci <- merge(G5Sci, Disab17, by = "SSID")
DisabG8Sci <- merge(G8Sci, Disab17, by = "SSID")
DisabG11Sci <- merge(G11Sci, Disab17, by = "SSID")

nms(DisabG3ELA)
head(DisabG3ELA)

### Tables of ethnicity frequencies and percentages =====
G3ELAEth <- table(DisabG3ELA$EthnicCd)
G3ELAEth
G3ELAEth/sum(G3ELAEth)
nrow(DisabG3ELA)

G4ELAEth <- table(DisabG4ELA$EthnicCd)
G4ELAEth
G4ELAEth/sum(G4ELAEth)
nrow(DisabG4ELA)

G5ELAEth <- table(DisabG5ELA$EthnicCd)
G5ELAEth
G5ELAEth/sum(G5ELAEth)
nrow(DisabG5ELA)

G6ELAEth <- table(DisabG6ELA$EthnicCd)
G6ELAEth
G6ELAEth/sum(G6ELAEth)
nrow(DisabG6ELA)

G7ELAEth <- table(DisabG7ELA$EthnicCd)
G7ELAEth
G7ELAEth/sum(G7ELAEth)
nrow(DisabG7ELA)

G8ELAEth <- table(DisabG8ELA$EthnicCd)
G8ELAEth
G8ELAEth/sum(G8ELAEth)
nrow(DisabG8ELA)

G11ELAEth <- table(DisabG11ELA$EthnicCd)
G11ELAEth
G11ELAEth/sum(G11ELAEth)
nrow(DisabG11ELA)


G3MathEth <- table(DisabG3Math$EthnicCd)
G3MathEth
G3MathEth/sum(G3MathEth)
nrow(DisabG3Math)

G4MathEth <- table(DisabG4Math$EthnicCd)
G4MathEth
G4MathEth/sum(G4MathEth)
nrow(DisabG4Math)

G5MathEth <- table(DisabG5Math$EthnicCd)
G5MathEth
G5MathEth/sum(G5MathEth)
nrow(DisabG5Math)

G6MathEth <- table(DisabG6Math$EthnicCd)
G6MathEth
G6MathEth/sum(G6MathEth)
nrow(DisabG6Math)

G7MathEth <- table(DisabG7Math$EthnicCd)
G7MathEth
G7MathEth/sum(G7MathEth)
nrow(DisabG7Math)

G8MathEth <- table(DisabG8Math$EthnicCd)
G8MathEth
G8MathEth/sum(G8MathEth)
nrow(DisabG8Math)

G11MathEth <- table(DisabG11Math$EthnicCd)
G11MathEth
G11MathEth/sum(G11MathEth)
nrow(DisabG11Math)

G5SciEth <- table(DisabG5Sci$EthnicCd)
G5SciEth
G5SciEth/sum(G5SciEth)
nrow(DisabG5Sci)

G8SciEth <- table(DisabG8Sci$EthnicCd)
G8SciEth
G8SciEth/sum(G8SciEth)
nrow(DisabG8Sci)

G11SciEth <- table(DisabG11Sci$EthnicCd)
G11SciEth
G11SciEth/sum(G11SciEth)
nrow(DisabG11Sci)

#### Analyses of means by disability Category ++++++++++++++++++++
## ELA
G3Dis <- as.data.frame(table(DisabG3ELA$Disab))
G4Dis <- as.data.frame(table(DisabG4ELA$Disab))
G5Dis <- as.data.frame(table(DisabG5ELA$Disab))
G6Dis <- as.data.frame(table(DisabG6ELA$Disab))
G7Dis <- as.data.frame(table(DisabG7ELA$Disab))
G8Dis <- as.data.frame(table(DisabG8ELA$Disab))
G11Dis <- as.data.frame(table(DisabG11ELA$Disab))

G3Dis 
G4Dis
G5Dis
G6Dis
G7Dis
G8Dis
G11Dis

### Calculate the relative percentages of exceptionalities in ELA
G3DisPct <- G3Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G3DisPct

G4DisPct <- G4Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G4DisPct

G5DisPct <- G5Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G5DisPct

G6DisPct <- G6Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G6DisPct

G7DisPct <- G7Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G7DisPct

G8DisPct <- G8Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G8DisPct

G11DisPct <- G11Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G11DisPct

### Calculate mean RIT scores for ELA by exceptionality

tapply(DisabG3ELA$ElaRIT, DisabG3ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG4ELA$ElaRIT, DisabG4ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG5ELA$ElaRIT, DisabG5ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG6ELA$ElaRIT, DisabG6ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG7ELA$ElaRIT, DisabG7ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG8ELA$ElaRIT, DisabG8ELA$Disab, mean, na.rm=TRUE)
tapply(DisabG11ELA$ElaRIT, DisabG11ELA$Disab, mean, na.rm=TRUE)

### Math Analyses +++++++++++++++++++++++++++++++++++++++++
G3Dis <- as.data.frame(table(DisabG3Math$Disab))
G4Dis <- as.data.frame(table(DisabG4Math$Disab))
G5Dis <- as.data.frame(table(DisabG5Math$Disab))
G6Dis <- as.data.frame(table(DisabG6Math$Disab))
G7Dis <- as.data.frame(table(DisabG7Math$Disab))
G8Dis <- as.data.frame(table(DisabG8Math$Disab))
G11Dis <- as.data.frame(table(DisabG11Math$Disab))

G3Dis
G4Dis
G5Dis
G6Dis
G7Dis
G8Dis
G11Dis

### Calculate the relative percentages of exceptionalities in Math
G3DisPct <- G3Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G3DisPct

G4DisPct <- G4Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G4DisPct

G5DisPct <- G5Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G5DisPct

G6DisPct <- G6Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G6DisPct

G7DisPct <- G7Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G7DisPct

G8DisPct <- G8Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G8DisPct

G11DisPct <- G11Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G11DisPct

## Calculate all mean RIT scores by exceptionality
tapply(DisabG3Math$MathRIT, DisabG3Math$Disab, mean, na.rm=TRUE)
tapply(DisabG4Math$MathRIT, DisabG4Math$Disab, mean, na.rm=TRUE)
tapply(DisabG5Math$MathRIT, DisabG5Math$Disab, mean, na.rm=TRUE)
tapply(DisabG6Math$MathRIT, DisabG6Math$Disab, mean, na.rm=TRUE)
tapply(DisabG7Math$MathRIT, DisabG7Math$Disab, mean, na.rm=TRUE)
tapply(DisabG8Math$MathRIT, DisabG8Math$Disab, mean, na.rm=TRUE)
tapply(DisabG11Math$MathRIT, DisabG11Math$Disab, mean, na.rm=TRUE)

### Science
G5Dis <- as.data.frame(table(DisabG5Sci$Disab))
G8Dis <- as.data.frame(table(DisabG8Sci$Disab))
G11Dis <- as.data.frame(table(DisabG11Sci$Disab))

G5Dis
G8Dis
G11Dis

G5DisPct <- G5Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G5DisPct

G8DisPct <- G8Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G8DisPct

G11DisPct <- G11Dis  %>% 
	mutate(percent = (Freq/sum(Freq)))  %>% 
	mutate(tot = sum(Freq))
G11DisPct


tapply(DisabG5Sci$SciRIT, DisabG5Sci$Disab, mean, na.rm=TRUE)
tapply(DisabG8Sci$SciRIT, DisabG8Sci$Disab, mean, na.rm=TRUE)
tapply(DisabG11Sci$SciRIT, DisabG11Sci$Disab, mean, na.rm=TRUE)

####=== Subset data to see how different genders and ethnicities performed ====
## Sex ++++++++++++++++++++++++
## ELA
tapply(DisabG3ELA$ElaRIT, DisabG3ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG4ELA$ElaRIT, DisabG4ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG5ELA$ElaRIT, DisabG5ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG6ELA$ElaRIT, DisabG6ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG7ELA$ElaRIT, DisabG7ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG8ELA$ElaRIT, DisabG8ELA$Gndr, mean, na.rm=TRUE)
tapply(DisabG11ELA$ElaRIT, DisabG11ELA$Gndr, mean, na.rm=TRUE)

t.test(ElaRIT ~ Gndr, data = DisabG3ELA)
t.test(ElaRIT ~ Gndr, data = DisabG4ELA)
t.test(ElaRIT ~ Gndr, data = DisabG5ELA)
t.test(ElaRIT ~ Gndr, data = DisabG6ELA)
t.test(ElaRIT ~ Gndr, data = DisabG7ELA)
t.test(ElaRIT ~ Gndr, data = DisabG8ELA)
t.test(ElaRIT ~ Gndr, data = DisabG11ELA)

## Math
tapply(DisabG3Math$MathRIT, DisabG3Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG4Math$MathRIT, DisabG4Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG5Math$MathRIT, DisabG5Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG6Math$MathRIT, DisabG6Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG7Math$MathRIT, DisabG7Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG8Math$MathRIT, DisabG8Math$Gndr, mean, na.rm=TRUE)
tapply(DisabG11Math$MathRIT, DisabG11Math$Gndr, mean, na.rm=TRUE)

t.test(MathRIT ~ Gndr, data = DisabG3Math)
t.test(MathRIT ~ Gndr, data = DisabG4Math)
t.test(MathRIT ~ Gndr, data = DisabG5Math)
t.test(MathRIT ~ Gndr, data = DisabG6Math)
t.test(MathRIT ~ Gndr, data = DisabG7Math)
t.test(MathRIT ~ Gndr, data = DisabG8Math)
t.test(MathRIT ~ Gndr, data = DisabG11Math)

## Science
tapply(DisabG5Sci$SciRIT, DisabG5Sci$Gndr, mean, na.rm=TRUE)
tapply(DisabG8Sci$SciRIT, DisabG8Sci$Gndr, mean, na.rm=TRUE)
tapply(DisabG11Sci$SciRIT, DisabG11Sci$Gndr, mean, na.rm=TRUE)

t.test(SciRIT ~ Gndr, data = DisabG5Sci)
t.test(SciRIT ~ Gndr, data = DisabG8Sci)
t.test(SciRIT ~ Gndr, data = DisabG11Sci)


## Race ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Develop White/NonWhite Variable
DisabG3ELA$White <- as.numeric(DisabG3ELA$EthnicCd)
DisabG3ELA$White <- ifelse(DisabG3ELA$White == 7, 1, 0)

DisabG4ELA$White <- as.numeric(DisabG4ELA$EthnicCd)
DisabG4ELA$White <- ifelse(DisabG4ELA$White == 7, 1, 0)

DisabG5ELA$White <- as.numeric(DisabG5ELA$EthnicCd)
DisabG5ELA$White <- ifelse(DisabG5ELA$White == 8, 1, 0)

DisabG6ELA$White <- as.numeric(DisabG6ELA$EthnicCd)
DisabG6ELA$White <- ifelse(DisabG6ELA$White == 7, 1, 0)

DisabG7ELA$White <- as.numeric(DisabG7ELA$EthnicCd)
DisabG7ELA$White <- ifelse(DisabG7ELA$White == 7, 1, 0)

DisabG8ELA$White <- as.numeric(DisabG8ELA$EthnicCd)
DisabG8ELA$White <- ifelse(DisabG8ELA$White == 7, 1, 0)

DisabG11ELA$White <- as.numeric(DisabG11ELA$EthnicCd)
DisabG11ELA$White <- ifelse(DisabG11ELA$White == 7, 1, 0)

### Math

DisabG3Math$White <- as.numeric(DisabG3Math$EthnicCd)
DisabG3Math$White <- ifelse(DisabG3Math$White == 7, 1, 0)

DisabG4Math$White <- as.numeric(DisabG4Math$EthnicCd)
DisabG4Math$White <- ifelse(DisabG4Math$White == 7, 1, 0)

DisabG5Math$White <- as.numeric(DisabG5Math$EthnicCd)
DisabG5Math$White <- ifelse(DisabG5Math$White == 8, 1, 0)

DisabG6Math$White <- as.numeric(DisabG6Math$EthnicCd)
DisabG6Math$White <- ifelse(DisabG6Math$White == 7, 1, 0)

DisabG7Math$White <- as.numeric(DisabG7Math$EthnicCd)
DisabG7Math$White <- ifelse(DisabG7Math$White == 7, 1, 0)

DisabG8Math$White <- as.numeric(DisabG8Math$EthnicCd)
DisabG8Math$White <- ifelse(DisabG8Math$White == 7, 1, 0)

DisabG11Math$White <- as.numeric(DisabG11Math$EthnicCd)
DisabG11Math$White <- ifelse(DisabG11Math$White == 7, 1, 0)

## Science
DisabG5Sci$White <- as.numeric(DisabG5Sci$EthnicCd)
DisabG5Sci$White <- ifelse(DisabG5Sci$White == 8, 1, 0)

DisabG8Sci$White <- as.numeric(DisabG8Sci$EthnicCd)
DisabG8Sci$White <- ifelse(DisabG8Sci$White == 7, 1, 0)

DisabG11Sci$White <- as.numeric(DisabG11Sci$EthnicCd)
DisabG11Sci$White <- ifelse(DisabG11Sci$White == 7, 1, 0)

## ELA
tapply(DisabG3ELA$ElaRIT, DisabG3ELA$White, mean, na.rm=TRUE)
tapply(DisabG4ELA$ElaRIT, DisabG4ELA$White, mean, na.rm=TRUE)
tapply(DisabG5ELA$ElaRIT, DisabG5ELA$White, mean, na.rm=TRUE)
tapply(DisabG6ELA$ElaRIT, DisabG6ELA$White, mean, na.rm=TRUE)
tapply(DisabG7ELA$ElaRIT, DisabG7ELA$White, mean, na.rm=TRUE)
tapply(DisabG8ELA$ElaRIT, DisabG8ELA$White, mean, na.rm=TRUE)
tapply(DisabG11ELA$ElaRIT, DisabG11ELA$White, mean, na.rm=TRUE)

t.test(ElaRIT ~ White, data = DisabG3ELA)
t.test(ElaRIT ~ White, data = DisabG4ELA)
t.test(ElaRIT ~ White, data = DisabG5ELA)
t.test(ElaRIT ~ White, data = DisabG6ELA)
t.test(ElaRIT ~ White, data = DisabG7ELA)
t.test(ElaRIT ~ White, data = DisabG8ELA)
t.test(ElaRIT ~ White, data = DisabG11ELA)

## Math
tapply(DisabG3Math$MathRIT, DisabG3Math$White, mean, na.rm=TRUE)
tapply(DisabG4Math$MathRIT, DisabG4Math$White, mean, na.rm=TRUE)
tapply(DisabG5Math$MathRIT, DisabG5Math$White, mean, na.rm=TRUE)
tapply(DisabG6Math$MathRIT, DisabG6Math$White, mean, na.rm=TRUE)
tapply(DisabG7Math$MathRIT, DisabG7Math$White, mean, na.rm=TRUE)
tapply(DisabG8Math$MathRIT, DisabG8Math$White, mean, na.rm=TRUE)
tapply(DisabG11Math$MathRIT, DisabG11Math$White, mean, na.rm=TRUE)

t.test(MathRIT ~ White, data = DisabG3Math)
t.test(MathRIT ~ White, data = DisabG4Math)
t.test(MathRIT ~ White, data = DisabG5Math)
t.test(MathRIT ~ White, data = DisabG6Math)
t.test(MathRIT ~ White, data = DisabG7Math)
t.test(MathRIT ~ White, data = DisabG8Math)
t.test(MathRIT ~ White, data = DisabG11Math)

## Science
tapply(DisabG5Sci$SciRIT, DisabG5Sci$White, mean, na.rm=TRUE)
tapply(DisabG8Sci$SciRIT, DisabG8Sci$White, mean, na.rm=TRUE)
tapply(DisabG11Sci$SciRIT, DisabG11Sci$White, mean, na.rm=TRUE)

t.test(SciRIT ~ White, data = DisabG5Sci)
t.test(SciRIT ~ White, data = DisabG8Sci)
t.test(SciRIT ~ White, data = DisabG11Sci)

### Merge clean data sets for final analyses

G3ELAMath <- merge(G3ELA, G3Math, by = "SSID")
G4ELAMath <- merge(G4ELA, G4Math, by = "SSID")
G5ELAMath <- merge(G5ELA, G5Math, by = "SSID")
G5ELAMathSci <- merge(G5ELAMath, G5Sci, by = "SSID")
G6ELAMath <- merge(G6ELA, G6Math, by = "SSID")
G7ELAMath <- merge(G7ELA, G7Math, by = "SSID")
G8ELAMath <- merge(G8ELA, G8Math, by = "SSID")
G8ELAMathSci <- merge(G8ELAMath, G8Sci, by = "SSID")
G11ELAMath <- merge(G11ELA, G11Math, by = "SSID")
G11ELAMathSci <- merge(G11ELAMath, G11Sci, by = "SSID")



#####========== run some basic descriptives on RIT scores==========================

mG5Sci <- mean(G5Sci$SciRIT, trim=0, na.rm=TRUE)
mG8Sci <- mean(G8Sci$SciRIT, trim=0, na.rm=TRUE)
mG11Sci <- mean(G11Sci$SciRIT, trim=0, na.rm=TRUE)

mG5Sci
mG8Sci
mG11Sci

mG3ELA <- mean(G3ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG4ELA <- mean(G4ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG5ELA <- mean(G5ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG6ELA <- mean(G6ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG7ELA <- mean(G7ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG8ELA <- mean(G8ELA$ElaRIT, trim = 0, na.rm = TRUE)
mG11ELA <- mean(G11ELA$ElaRIT, trim = 0, na.rm = TRUE)

mG3ELA
mG4ELA
mG5ELA
mG6ELA
mG7ELA
mG8ELA
mG11ELA

mG3Rdg <- mean(G3Read$RdgRIT, trim = 0, na.rm = TRUE)
mG4Rdg <- mean(G4Read$RdgRIT, trim = 0, na.rm = TRUE)
mG5Rdg<- mean(G5Read$RdgRIT, trim = 0, na.rm = TRUE)
mG6Rdg <- mean(G6Read$RdgRIT, trim = 0, na.rm = TRUE)
mG7Rdg<- mean(G7Read$RdgRIT, trim = 0, na.rm = TRUE)
mG8Rdg <- mean(G8Read$RdgRIT, trim = 0, na.rm = TRUE)
mG11Rdg <- mean(G11Read$RdgRIT, trim = 0, na.rm = TRUE)

mG3Rdg
mG4Rdg
mG5Rdg
mG6Rdg
mG7Rdg
mG8Rdg
mG11Rdg

mG3Wri <- mean(G3Wri$WriRIT, trim = 0, na.rm = TRUE)
mG4Wri<- mean(G4Wri$WriRIT, trim = 0, na.rm = TRUE)
mG5Wri <- mean(G5Wri$WriRIT, trim = 0, na.rm = TRUE)
mG6Wri <- mean(G6Wri$WriRIT, trim = 0, na.rm = TRUE)
mG7Wri <- mean(G7Wri$WriRIT, trim = 0, na.rm = TRUE)
mG8Wri <- mean(G8Wri$WriRIT, trim = 0, na.rm = TRUE)
mG11Wri <- mean(G11Wri$WriRIT, trim = 0, na.rm = TRUE)

mG3Wri
mG4Wri
mG5Wri
mG6Wri
mG7Wri
mG8Wri
mG11Wri


mG3Math <- mean(G3Math$MathRIT, trim = 0, na.rm = TRUE)
mG4Math <- mean(G4Math$MathRIT, trim = 0, na.rm = TRUE)
mG5Math <- mean(G5Math$MathRIT, trim = 0, na.rm = TRUE)
mG6Math <- mean(G6Math$MathRIT, trim = 0, na.rm = TRUE)
mG7Math <- mean(G7Math$MathRIT, trim = 0, na.rm = TRUE)
mG8Math <- mean(G8Math$MathRIT, trim = 0, na.rm = TRUE)
mG11Math <- mean(G11Math$MathRIT, trim = 0, na.rm = TRUE)

mG3Math
mG4Math
mG5Math
mG6Math
mG7Math
mG8Math
mG11Math


sd(G3ELA$ElaRIT, na.rm=TRUE)
sd(G4ELA$ElaRIT, na.rm=TRUE)
sd(G5ELA$ElaRIT, na.rm=TRUE)
sd(G6ELA$ElaRIT, na.rm=TRUE)
sd(G7ELA$ElaRIT, na.rm=TRUE)
sd(G8ELA$ElaRIT, na.rm=TRUE)
sd(G11ELA$ElaRIT, na.rm=TRUE)

sd(G3Read$RdgRIT, na.rm=TRUE)
sd(G4Read$RdgRIT, na.rm=TRUE)
sd(G5Read$RdgRIT, na.rm=TRUE)
sd(G6Read$RdgRIT, na.rm=TRUE)
sd(G7Read$RdgRIT, na.rm=TRUE)
sd(G8Read$RdgRIT, na.rm=TRUE)
sd(G11Read$RdgRIT, na.rm=TRUE)

sd(G3Wri$WriRIT, na.rm=TRUE)
sd(G4Wri$WriRIT, na.rm=TRUE)
sd(G5Wri$WriRIT, na.rm=TRUE)
sd(G6Wri$WriRIT, na.rm=TRUE)
sd(G7Wri$WriRIT, na.rm=TRUE)
sd(G8Wri$WriRIT, na.rm=TRUE)
sd(G11Wri$WriRIT, na.rm=TRUE)

sd(G3Math$MathRIT, na.rm=TRUE)
sd(G4Math$MathRIT, na.rm=TRUE)
sd(G5Math$MathRIT, na.rm=TRUE)
sd(G6Math$MathRIT, na.rm=TRUE)
sd(G7Math$MathRIT, na.rm=TRUE)
sd(G8Math$MathRIT, na.rm=TRUE)
sd(G11Math$MathRIT, na.rm=TRUE)

sd(G5Sci$SciRIT, na.rm=TRUE)
sd(G8Sci$SciRIT, na.rm=TRUE)
sd(G11Sci$SciRIT, na.rm=TRUE)


###===========================RIT Score Correlations=================
## Prepare Datasets for Merging
G3Read <- G3Read[ ,c(19, 31)]
G4Read <- G4Read[ ,c(19, 31)]
G5Read <- G5Read[ ,c(19, 31)]
G6Read <- G6Read[ ,c(19, 31)]
G7Read <- G7Read[ ,c(19, 31)]
G8Read <- G8Read[ ,c(19, 31)]
G11Read <- G11Read[ ,c(19, 31)]

G3Wri <- G3Wri[ ,c(19, 31)]
G4Wri <- G4Wri[ ,c(19, 31)]
G5Wri <- G5Wri[ ,c(19, 31)]
G6Wri <- G6Wri[ ,c(19, 31)]
G7Wri <- G7Wri[ ,c(19, 31)]
G8Wri <- G8Wri[ ,c(19, 31)]
G11Wri <- G11Wri[ ,c(19, 31)]

G3Math <- G3Math[ ,c(1, 5)]
G4Math <- G4Math[ ,c(1, 5)]
G5Math <- G5Math[ ,c(1, 5)]
G6Math <- G6Math[ ,c(1, 5)]
G7Math <- G7Math[ ,c(1, 5)]
G8Math <- G8Math[ ,c(1, 5)]
G11Math <- G11Math[ ,c(1, 5)]

G5Sci <- G5Sci[ ,c(1, 5)]
G8Sci <- G8Sci[ ,c(1, 5)]
G11Sci <- G11Sci[ ,c(1, 5)]

#### Merge all data files for correlations, by grade level ===============
g3ELARead <- merge(G3ELA, G3Read, by = "SSID")
g3ELAReadWri <- merge(g3ELARead, G3Wri, by = "SSID")
g3ELAReadWriMath <- merge(g3ELAReadWri, G3Math, by = "SSID")
head(g3ELAReadWriMath)

g4ELARead <- merge(G4ELA, G4Read, by = "SSID")
g4ELAReadWri <- merge(g4ELARead, G4Wri, by = "SSID")
g4ELAReadWriMath <- merge(g4ELAReadWri, G4Math, by = "SSID")
head(g4ELAReadWriMath)

g5ELARead <- merge(G5ELA, G5Read, by = "SSID")
g5ELAReadWri <- merge(g5ELARead, G5Wri, by = "SSID")
g5ELAReadWriMath <- merge(g5ELAReadWri, G5Math, by = "SSID")
g5ELAReadWriMathSci <- merge(g5ELAReadWriMath, G5Sci, by = "SSID")
head(g5ELAReadWriMathSci)

g6ELARead <- merge(G6ELA, G6Read, by = "SSID")
g6ELAReadWri <- merge(g6ELARead, G6Wri, by = "SSID")
g6ELAReadWriMath <- merge(g6ELAReadWri, G6Math, by = "SSID")
head(g6ELAReadWriMath)

g7ELARead <- merge(G7ELA, G7Read, by = "SSID")
g7ELAReadWri <- merge(g7ELARead, G7Wri, by = "SSID")
g7ELAReadWriMath <- merge(g7ELAReadWri, G7Math, by = "SSID")
head(g7ELAReadWriMath)

g8ELARead <- merge(G8ELA, G8Read, by = "SSID")
g8ELAReadWri <- merge(g8ELARead, G8Wri, by = "SSID")
g8ELAReadWriMath <- merge(g8ELAReadWri, G8Math, by = "SSID")
g8ELAReadWriMathSci <- merge(g8ELAReadWriMath, G8Sci, by = "SSID")
head(g8ELAReadWriMathSci)

g11ELARead <- merge(G11ELA, G11Read, by = "SSID")
g11ELAReadWri <- merge(g11ELARead, G11Wri, by = "SSID")
g11ELAReadWriMath <- merge(g11ELAReadWri, G11Math, by = "SSID")
g11ELAReadWriMathSci <- merge(g11ELAReadWriMath, G11Sci, by = "SSID")
head(g11ELAReadWriMathSci)


nrow(g3ELAReadWriMath)
nrow(g4ELAReadWriMath)
nrow(g5ELAReadWriMathSci)
nrow(g6ELAReadWriMath)
nrow(g7ELAReadWriMath)
nrow(g8ELAReadWriMathSci)
nrow(g11ELAReadWriMathSci)

nrow(g3ELAReadWri)
nrow(g4ELAReadWri)
nrow(g5ELAReadWri)
nrow(g6ELAReadWri)
nrow(g7ELAReadWri)
nrow(g8ELAReadWri)
nrow(g11ELAReadWri)

### Grades 3-8 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Grade 3
cor.test(g3ELAReadWriMath$ElaRIT, g3ELAReadWriMath$MathRIT, use = "complete.obs")

cor.test(g3ELAReadWri$ElaRIT, g3ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g3ELAReadWri$ElaRIT, g3ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g3ELAReadWri$RdgRIT, g3ELAReadWri$WriRIT, use = "complete.obs")

## Grade 4
cor.test(g4ELAReadWriMath$ElaRIT, g4ELAReadWriMath$MathRIT, use = "complete.obs")

cor.test(g4ELAReadWri$ElaRIT, g4ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g4ELAReadWri$ElaRIT, g4ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g4ELAReadWri$RdgRIT, g4ELAReadWri$WriRIT, use = "complete.obs")

## Grade 5
cor.test(g5ELAReadWriMathSci$ElaRIT, g5ELAReadWriMathSci$MathRIT, use = "complete.obs")
cor.test(g5ELAReadWriMathSci$ElaRIT, g5ELAReadWriMathSci$SciRIT, use = "complete.obs")
cor.test(g5ELAReadWriMathSci$MathRIT, g5ELAReadWriMathSci$SciRIT, use = "complete.obs")

cor.test(g5ELAReadWri$ElaRIT, g5ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g5ELAReadWri$ElaRIT, g5ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g5ELAReadWri$RdgRIT, g5ELAReadWri$WriRIT, use = "complete.obs")

## Grade 6
cor.test(g6ELAReadWriMath$ElaRIT, g6ELAReadWriMath$MathRIT, use = "complete.obs")

cor.test(g6ELAReadWri$ElaRIT, g6ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g6ELAReadWri$ElaRIT, g6ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g6ELAReadWri$RdgRIT, g6ELAReadWri$WriRIT, use = "complete.obs")

## Grade 7
cor.test(g7ELAReadWriMath$ElaRIT, g7ELAReadWriMath$MathRIT, use = "complete.obs")

cor.test(g7ELAReadWri$ElaRIT, g7ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g7ELAReadWri$ElaRIT, g7ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g7ELAReadWri$RdgRIT, g7ELAReadWri$WriRIT, use = "complete.obs")

## Grade 8
cor.test(g8ELAReadWriMathSci$ElaRIT, g8ELAReadWriMathSci$MathRIT, use = "complete.obs")
cor.test(g8ELAReadWriMathSci$ElaRIT, g8ELAReadWriMathSci$SciRIT, use = "complete.obs")
cor.test(g8ELAReadWriMathSci$MathRIT, g8ELAReadWriMathSci$SciRIT, use = "complete.obs")

cor.test(g8ELAReadWri$ElaRIT, g8ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g8ELAReadWri$ElaRIT, g8ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g8ELAReadWri$RdgRIT, g8ELAReadWri$WriRIT, use = "complete.obs")

## Grade 11
cor.test(g11ELAReadWriMathSci$ElaRIT, g11ELAReadWriMathSci$MathRIT, use = "complete.obs")
cor.test(g11ELAReadWriMathSci$ElaRIT, g11ELAReadWriMathSci$SciRIT, use = "complete.obs")
cor.test(g11ELAReadWriMathSci$MathRIT, g11ELAReadWriMathSci$SciRIT, use = "complete.obs")

cor.test(g11ELAReadWri$ElaRIT, g11ELAReadWri$RdgRIT, use = "complete.obs")

cor.test(g11ELAReadWri$ElaRIT, g11ELAReadWri$WriRIT, use = "complete.obs")

cor.test(g11ELAReadWri$RdgRIT, g11ELAReadWri$WriRIT, use = "complete.obs")

#### pulled out the disabilities that generally had fewer than 10 students per grade level===============
ela_d <- rbind(DisabG3ELA, DisabG4ELA, DisabG5ELA, DisabG6ELA, DisabG7ELA, DisabG8ELA, DisabG11ELA)
math_d <- rbind(DisabG3Math, DisabG4Math, DisabG5Math, DisabG6Math, DisabG7Math, DisabG8Math, DisabG11Math)
sci_d <- rbind(DisabG5Sci, DisabG8Sci, DisabG11Sci)


ela_d <- subset(ela_d, Disab != 20)
ela_d <- subset(ela_d, Disab != 40)
ela_d <- subset(ela_d, Disab != 43)
ela_d <- subset(ela_d, Disab != 74)

math_d <- subset(math_d, Disab != 20)
math_d <- subset(math_d, Disab != 40)
math_d <- subset(math_d, Disab != 43)
math_d <- subset(math_d, Disab != 74)

sci_d <- subset(sci_d, Disab != 20)
sci_d <- subset(sci_d, Disab != 40)
sci_d <- subset(sci_d, Disab != 43)
sci_d <- subset(sci_d, Disab != 74)


head(ela_d)
head(math_d)
head(sci_d)

#### graph the means for each disability group to compare significance ====

SE <- function(x) sd(x, na.rm=TRUE)/ sqrt(length(na.omit(x))) 

ela_g <- split(ela_d, ela_d$EnrlGrAtTst)
math_g <- split(math_d, math_d$EnrlGrAtTst)
sci_g <- split(sci_d, sci_d$EnrlGrAtTst)


ela_gMean <- sapply(ela_g, function(x) tapply(x$ElaRIT, x$Disab, mean, na.rm = TRUE))
ela_gSE <- sapply(ela_g, function(x) tapply(x$ElaRIT, x$Disab, SE))
ela_gMinus <- ela_gMean - 1.96*ela_gSE
ela_gPlus <- ela_gMean + 1.96*ela_gSE


math_gMean <- sapply(math_g, function(x) tapply(x$MathRIT, x$Disab, mean, na.rm = TRUE))
math_gSE <- sapply(math_g, function(x) tapply(x$MathRIT, x$Disab, SE))
math_gMinus <- math_gMean - 1.96*math_gSE
math_gPlus <- math_gMean + 1.96*math_gSE


sci_gMean <- sapply(sci_g, function(x) tapply(x$SciRIT, x$Disab, mean, na.rm = TRUE))
sci_gSE <- sapply(sci_g, function(x) tapply(x$SciRIT, x$Disab, SE))
sci_gMinus <- sci_gMean - 1.96*sci_gSE
sci_gPlus <- sci_gMean + 1.96*sci_gSE


## create grade level datasets

g3 <- data.frame(ELAmean = ela_gMean[ ,1], ELAlb = ela_gMinus[ ,1], ELAup = ela_gPlus[ ,1], Mathmean = math_gMean[ ,1], Mathlb = math_gMinus[ ,1], Mathup = math_gPlus[ ,1])

g4 <- data.frame(ELAmean = ela_gMean[ ,2], ELAlb = ela_gMinus[ ,2], ELAup = ela_gPlus[ ,2], Mathmean = math_gMean[ ,2], Mathlb = math_gMinus[ ,2], Mathup = math_gPlus[ ,2])

g5 <- data.frame(ELAmean = ela_gMean[ ,3], ELAlb = ela_gMinus[ ,3], ELAup = ela_gPlus[ ,3], Mathmean = math_gMean[ ,3], Mathlb = math_gMinus[ ,3], Mathup = math_gPlus[ ,3], Scimean = sci_gMean[ ,1], Scilb = sci_gMinus[ ,1], Sciup = sci_gPlus[ ,1])	 

g6 <- data.frame(ELAmean = ela_gMean[ ,4], ELAlb = ela_gMinus[ ,4], ELAup = ela_gPlus[ ,4], Mathmean = math_gMean[ ,4], Mathlb = math_gMinus[ ,4], Mathup = math_gPlus[ ,4])

g7 <- data.frame(ELAmean = ela_gMean[ ,5], ELAlb = ela_gMinus[ ,5], ELAup = ela_gPlus[ ,5], Mathmean = math_gMean[ ,5], Mathlb = math_gMinus[ ,5], Mathup = math_gPlus[ ,5])

g8 <- data.frame(ELAmean = ela_gMean[ ,6], ELAlb = ela_gMinus[ ,6], ELAup = ela_gPlus[ ,6], Mathmean = math_gMean[ ,6], Mathlb = math_gMinus[ ,6], Mathup = math_gPlus[ ,6], Scimean = sci_gMean[ ,2], Scilb = sci_gMinus[ , 2], Sciup = sci_gPlus[ , 2])

g11 <- data.frame(ELAmean = ela_gMean[ ,7], ELAlb = ela_gMinus[ ,7], ELAup = ela_gPlus[ ,7], Mathmean = math_gMean[ ,7], Mathlb = math_gMinus[ ,7], Mathup = math_gPlus[ ,7], Scimean = sci_gMean[ ,3], Scilb = sci_gMinus[ ,3], Sciup = sci_gPlus[ ,3])

g3
g4
g5
g6
g7
g8
g11


g3$grade <- rep(3, nrow(g3))
g4$grade <- rep(4, nrow(g4))
g5$grade <- rep(5, nrow(g5))
g6$grade <- rep(6, nrow(g6))
g7$grade <- rep(7, nrow(g7))
g8$grade <- rep(8, nrow(g8))
g11$grade <- rep(11, nrow(g11))

g3$disability <- substr(row.names(g3), 1, 2)
g4$disability <- substr(row.names(g4), 1, 2)
g5$disability <- substr(row.names(g5), 1, 2)
g6$disability <- substr(row.names(g6), 1, 2)
g7$disability <- substr(row.names(g7), 1, 2)
g8$disability <- substr(row.names(g8), 1, 2)
g11$disability <- substr(row.names(g11), 1, 2)

d <- rbind(g3, g4, g5[ ,c(1:6, 10:11)], g6, g7, g8[ ,c(1:6, 10:11)])
d_sci <- rbind(g5, g8, g11)

d$disability <- substr(row.names(d), 1, 2)
d_sci$disability <- substr(row.names(d_sci), 1, 2)

d
d_sci

### ELA graphs ==================================

ggplot(d, aes(x=grade, y=ELAmean, colour = disability)) + 
		geom_errorbar(aes(ymin=ELAlb, ymax=ELAup), position=position_dodge(width=0.3), width=0.7) +
		geom_point(position=position_dodge(width=0.3), size=3, fill="white") +
		xlab("Grade") +
		ylab("ELA Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average ELA RIT Scores By Exceptionality") +
		theme_bw()


### Math graph ==================================
ggplot(d, aes(x=grade, y=Mathmean, colour = disability)) + 
		geom_errorbar(aes(ymin=Mathlb, ymax=Mathup), position=position_dodge(width=0.3), width=0.7) +
		geom_point(position=position_dodge(width=0.3), size=3, fill="white") +
		xlab("Grade") +
		ylab("Math Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average Math RIT Scores By Exceptionality") +
		theme_bw()


### Science graphs ==================================
ggplot(g5, aes(x=grade, y=Scimean, colour = disability)) + 
		geom_errorbar(aes(ymin=Scilb, ymax=Sciup), position=position_dodge(width=0.1), width=0.1) +
		geom_point(position=position_dodge(width=0.1), size=3, fill="white") +
		xlab("Grade 5") +
		ylab("Science Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average Science RIT Scores By Exceptionality") +
		scale_x_continuous(breaks=NULL) +
		theme_bw()

ggplot(g8, aes(x=grade, y=Scimean, colour = disability)) + 
		geom_errorbar(aes(ymin=Scilb, ymax=Sciup), position=position_dodge(width=0.1), width=0.1) +
		geom_point(position=position_dodge(width=0.1), size=3, fill="white") +
		xlab("Grade 8") +
		ylab("Science Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average Science RIT Scores By Exceptionality") +
		scale_x_continuous(breaks=NULL) +
		theme_bw()

### Grade 11 Graphs


ggplot(g11, aes(x=grade, y=ELAmean, colour = disability)) + 
		geom_errorbar(aes(ymin=ELAlb, ymax=ELAup), position=position_dodge(width=0.1), width=0.1) +
		geom_point(position=position_dodge(width=0.1), size=3, fill="white") +
		xlab("Grade 11") +
		ylab("ELA Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average ELA RIT Scores By Exceptionality") +
		scale_x_continuous(breaks=NULL) +
		theme_bw()
		# ggsave("plots.pdf")
		# print(qplot(...))
		# dev.off()


ggplot(g11, aes(x=grade, y=Mathmean, colour = disability)) + 
		geom_errorbar(aes(ymin=Mathlb, ymax=Mathup), position=position_dodge(width=0.1), width=0.1) +
		geom_point(position=position_dodge(width=0.1), size=3, fill="white") +
		xlab("Grade 11") +
		ylab("Math Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average Math RIT Scores By Exceptionality") +
		scale_x_continuous(breaks=NULL) +
		theme_bw()
		# ggsave("plots.pdf")
		# print(qplot(...))
		# dev.off()


ggplot(g11, aes(x=grade, y=Scimean, colour = disability)) + 
		geom_errorbar(aes(ymin=Scilb, ymax=Sciup), position=position_dodge(width=0.1), width=0.1) +
		geom_point(position=position_dodge(width=0.1), size=3, fill="white") +
		xlab("Grade 11") +
		ylab("Science Mean") +
		scale_colour_hue(name="Exceptionality",
			breaks=c("10", "50", "60", "70", "80", "82", "90"),
			labels=c("ID", "CD", "ED", "OI", "OHI", "ASD", "SLD")) +
		ggtitle("Average Science RIT Scores By Exceptionality") +
		scale_x_continuous(breaks=NULL) +
		theme_bw()
		# ggsave("plots.pdf")		
		# print(qplot(...))
		# dev.off()


####====================== Plotting Biserial, Outfit Mean Square Distributions ==========
### this was used to experiment with width and height - dev.new()


library(tidyverse)
library(sundry)

g3ELAIfile <- read.csv("./2017ItemParameters/g3ELAifiles17.csv")
g4ELAIfile <- read.csv("./2017ItemParameters/g4ELAifiles17.csv")
g5ELAIfile <- read.csv("./2017ItemParameters/g5ELAifiles17.csv")
g6ELAIfile <- read.csv("./2017ItemParameters/g6ELAifiles17.csv")
g7ELAIfile <- read.csv("./2017ItemParameters/g7ELAifiles17.csv")
g8ELAIfile <- read.csv("./2017ItemParameters/g8ELAifiles17.csv")
g11ELAIfile <- read.csv("./2017ItemParameters/g11ELAifiles17.csv")
nms(g3ELAIfile)
head(g3ELAIfile, 48)
str(g3ELAIfile)

## Selecting only operational items (removing field test items)
g3ELAIfileOP <- g3ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g4ELAIfileOP <- g4ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g5ELAIfileOP <- g5ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g6ELAIfileOP <- g6ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g7ELAIfileOP <- g7ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8ELAIfileOP <- g8ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g11ELAIfileOP <- g3ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]


g3MathIfile <- read.csv("./2017ItemParameters/g3Mathifiles17.csv")
g4MathIfile <- read.csv("./2017ItemParameters/g4Mathifiles17.csv")
g5MathIfile <- read.csv("./2017ItemParameters/g5Mathifiles17.csv")
g6MathIfile <- read.csv("./2017ItemParameters/g6Mathifiles17.csv")
g7MathIfile <- read.csv("./2017ItemParameters/g7Mathifiles17.csv")
g8MathIfile <- read.csv("./2017ItemParameters/g8Mathifiles17.csv")
g11MathIfile <- read.csv("./2017ItemParameters/g11Mathifiles17.csv")

g3MathIfileOP <- g3MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g4MathIfileOP <- g4MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g5MathIfileOP <- g5MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g6MathIfileOP <- g6MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g7MathIfileOP <- g7MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8MathIfileOP <- g8MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38),]
g11MathIfileOP <- g11MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]

head(g7MathIfileOP, 36)

g5SciIfile <- read.csv("./2017ItemParameters/g5Sciifiles17.csv")
g8SciIfile <- read.csv("./2017ItemParameters/g8Sciifiles17.csv")
g11SciIfile <- read.csv("./2017ItemParameters/g11Sciifiles17.csv")

g5SciIfileOP <- g5SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8SciIfileOP <- g8SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g11SciIfileOP <- g11SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]


## Conduct all Point Measure Correlation and Outfit Mean Square Plots
pdf("g38ELABiserial_2017.pdf", width=10, height=12)
par(lwd=1.2, mfrow=c(3,2))
hist(g3ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 3",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)

hist(g4ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 4",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)

hist(g5ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 5",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)

hist(g6ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 6",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)

hist(g7ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 7",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)

hist(g8ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 8",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.4, .8),
	ylim = c(0, 8)
	)
dev.off()

### Math Grade 3-8 Plots =======================
pdf("g38MathBiserial_2017.pdf", width=10, height=12)
par(lwd=1.0, mfrow=c(3,2))
hist(g3MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 3",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)

hist(g4MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 4",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)

hist(g5MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 5",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)

hist(g6MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 6",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)

hist(g7MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 7",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)

hist(g8MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 8",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)
dev.off()

###====== Grade 11 Plots ==================
pdf("g11ELABiserial_2017.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11ELAIfileOP$PointMeasureCorr, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 11",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.2, .80),
	ylim = c(0, 8)
	)
dev.off()

pdf("g11MathBiserial_2017.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11MathIfileOP$PointMeasureCorr, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 11",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.20, .80),
	ylim = c(0, 8)
	)
dev.off()


### Science Plots ====================
pdf("g5SciBiserial_2017.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g5SciIfileOP$PointMeasureCorr, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 5",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.3, .80),
	ylim = c(0, 8)
	)
dev.off()

pdf("g8SciBiserial_2017.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g8SciIfileOP$PointMeasureCorr, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 8",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.3, .80),
	ylim = c(0, 8)
	)
dev.off()

pdf("g11SciBiserial_2017.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11SciIfileOP$PointMeasureCorr, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 11",
	xlab = "Point Measure Correlations",
	ylab = "Item Frequencies",
	xlim = c(.3, .80),
	ylim = c(0, 8)
	)
dev.off()

## ======== Outfit mean squares plots ====================================================

pdf("g38ELAOutfitMS.pdf", width=10, height=12)
par(lwd=1.2, mfrow=c(3,2))
hist(g3ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 3",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)

hist(g4ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 4",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)

hist(g5ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 5",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)

hist(g6ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 6",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)

hist(g7ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 7",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)

hist(g8ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 8",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)
dev.off()

### Math Grade 3-8 Plots =======================
pdf("g38MathOutfitMS.pdf", width=10, height=12)
par(lwd=1.0, mfrow=c(3,2))
hist(g3MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 3",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)

hist(g4MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 4",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)

hist(g5MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 5",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)

hist(g6MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 6",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)

hist(g7MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 7",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)

hist(g8MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 8",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.0),
	ylim = c(0, 6)
	)
dev.off()

###====== Grade 11 Plots ==================
pdf("g11ELAOutfitMS.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11ELAIfileOP$Outfit, 
	border = "blue",
	breaks = 50,
	main = "English Language Arts - Grade 11",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)
dev.off()

pdf("g11MathOutfitMS.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11MathIfileOP$Outfit, 
	border = "dark green",
	breaks = 50,
	main = "Mathematics - Grade 11",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 3.0),
	ylim = c(0, 6)
	)
dev.off()


### Science Plots ====================
pdf("g5SciOutfitMS.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g5SciIfileOP$Outfit, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 5",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.5),
	ylim = c(0, 8)
	)
dev.off()

pdf("g8SciOutfitMS.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g8SciIfileOP$Outfit, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 8",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.5),
	ylim = c(0, 8)
	)
dev.off()

pdf("g11SciOutfitMS.pdf")
par(lwd=1.2, mfrow=c(1,1))
hist(g11SciIfileOP$Outfit, 
	border = "red",
	breaks = 50,
	main = "Science - Grade 11",
	xlab = "Outfit Mean Squares",
	ylab = "Item Frequencies",
	xlim = c(0, 2.5),
	ylim = c(0, 8)
	)
dev.off()

#### plots thinner lines ================
plot(table(g11SciIfileOP$PointMeasureCorr))



######################## Calculate Marginal Reliabilities ==================================+++++++++++++++++++++++++

library(tidyverse)
library(sundry)

ela <- readFiles("./ELA_2017/", pat = "AMO")
math <- readFiles("./Math_2017/", pat = "AMO")
sci <- readFiles("./Science_2017/", pat = "AMO")

marg_rel <- function(x) {
	e <- mean((x$SE)^2)
	s <- var(x$Theta)
	mr <- s/(s+e)
	return(mr)
}

sapply(ela, marg_rel)
sapply(math, marg_rel)
sapply(sci, marg_rel)
#### Calculate average thetas from  Person files+++++++++++++++++
####======read in data files=====================
## ELA



G3ELA <- read.csv("./ELA_2017/ELA2017_AMO_G3.csv")
G4ELA <- read.csv("./ELA_2017/ELA2017_AMO_G4.csv")
G5ELA <- read.csv("./ELA_2017/ELA2017_AMO_G5.csv")
G6ELA <- read.csv("./ELA_2017/ELA2017_AMO_G6.csv")
G7ELA <- read.csv("./ELA_2017/ELA2017_AMO_G7.csv")
G8ELA <- read.csv("./ELA_2017/ELA2017_AMO_G8.csv")
G11ELA <- read.csv("./ELA_2017/ELA2017_AMO_G11.csv")
head(G7ELA)

# ELA
e3_mean <- mean(G3ELA$Theta)
e3_SE <- mean(G3ELA$SE)
e3_mean
e3_SE

e4_mean <- mean(G4ELA$Theta)
e4_SE <- mean(G4ELA$SE)
e4_mean
e4_SE

e5_mean <- mean(G5ELA$Theta)
e5_SE <- mean(G5ELA$SE)
e5_mean
e5_SE

e6_mean <- mean(G6ELA$Theta)
e6_SE <- mean(G6ELA$SE)
e6_mean
e6_SE

e7_mean <- mean(G7ELA$Theta)
e7_SE <- mean(G7ELA$SE)
e7_mean
e7_SE

e8_mean <- mean(G8ELA$Theta)
e8_SE <- mean(G8ELA$SE)
e8_mean
e8_SE

e11_mean <- mean(G11ELA$Theta)
e11_SE <- mean(G11ELA$SE)
e11_mean
e11_SE

## Read in Math Person files
## Math
math <- readFiles("./Math_2017/", pat = "AMO")
G3Math <- read.csv("./Math_2017/Math2017_AMO_G3.csv")
G4Math <- read.csv("./Math_2017/Math2017_AMO_G4.csv")
G5Math <- read.csv("./Math_2017/Math2017_AMO_G5.csv")
G6Math <- read.csv("./Math_2017/Math2017_AMO_G6.csv")
G7Math <- read.csv("./Math_2017/Math2017_AMO_G7.csv")
G8Math <- read.csv("./Math_2017/Math2017_AMO_G8.csv")
G11Math <- read.csv("./Math_2017/Math2017_AMO_G11.csv")
head(G3Math)

# Mathematics
m3_mean <- mean(G3Math$Theta)
m3_SE <- mean(G3Math$SE)
m3_mean
m3_SE

m4_mean <- mean(G4Math$Theta)
m4_SE <- mean(G4Math$SE)
m4_mean
m4_SE

m5_mean <- mean(G5Math$Theta)
m5_SE <- mean(G5Math$SE)
m5_mean
m5_SE

m6_mean <- mean(G6Math$Theta)
m6_SE <- mean(G6Math$SE)
m6_mean
m6_SE

m7_mean <- mean(G7Math$Theta)
m7_SE <- mean(G7Math$SE)
m7_mean
m7_SE

m8_mean <- mean(G8Math$Theta)
m8_SE <- mean(G8Math$SE)
m8_mean
m8_SE

m11_mean <- mean(G11Math$Theta)
m11_SE <- mean(G11Math$SE)
m11_mean
m11_SE

## Read in Science Person Files
G5Sci <- read.csv("./Science_2017/Sci2017_AMO_G5.csv")
G8Sci <- read.csv("./Science_2017/Sci2017_AMO_G8.csv")
G11Sci <- read.csv("./Science_2017/Sci2017_AMO_G11.csv")
# Science
s5_mean <- mean(G5Sci$Theta)
s5_SE <- mean(G5Sci$SE)
s5_mean
s5_SE

s8_mean <- mean(G8Sci$Theta)
s8_SE <- mean(G8Sci$SE)
s8_mean
s8_SE

s11_mean <- mean(G11Sci$Theta)
s11_SE <- mean(G11Sci$SE)
s11_mean
s11_SE

## Calculate average difficulties from ifiles++++++++++++++++++++++++++++++


library(tidyverse)
library(sundry)

g3ELAIfile <- read.csv("./2017ItemParameters/g3ELAifiles17.csv")
g4ELAIfile <- read.csv("./2017ItemParameters/g4ELAifiles17.csv")
g5ELAIfile <- read.csv("./2017ItemParameters/g5ELAifiles17.csv")
g6ELAIfile <- read.csv("./2017ItemParameters/g6ELAifiles17.csv")
g7ELAIfile <- read.csv("./2017ItemParameters/g7ELAifiles17.csv")
g8ELAIfile <- read.csv("./2017ItemParameters/g8ELAifiles17.csv")
g11ELAIfile <- read.csv("./2017ItemParameters/g11ELAifiles17.csv")
nms(g3ELAIfile)
head(g3ELAIfile, 48)
str(g3ELAIfile)

## Selecting only operational items (removing field test items)
g3ELAIfileOP <- g3ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g4ELAIfileOP <- g4ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g5ELAIfileOP <- g5ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g6ELAIfileOP <- g6ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g7ELAIfileOP <- g7ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8ELAIfileOP <- g8ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g11ELAIfileOP <- g3ELAIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]


g3MathIfile <- read.csv("./2017ItemParameters/g3Mathifiles17.csv")
g4MathIfile <- read.csv("./2017ItemParameters/g4Mathifiles17.csv")
g5MathIfile <- read.csv("./2017ItemParameters/g5Mathifiles17.csv")
g6MathIfile <- read.csv("./2017ItemParameters/g6Mathifiles17.csv")
g7MathIfile <- read.csv("./2017ItemParameters/g7Mathifiles17.csv")
g8MathIfile <- read.csv("./2017ItemParameters/g8Mathifiles17.csv")
g11MathIfile <- read.csv("./2017ItemParameters/g11Mathifiles17.csv")

g3MathIfileOP <- g3MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g4MathIfileOP <- g4MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g5MathIfileOP <- g5MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g6MathIfileOP <- g6MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g7MathIfileOP <- g7MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8MathIfileOP <- g8MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38),]
g11MathIfileOP <- g11MathIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]


g5SciIfile <- read.csv("./2017ItemParameters/g5Sciifiles17.csv")
g8SciIfile <- read.csv("./2017ItemParameters/g8Sciifiles17.csv")
g11SciIfile <- read.csv("./2017ItemParameters/g11Sciifiles17.csv")

g5SciIfileOP <- g5SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g8SciIfileOP <- g8SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]
g11SciIfileOP <- g11SciIfile[-c(16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38), ]

# ELA
e3_mean <- mean(g3ELAIfileOP$Difficulty)
e3_SE <- mean(g3ELAIfileOP$SE)
e3_mean
e3_SE

e4_mean <- mean(g4ELAIfileOP$Difficulty)
e4_SE <- mean(g4ELAIfileOP$SE)
e4_mean
e4_SE

e5_mean <- mean(g5ELAIfileOP$Difficulty)
e5_SE <- mean(g5ELAIfileOP$SE)
e5_mean
e5_SE

e6_mean <- mean(g6ELAIfileOP$Difficulty)
e6_SE <- mean(g6ELAIfileOP$SE)
e6_mean
e6_SE

e7_mean <- mean(g7ELAIfileOP$Difficulty)
e7_SE <- mean(g7ELAIfileOP$SE)
e7_mean
e7_SE

e8_mean <- mean(g8ELAIfileOP$Difficulty)
e8_SE <- mean(g8ELAIfileOP$SE)
e8_mean
e8_SE

e11_mean <- mean(g11ELAIfileOP$Difficulty)
e11_SE <- mean(g11ELAIfileOP$SE)
e11_mean
e11_SE

# Mathematics
m3_mean <- mean(g3MathIfileOP$Difficulty)
m3_SE <- mean(g3MathIfileOP$SE)
m3_mean
m3_SE

m4_mean <- mean(g4MathIfileOP$Difficulty)
m4_SE <- mean(g4MathIfileOP$SE)
m4_mean
m4_SE

m5_mean <- mean(g5MathIfileOP$Difficulty)
m5_SE <- mean(g5MathIfileOP$SE)
m5_mean
m5_SE

m6_mean <- mean(g6MathIfileOP$Difficulty)
m6_SE <- mean(g6MathIfileOP$SE)
m6_mean
m6_SE

m7_mean <- mean(g7MathIfileOP$Difficulty)
m7_SE <- mean(g7MathIfileOP$SE)
m7_mean
m7_SE

m8_mean <- mean(g8MathIfileOP$Difficulty)
m8_SE <- mean(g8MathIfileOP$SE)
m8_mean
m8_SE

m11_mean <- mean(g11MathIfileOP$Difficulty)
m11_SE <- mean(g11MathIfileOP$SE)
m11_mean
m11_SE

# Science
s5_mean <- mean(g5SciIfileOP$Difficulty)
s5_SE <- mean(g5SciIfileOP$SE)
s5_mean
s5_SE

s8_mean <- mean(g8SciIfileOP$Difficulty)
s8_SE <- mean(g8SciIfileOP$SE)
s8_mean
s8_SE

s11_mean <- mean(g11SciIfileOP$Difficulty)
s11_SE <- mean(g11SciIfileOP$SE)
s11_mean
s11_SE


