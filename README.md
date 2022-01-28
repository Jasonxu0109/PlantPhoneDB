## News - PlantPhoneDB
The PlantPhoneDB-Tutorial coming soon: 2022-01-23 

Last package update: 2021-10-26



## [Welcome to PlantPhoneDB](https://jasonxu.shinyapps.io/PlantPhoneDB/)

Welcome! This is the documentation for PlantPhoneDB ([see in detail](https://plantphonedb.readthedocs.io/en/latest/index.html)), a manually curated pan-plant database of ligand-receptor pairs infers cell-cell communication. The web sever address is https://jasonxu.shinyapps.io/PlantPhoneDB/ 


![图片](https://user-images.githubusercontent.com/11934986/135700266-4ba26d9f-0b4c-41bb-a1b8-a06aff12fbd7.png)

## Package installation

To install it, the easiest way is to use the `R` package `devtools` and its function `install_github`. If you don't have all the dependancies needed to use PlantPhoneDB package, run the commands below:  

install.packages(c("devtools", "Seurat", "tidyverse", "ggplot2", "ggsci", "pheatmap", "ggpubr", "RColorBrewer", "patchwork", "lsa", "viridis", "hrbrthemes", "circlize", "chorddiag", "ggplotify", "data.table", "parmigene", "infotheo", "igraph", "cowplot", "grid", "dplyr")) ##Installs devtools and the PlantPhoneDB CRAN dependancies
 
Then you just have to load `devtools` package and run the command below:

    library(devtools)
    install_github("Jasonxu0109/PlantPhoneDB")

Once all the dependencies are downloaded and loaded, you can load the ‘PlantPhoneDB’ package.    
Examples on how to use `PlantPhoneDB` package functions can be found as below:


## Case 1. Significant cell-cell interactions of Heat-Shocked Root Cells in *Arabidopsis thaliana*

![图片](https://user-images.githubusercontent.com/11934986/136016102-12e6a465-c532-4daa-83cc-128faa6b5969.png)


## Case 2. Compare the number of interactions among cell types between two datasets (93-11 and Nipponbare)

![图片](https://user-images.githubusercontent.com/11934986/138243287-f28461ff-0fd1-42d3-8d9c-438f6b464d34.png)















