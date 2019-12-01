# This program plot a data frame as a box plot

##########
# required libraries
##########
if (!require("BiocManager")) {
  install.packages("BiocManager", ask =FALSE)
  library("BiocManager")
}
if (!require("ggplot2")) {
  install.packages("ggplot2", ask =FALSE)
  library("ggplot2")
}
if (!require("reshape2")) {
  install.packages("reshape2", ask =FALSE)
  library("reshape2")
}
if (!require("utils")) {
  install.packages("utils", ask =FALSE)
  library("utils")
}

########
# Data given by the user
#########
path_to_dataframe <- choose.files()
#path_to_your_results<- choose.dir(default = "", caption = "Select folder")
#path_to_your_results<- normalizePath(path_to_your_results)
# path_to_dataframe <- c("/media/rmejia/ADATA/boba-bk-postsismo/rmejia/Documents/Otros_Proyectos_academicos/Emerson_Cells/Data/imagelist_count_curated3.csv")
# path_to_your_results<-c("/media/rmejia/ADATA/boba-bk-postsismo/rmejia/Documents/Otros_Proyectos_academicos/Emerson_Cells/Results/")


########
#
#######
mydf <-read.csv(path_to_dataframe, stringsAsFactors = TRUE)
head(mydf)

#########
##
#########
mydf <- mydf[, -grep("Number",colnames(mydf)) ]
mydf <- mydf[, -grep("Name",colnames(mydf)) ]
mydf <- mydf[ apply(!is.na(mydf),1,all) , ]

fixed_colnames<-setdiff(colnames( mydf), c("Lipid.Droplets","Autophagosomes","Lamellar.bodies"))
data_col_names <-  c("Lipid.Droplets","Autophagosomes","Lamellar.bodies")


plotdf <- mydf[, c(fixed_colnames,data_col_names[1])]
plotdf[,"Cell.line"] <- as.factor(plotdf[,"Cell.line"])
plotdf[,"Treatment"] <- as.factor(plotdf[,"Treatment"])
str(plotdf)
Title <- data_col_names[1]
pdf(file= paste0(Title,".pdf"))
ggplot(plotdf, aes(x=Treatment, y=Lipid.Droplets, fill=Cell.line)) + 
  geom_boxplot() + ggtitle(Title)
ggplot(plotdf, aes(x=Cell.line, y=Lipid.Droplets, fill=Treatment)) + 
  geom_boxplot()+ ggtitle(Title)
dev.off()

plotdf <- mydf[, c(fixed_colnames,data_col_names[2])]
plotdf[,"Cell.line"] <- as.factor(plotdf[,"Cell.line"])
plotdf[,"Treatment"] <- as.factor(plotdf[,"Treatment"])
str(plotdf)
Title <- data_col_names[2]
pdf(file= paste0(Title,".pdf"))
ggplot(plotdf, aes(x=Treatment, y=Autophagosomes, fill=Cell.line)) + 
  geom_boxplot() + ggtitle(Title)
ggplot(plotdf, aes(x=Cell.line, y=Autophagosomes, fill=Treatment)) + 
  geom_boxplot()+ ggtitle(Title)
dev.off()

plotdf <- mydf[, c(fixed_colnames,data_col_names[3])]
plotdf[,"Cell.line"] <- as.factor(plotdf[,"Cell.line"])
plotdf[,"Treatment"] <- as.factor(plotdf[,"Treatment"])
str(plotdf)
Title <- data_col_names[3]
pdf(file= paste0(Title,".pdf"))
ggplot(plotdf, aes(x=Treatment, y=Lamellar.bodies, fill=Cell.line)) + 
  geom_boxplot() + ggtitle(Title)
ggplot(plotdf, aes(x=Cell.line, y=Lamellar.bodies, fill=Treatment)) + 
  geom_boxplot()+ ggtitle(Title)
dev.off()


#z = "Lipid.Droplets"
# for( z in data_col_names){
#   plotdf <- mydf[, c(fixed_colnames, z)]
#   plotdf[,"Cell.line"] <- as.factor(plotdf[,"Cell.line"])
#   plotdf[,"Treatment"] <- as.factor(plotdf[,"Treatment"])
#   str(plotdf)
#   Title <- z
#   
#   pdf(file= paste0(z,".pdf"))
#   ggplot(plotdf, aes(x=Treatment, y=z, fill=Cell.line)) + 
#     geom_boxplot() + ggtitle(Title)
#   ggplot(plotdf, aes(x=Cell.line, y=z, fill=Treatment)) + 
#     geom_boxplot()+ ggtitle(Title)  
#   dev.off()
# }
