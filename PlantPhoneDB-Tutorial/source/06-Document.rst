==========================
Document
==========================
We provide the R script needed to reproduce the processed scRNA-seq datasets results of PlantPhoneDB.

**Quick Installation**

First, install devtools (for installing GitHub packages) if it isn't already installed::

    if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

Then, install BiocManager (for installing bioconductor packages) if it isn't already installed::

    if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
	
Also, install from CRAN::

    install.packages('Seurat')
    library(Seurat)
	
Then, install sceasy, data.table, readxl and anndata, etc. Once all the dependencies are downloaded and loaded, you can run this R script below for analyzing scRNA-seq datasets collected by `PlantPhoneDB <https://jasonxu.shinyapps.io/PlantPhoneDB/>`_.

`using_example.ipynb <https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/using_example.ipynb>`_ was used for analyzing scRNA-seq datasets collected by PlantPhoneDB.

-------------------------- 

We provide the R script needed to reproduce analyze results of Case 1 (Figure 5), significant cell-cell interactions of Heat-Shocked Root Cells in `Arabidopsis thaliana`.

`Case1.ipynb <https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/Case1.ipynb>`_ was used to infer cell-cell communications from scRNA-seq datasets processed by 
`using_example.ipynb <https://github.com/Jasonxu0109/PlantPhoneDB/blob/main/PlantPhoneDB-Tutorial/using_example.ipynb>`_.
