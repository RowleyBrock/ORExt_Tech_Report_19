setwd("/Users/nadfarley/Documents/AlignAssess_Folder/AlignAssess/ODE_2015_16/ORExt_VerticalScaling/ORExtFinal2016/ORExtFinal2016CleanData/")
library(sundry)

# Read all files in from readFiles function
files <- readFiles(pat = ".csv")
anchors <- readFiles("./Anchors/")

library(r2Winsteps)

# Create anchor file names
aFileNames <- paste0(names(files), "_Anchor")

# Write anchor files
for(i in seq_along(files)) {
	write.anchor(files[[i]][ ,-c(1:12)], anchors[[i]], 
		anchorFileName = aFileNames[i])
}

# Extract just items and demographics
itms <- lapply(files, "[", -1:-12)
dems <- lapply(files, "[", 1:12)

# Create names for anchor files with .txt
afiles <- paste0(aFileNames, ".txt")

itmPars <- batchRunWinsteps(itms, dems, 
	titleL = as.list(names(files)), anchorFile = afiles)

setwd("./ItemParameters/")

for(i in 1:length(itmPars$ItemParameters)) {
	write.csv(itmPars$ItemParameters[[i]], 
		file = paste0(names(itmPars$ItemParameters), ".csv")[i],
		row.names = FALSE)
}

itmsP <- lapply(itms, "[", -seq(16, 38, 2))

setwd("..")
afileNames2 <- paste0(aFileNames, "Pers")

# Write second anchor files
for(i in seq_along(files)) {
	write.anchor(itmsP[[i]], anchors[[i]], 
		anchorFileName = afileNames2[i])
}
afiles2 <- paste0(afileNames2, ".txt")

persPars <- batchRunWinsteps(itmsP, dems, 
	titleL = as.list(names(files)), anchorFile = afiles2)

g7_MthPers <- runWinsteps(files[[14]][ ,-c(1:12)], files[[14]][ ,1:12], 
	anchorFile = "g7Math_Anchor.txt", idelete = c(1:7, 16, 18, 22, 24, 28))

persPars[[1]]$g7MathIfile <- g7_MthPers$ItemParameters
persPars[[2]]$g7MathPfile <- g7_MthPers$PersonParameters


######## Graphing syntax begins ==================

diff <- sapply(persPars[[1]], "[", "Difficulty")
idens <- lapply(diff, density)
names(idens) <- names(files)

thetas <- sapply(persPars[[2]], "[", "Theta")
pdens <- lapply(seq_along(thetas), function(i)  {
	density(thetas[[i]], bw = idens[[i]]$bw)
})
names(pdens) <- names(files)

elaPdens <- pdens[grep("ELA", names(pdens))]
elaIdens <- idens[grep("ELA", names(pdens))]

mthPdens <- pdens[grep("Math", names(pdens))]
mthIdens <- idens[grep("Math", names(pdens))]

sciPdens <- pdens[grep("Sci", names(pdens))]
sciIdens <- idens[grep("Sci", names(pdens))]

dFun <- function(p, i, glevel) {
	plot(p, bty = "n", xlim = c(-6, 6), ylim = c(0, 0.8), 
		main = paste("Grade", glevel))
	lines(i, col = "blue")
	legend("topright", lty = c(1, 1), col = c("black", "blue"), box.lwd = 0, 
		legend = c("Persons", "Items"))
}


### Final graphs. Define the space first with par, then develop the graph with the for loops, respectively

par(mfrow = c(3, 2))
for(i in 2:7) dFun(elaPdens[[i]], elaIdens[[i]], i + 1)
for(i in 2:7) dFun(mthPdens[[i]], mthIdens[[i]], i + 1)

par(mfrow = c(1, 1))
dFun(elaPdens[[1]], elaIdens[[1]], 11)
dFun(mthPdens[[1]], mthIdens[[1]], 11)

par(mfrow = c(3, 1))
for(i in 1:3) dFun(sciPdens[[i]], sciIdens[[i]], c(5, 8, 11)[i])



