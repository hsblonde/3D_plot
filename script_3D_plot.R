#Script to create 3D plot on climate change adaptation, mitigation and biodiversity in tree diversity experiments

#### Packages ####
#install.packages(tidyverse) #Necessary for general data handling. Uncomment if needed tp install.
#install.packages(plotly) #Necessary to create 3D plot. Uncomment if needed to install. 

library(tidyverse) #data handling tools
library(plotly) #3D plot

#### Run example on FORBIO zedelgem compositions. More information here: https://treedivnet.ugent.be/ExpFORBIO.html

# I gave each composition a score on from 1 - 10 on Adaptation (i.e. survival in extreme dry years), Mitigation (growth) and biodiveristy value (importance to associated species)

compositions_scores<-read_csv("compositions_scores.csv") #read the scores for each composition  in as a tibble
View(compositions_scores) #view the dataset for scores

species_codes<-read_csv("species_codes.csv") #the codename for each species
View(species_codes) #view the species codenames

#create 3D plot with plotly library


p<-plot_ly(data = compositions_scores, x = ~Adaptation, y = ~Mitigation, z = ~Biodiversity, text = ~SpComp, 
           type = 'scatter3d',color= ~as.factor(Species_richness), colors = c("#FDE725FF","#3CBB75FF","#2D708EFF","#440154FF")) #color palette viridis, but selected colors myself

p #show interactive plot, species compositions are highlighted on label
  #plot saved via "export' on width = 700 and height = 686

