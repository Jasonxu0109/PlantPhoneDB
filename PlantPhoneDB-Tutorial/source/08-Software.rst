==========================
Software
==========================

PlantPhoneDB installation
--------------------------

To install it, the easiest way is to use the `R` package `devtools` and its function `install_github`. If you don't have all the dependancies needed to use PlantPhoneDB package, run the commands below::

    install.packages(c("devtools", "Seurat", "tidyverse", "ggplot2", "ggsci", "pheatmap", "ggpubr", "RColorBrewer", "patchwork", "lsa", "viridis", "hrbrthemes", "circlize", "chorddiag", "ggplotify", "data.table", "parmigene", "infotheo", "igraph", "cowplot", "grid", "dplyr")) ##Installs devtools and the PlantPhoneDB CRAN dependancies
    
Then you just have to load `devtools` package and run the command below::

    library(devtools)
    install_github("Jasonxu0109/PlantPhoneDB")

Once all the dependencies are downloaded and loaded, you can load the "PlantPhoneDB" package.  

