## News - PlantPhoneDB

![图片](https://user-images.githubusercontent.com/11934986/198816132-e0335929-264b-4512-827b-257981dfcd9e.png)

Due to an updated version of SCTransform (‘v2’) function, we should run `PrepSCTFindMarkers()` before running `FindMarkers()`. So, we updated the corresponding R code ([using_example.ipynb](https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/using_example.ipynb)). 2022-08-22

add marker genes for Fragaria vesca, Populus, Nicotiana attenuata and Lemna minuta. 2022-08-21

The woodland strawberry (Fragaria vesca) leaves single-cell RNA-seq dataset are processing. 2022-08-17

Our article "PlantPhoneDB: A manually curated pan‐plant database of ligand‐receptor pairs infers cell–cell communication" was Published Online. 
To access the article, please click the following link:
https://onlinelibrary.wiley.com/doi/10.1111/pbi.13893

PlantPhoneDB R package successfully passed security detection by OSCS.

[![OSCS Status](https://www.oscs1024.com/platform/badge/Jasonxu0109/PlantPhoneDB.svg?size=small)](https://www.oscs1024.com/project/Jasonxu0109/PlantPhoneDB?ref=badge_small)

We provided a new link for some updates about website. The link is https://jasonxu.shinyapps.io/website/. 2022-08-08

#### Chaoqun Xu#, Dongna Ma#, Qiansu Ding, Ying Zhou*, Hai-Lei Zheng*. PlantPhoneDB: A manually curated pan-plant database of ligand-receptor pairs infers cell-cell communication. (`Plant Biotechnology Journal`;  `Impact Factor 13.263`; **accepted** )

[PlantSCI:](https://github.com/Jasonxu0109/PlantSCI) A **S**ingle **C**ell shiny application for **I**dentification of cell-cell communication. coming soon: 2022-03-20

Developing a Rshiny app for analyzing and visualizing in single cell RNA-seq data. 2022-02-25

A full documentation for PlantPhoneDB is available at https://plantphonedb.readthedocs.io/en/latest/index.html. 2022-02-15

Add help document for functions, such as `LRscore`, `LR_pathway`, etc. 2022-02-13 (Version 1.0.0)

The PlantPhoneDB-Tutorial coming soon: 2022-01-23 

Last package update: 2021-10-26



## [Welcome to PlantPhoneDB](https://jasonxu.shinyapps.io/PlantPhoneDB/)

Welcome! This is the documentation for PlantPhoneDB ([see in detail](https://plantphonedb.readthedocs.io/en/latest/index.html)), a manually curated pan-plant database of ligand-receptor pairs infers cell-cell communication. The web server address is https://jasonxu.shinyapps.io/PlantPhoneDB/ 


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

[Case1.ipynb](https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/Case1.ipynb) was used to infer cell-cell communications from scRNA-seq datasets processed by [using_example.ipynb](https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/using_example.ipynb) .

![图片](https://user-images.githubusercontent.com/11934986/136016102-12e6a465-c532-4daa-83cc-128faa6b5969.png)


## Case 2. Compare the number of interactions among cell types between two datasets (93-11 and Nipponbare)

![图片](https://user-images.githubusercontent.com/11934986/138243287-f28461ff-0fd1-42d3-8d9c-438f6b464d34.png)

# Cite
Please cite the following paper if you used PlantPhoneDB in your research.  

Xu, C., Ma, D., Ding, Q., Zhou, Y., and Zheng, H.-L. (2022) PlantPhoneDB: A manually curated pan-plant database of ligand-receptor pairs infers cell-cell communication. **_Plant Biotechnology Journal_**, 2022, 20, doi: 10.1111/pbi.13893.













