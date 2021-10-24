```R
library(readxl)
library(tidyverse)
library(homologene)
library(data.table)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(ggvenn)
library(tidyr)
library(venn)
```

    Warning message:
    "package 'tidyverse' was built under R version 4.0.5"
    -- [1mAttaching packages[22m ------------------------------------------------------------------------------- tidyverse 1.3.1 --
    
    [32mv[39m [34mggplot2[39m 3.3.5     [32mv[39m [34mpurrr  [39m 0.3.4
    [32mv[39m [34mtibble [39m 3.1.2     [32mv[39m [34mdplyr  [39m 1.0.6
    [32mv[39m [34mtidyr  [39m 1.1.3     [32mv[39m [34mstringr[39m 1.4.0
    [32mv[39m [34mreadr  [39m 2.0.0     [32mv[39m [34mforcats[39m 0.5.1
    
    Warning message:
    "package 'ggplot2' was built under R version 4.0.5"
    Warning message:
    "package 'tibble' was built under R version 4.0.5"
    Warning message:
    "package 'tidyr' was built under R version 4.0.5"
    Warning message:
    "package 'readr' was built under R version 4.0.5"
    Warning message:
    "package 'dplyr' was built under R version 4.0.5"
    Warning message:
    "package 'forcats' was built under R version 4.0.5"
    -- [1mConflicts[22m ---------------------------------------------------------------------------------- tidyverse_conflicts() --
    [31mx[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31mx[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    
    Warning message:
    "package 'homologene' was built under R version 4.0.5"
    Warning message:
    "package 'data.table' was built under R version 4.0.5"
    
    Attaching package: 'data.table'
    
    
    The following objects are masked from 'package:dplyr':
    
        between, first, last
    
    
    The following object is masked from 'package:purrr':
    
        transpose
    
    
    Warning message:
    "package 'ggvenn' was built under R version 4.0.5"
    Loading required package: grid
    
    Warning message:
    "package 'venn' was built under R version 4.0.5"
    

UniProtKB 2021_03 results


```R
# keyword:"Cell membrane [KW-1003]" AND reviewed:yes AND organism:"Arabidopsis thaliana (Mouse-ear cress) [3702]"
```


```R
Receptors <- read_excel('uniprot数据库/ath/uniprot-keyword KW-1003+reviewed yes+organism Arabidopsis+thaliana+(M--.xlsx')
```


```R
Receptors <- Receptors %>%
                as.data.frame() %>%
                mutate(`Gene names  (ordered locus )`=toupper(`Gene names  (ordered locus )`)) %>%
                select(Entry,Status,`Gene names  (ordered locus )`,`Gene names  (primary )`)
```


```R
dim(Receptors)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1320</li><li>4</li></ol>




```R
head(Receptors)
```


<table class="dataframe">
<caption>A data.frame: 6 × 4</caption>
<thead>
	<tr><th></th><th scope=col>Entry</th><th scope=col>Status</th><th scope=col>Gene names  (ordered locus )</th><th scope=col>Gene names  (primary )</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>Q9FZ59</td><td>reviewed</td><td>AT1G17750</td><td>PEPR2</td></tr>
	<tr><th scope=row>2</th><td>Q9S7Z8</td><td>reviewed</td><td>AT1G70940</td><td>PIN3 </td></tr>
	<tr><th scope=row>3</th><td>Q9SKG5</td><td>reviewed</td><td>AT2G13790</td><td>SERK4</td></tr>
	<tr><th scope=row>4</th><td>Q39086</td><td>reviewed</td><td>AT1G65790</td><td>SD17 </td></tr>
	<tr><th scope=row>5</th><td>Q8RXA7</td><td>reviewed</td><td>AT1G49040</td><td>SCD1 </td></tr>
	<tr><th scope=row>6</th><td>Q9FGM1</td><td>reviewed</td><td>AT5G53160</td><td>PYL8 </td></tr>
</tbody>
</table>




```R
# keyword:"Secreted [KW-0964]" AND reviewed:yes AND organism:"Arabidopsis thaliana (Mouse-ear cress) [3702]"
```


```R
Ligands <- read_excel('uniprot数据库/ath/uniprot-keyword KW-0964+reviewed yes+organism Arabidopsis+thaliana+(M--.xlsx')
```


```R
Ligands <- Ligands %>%
                as.data.frame() %>%
                mutate(`Gene names  (ordered locus )`=toupper(`Gene names  (ordered locus )`)) %>%
                select(Entry,Status,`Gene names  (ordered locus )`,`Gene names  (primary )`)
```


```R
dim(Ligands)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1369</li><li>4</li></ol>




```R
o <- intersect(Receptors$Entry,Ligands$Entry)
```


```R
Ligands <- Ligands[!Ligands$Entry %in% o,]
Receptors <- Receptors[!Receptors$Entry %in% o,]
```


```R
dim(Ligands)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1334</li><li>4</li></ol>




```R
dim(Receptors)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1285</li><li>4</li></ol>




```R
# uniprot
# reviewed:yes AND organism:"Arabidopsis thaliana (Mouse-ear cress) [3702]"
uniprot <- read_excel('uniprot数据库/ath/uniprot-filtered-reviewed yes+AND+organism Arabidopsis+thaliana+(Mouse---.xlsx')
```

    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M2017 / R2017C13: got 'INTRAMEM 88..108;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M2019 / R2019C13: got 'INTRAMEM 74..94;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M2613 / R2613C13: got 'INTRAMEM 127..146;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M2785 / R2785C13: got 'INTRAMEM 74..94;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 147..166;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 172..192;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M4462 / R4462C13: got 'INTRAMEM 111..130;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"; INTRAMEM 225..244;  /note="Pore-forming; Name=Pore-forming 2";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M5060 / R5060C13: got 'INTRAMEM 1..21;  /note="Helical";  /evidence="ECO:0000255|HAMAP-Rule:MF_03216"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M5200 / R5200C13: got 'INTRAMEM 246..260;  /note="Pore-forming; Name=Pore-forming 1"; INTRAMEM 616..630;  /note="Pore-forming; Name=Pore-forming 2"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M5747 / R5747C13: got 'INTRAMEM 418..438;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M5780 / R5780C13: got 'INTRAMEM 277..296;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M6153 / R6153C13: got 'INTRAMEM 1..18;  /note="Note=Mediates targeting to membranes";  /evidence="ECO:0000250|UniProtKB:Q9NVJ2"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M8391 / R8391C13: got 'INTRAMEM 266..285;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M8630 / R8630C13: got 'INTRAMEM 1..18;  /note="Note=Mediates targeting to membranes";  /evidence="ECO:0000250|UniProtKB:Q9NVJ2"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M9647 / R9647C13: got 'INTRAMEM 1..18;  /note="Note=Mediates targeting to membranes";  /evidence="ECO:0000250|UniProtKB:Q9NVJ2"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M10087 / R10087C13: got 'INTRAMEM 260..279;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M10838 / R10838C13: got 'INTRAMEM 249..268;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M11929 / R11929C13: got 'INTRAMEM 266..285;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M11931 / R11931C13: got 'INTRAMEM 268..287;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M11934 / R11934C13: got 'INTRAMEM 242..261;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M12063 / R12063C13: got 'INTRAMEM 249..268;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M13015 / R13015C13: got 'INTRAMEM 152..171;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"; INTRAMEM 276..295;  /note="Pore-forming; Name=Pore-forming 2";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M13044 / R13044C13: got 'INTRAMEM 87..107;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 142..162;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 166..186;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M13073 / R13073C13: got 'INTRAMEM 70..89;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"; INTRAMEM 184..203;  /note="Pore-forming; Name=Pore-forming 2";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M13727 / R13727C13: got 'INTRAMEM 278..297;  /note="Pore-forming; Name=Segment H5";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M14028 / R14028C13: got 'INTRAMEM 181..200;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"; INTRAMEM 302..321;  /note="Pore-forming; Name=Pore-forming 2";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M14061 / R14061C13: got 'INTRAMEM 185..204;  /note="Pore-forming; Name=Pore-forming 1";  /evidence="ECO:0000255"; INTRAMEM 302..321;  /note="Pore-forming; Name=Pore-forming 2";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M14090 / R14090C13: got 'INTRAMEM 76..96;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 149..168;  /note="Helical";  /evidence="ECO:0000255"; INTRAMEM 174..194;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M14193 / R14193C13: got 'INTRAMEM 140..161;  /evidence="ECO:0000250"; INTRAMEM 401..421;  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M15240 / R15240C13: got 'INTRAMEM 77..97;  /note="Helical";  /evidence="ECO:0000255"'"
    Warning message in read_fun(path = enc2native(normalizePath(path)), sheet_i = sheet, :
    "Expecting logical in M15523 / R15523C13: got 'INTRAMEM 367..387;  /note="Helical";  /evidence="ECO:0000255"'"
    


```R
uniprot <- uniprot %>%
                as.data.frame() %>%
                mutate(`Gene names  (ordered locus )`=toupper(`Gene names  (ordered locus )`)) %>%
                select(Entry,Status,`Gene names  (ordered locus )`,`Gene names  (primary )`)
```


```R
dim(uniprot)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>16111</li><li>4</li></ol>




```R
head(uniprot)
```


<table class="dataframe">
<caption>A data.frame: 6 × 4</caption>
<thead>
	<tr><th></th><th scope=col>Entry</th><th scope=col>Status</th><th scope=col>Gene names  (ordered locus )</th><th scope=col>Gene names  (primary )</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>Q93VR4</td><td>reviewed</td><td>AT1G24020</td><td>MLP423 </td></tr>
	<tr><th scope=row>2</th><td>Q9ZUA3</td><td>reviewed</td><td>AT2G01750</td><td>MAP70.3</td></tr>
	<tr><th scope=row>3</th><td>Q9M0T3</td><td>reviewed</td><td>AT4G08470</td><td>MEKK3  </td></tr>
	<tr><th scope=row>4</th><td>Q84LK0</td><td>reviewed</td><td>AT3G24320</td><td>MSH1   </td></tr>
	<tr><th scope=row>5</th><td>Q94AT1</td><td>reviewed</td><td>AT5G53140</td><td>NA     </td></tr>
	<tr><th scope=row>6</th><td>Q6R8G7</td><td>reviewed</td><td>AT1G14040</td><td>PHO1;H3</td></tr>
</tbody>
</table>




```R
# http://proteomics.ysu.edu/secretomes/plant/index.php
SecKB <- read.table('plant_secretome/funseckb2_search_results.txt',sep='\t')
```


```R
dim(SecKB)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1118</li><li>4</li></ol>




```R
head(SecKB)
```


<table class="dataframe">
<caption>A data.frame: 6 × 4</caption>
<thead>
	<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>A0MEX7</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Cysteine-rich repeat secretory protein 30  (CRRSP30)</td></tr>
	<tr><th scope=row>2</th><td>A7REE5</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Protein RALF-like 3  (RALFL3)                       </td></tr>
	<tr><th scope=row>3</th><td>A7REH2</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Protein RALF-like 30  (RALFL30)                     </td></tr>
	<tr><th scope=row>4</th><td>A8MQ92</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Protein RALF-like 2  (RALFL2)                       </td></tr>
	<tr><th scope=row>5</th><td>A8MQI8</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Protein RALF-like 5  (RALFL5)                       </td></tr>
	<tr><th scope=row>6</th><td>A8MQL7</td><td>Arabidopsis thaliana </td><td>Secreted (curated)</td><td>Protein RALF-like 20  (RALFL20)                     </td></tr>
</tbody>
</table>




```R
SecKB_ligands <- uniprot %>%
    filter(Entry %in% SecKB$V1)
```


```R
dim(SecKB_ligands)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1116</li><li>4</li></ol>



Receptor-Like Kinases(RLKs) and Receptor-Like Proteins(RLPs)


```R
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC58549/bin/pnas_181141598_2.html
RLK <- read_excel('List of Arabidopsis Receptor-Like Kinases.xlsx')
```


```R
# https://www.arabidopsis.org/browse/genefamily/Receptor_kinase.jsp
#Receptor kinase-like Gene Family
RLK_GF <- read_excel('List of Arabidopsis Receptor kinase-like Gene Family.xlsx')
```


```R
# Expansion of the Receptor-Like Kinase/Pelle Gene Family and Receptor-Like Proteins in Arabidopsis
# Newly identified RLK/Pelle family members
# LK/Pelle family member   
# AT2G11530,AT3G45920,AT1G22720,AT2G30730,AT3G08760

# RLCK XII
# AT1G01740,AT4G00710,AT5G41260,AT3G54030,AT3G09240,AT1G63500,AT5G46570,AT1G50990,AT2G17170,AT3G57750,AT3G52530,AT3G57700,AT3G57730,AT3G57740,AT3G57640,AT1G65190,AT2G40270,AT3G57120
```


```R
new_RLK <- c("AT2G11530","AT3G45920","AT1G22720","AT2G30730","AT3G08760","AT1G01740","AT4G00710","AT5G41260","AT3G54030","AT3G09240","AT1G63500","AT5G46570","AT1G50990","AT2G17170","AT3G57750","AT3G52530","AT3G57700","AT3G57730","AT3G57740","AT3G57640","AT1G65190","AT2G40270","AT3G57120")
```


```R
RLKP <- c(RLK$GeneName,new_RLK,RLK_GF$Gene)
```


```R
RLKP<- unique(toupper(RLKP))
```


```R
length(RLKP)
```


646



```R
RLKP_receptors <- uniprot %>%
    filter(`Gene names  (ordered locus )` %in% RLKP)
```


```R
dim(RLKP_receptors)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>510</li><li>4</li></ol>




```R
Receptors <- rbind(RLKP_receptors,Receptors)
Receptors <- unique(Receptors)
```


```R
Ligands <- rbind(SecKB_ligands,Ligands)
Ligands <- unique(Ligands)
```


```R
dim(Ligands)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1371</li><li>4</li></ol>




```R
dim(Receptors)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1489</li><li>4</li></ol>




```R
o <- intersect(Receptors$Entry,Ligands$Entry)
Ligands <- Ligands[!Ligands$Entry %in% o,]
```


```R
dim(Ligands)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1357</li><li>4</li></ol>




```R
dim(Receptors)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1489</li><li>4</li></ol>



protein protein interaction


```R
STRING <- fread('STRING/3702.protein.links.v11.0.txt.gz')
```


```R
STRING <- STRING %>%
    as.data.frame() %>%
    filter(combined_score>600) %>%
    mutate(protein1=str_extract(protein1,'AT\\d+G\\d+')) %>%
    mutate(protein2=str_extract(protein2,'AT\\d+G\\d+')) %>%
    drop_na()
```


```R
head(STRING)
```


<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>protein1</th><th scope=col>protein2</th><th scope=col>combined_score</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>AT1G01010</td><td>AT1G06149</td><td>865</td></tr>
	<tr><th scope=row>2</th><td>AT1G01010</td><td>AT1G17080</td><td>762</td></tr>
	<tr><th scope=row>3</th><td>AT1G01010</td><td>AT1G18340</td><td>624</td></tr>
	<tr><th scope=row>4</th><td>AT1G01010</td><td>AT1G06150</td><td>624</td></tr>
	<tr><th scope=row>5</th><td>AT1G01010</td><td>AT1G11570</td><td>624</td></tr>
	<tr><th scope=row>6</th><td>AT1G01010</td><td>AT5G26600</td><td>922</td></tr>
</tbody>
</table>




```R
LR_STRING <- STRING %>%
    filter(protein1 %in% c(Ligands$`Gene names  (ordered locus )`) & protein2 %in% c(Receptors$`Gene names  (ordered locus )`)) %>%
    mutate(Ligands=protein1,Receptors=protein2,source='STRING') %>%
    unique() %>%
    select(Ligands,Receptors,source)
```


```R
dim(LR_STRING)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1112</li><li>3</li></ol>




```R
head(LR_STRING)
```


<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>Ligands</th><th scope=col>Receptors</th><th scope=col>source</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>AT1G01900</td><td>AT2G02220</td><td>STRING</td></tr>
	<tr><th scope=row>2</th><td>AT1G01900</td><td>AT3G02130</td><td>STRING</td></tr>
	<tr><th scope=row>3</th><td>AT1G01980</td><td>AT5G10770</td><td>STRING</td></tr>
	<tr><th scope=row>4</th><td>AT1G02640</td><td>AT5G09870</td><td>STRING</td></tr>
	<tr><th scope=row>5</th><td>AT1G02640</td><td>AT4G13800</td><td>STRING</td></tr>
	<tr><th scope=row>6</th><td>AT1G02790</td><td>AT4G14815</td><td>STRING</td></tr>
</tbody>
</table>




```R
# https://downloads.thebiogrid.org/BioGRID/Release-Archive/BIOGRID-4.4.199/
# grep 'taxid:3702' BIOGRID-ALL-4.4.199.mitab.txt >PPI_arth.BIOGRID
# gawk -F"[: \t]" '/taxid:3702/{print $3,$6}' BIOGRID-ALL-4.4.199.mitab.txt >PPI_arth.BIOGRID
```


```R
BIOGRID <- readLines("蛋白互作数据库/PPI_arth.BIOGRID")
```


```R
PPI_BIOGRID <- lapply(BIOGRID,function(x){
    x <- str_extract_all(x,'AT\\d+G\\d+')
    x <- unlist(unique(x))
    re <- data.frame(ID1=x[1],ID2=x[2])
})
```


```R
PPI_BIOGRID <- do.call('rbind',PPI_BIOGRID)
PPI_BIOGRID <- na.omit(PPI_BIOGRID)
PPI_BIOGRID <- unique(PPI_BIOGRID)
PPI_BIOGRID <- PPI_BIOGRID[PPI_BIOGRID$ID1!=PPI_BIOGRID$ID2,]
```


```R
PPI_BIOGRID2 <- data.frame(ID1=PPI_BIOGRID$ID2,ID2=PPI_BIOGRID$ID1)
PPI_BIOGRID <- rbind(PPI_BIOGRID,PPI_BIOGRID2)
PPI_BIOGRID <- unique(PPI_BIOGRID)
```


```R
dim(PPI_BIOGRID)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>80048</li><li>2</li></ol>




```R
LR_BIOGRID <- PPI_BIOGRID %>%
    filter(ID1 %in% c(Ligands$`Gene names  (ordered locus )`) & ID2 %in% c(Receptors$`Gene names  (ordered locus )`)) %>%
    unique() %>%
    mutate(Ligands=ID1,Receptors=ID2,source='BIOGRID') %>%
    select(Ligands,Receptors,source)
```


```R
dim(LR_BIOGRID)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>109</li><li>3</li></ol>




```R
head(LR_BIOGRID)
```


<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>Ligands</th><th scope=col>Receptors</th><th scope=col>source</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1560</th><td>AT2G38540</td><td>AT5G37780</td><td>BIOGRID</td></tr>
	<tr><th scope=row>1919</th><td>AT2G29960</td><td>AT1G13980</td><td>BIOGRID</td></tr>
	<tr><th scope=row>2010</th><td>AT2G05520</td><td>AT1G21250</td><td>BIOGRID</td></tr>
	<tr><th scope=row>2011</th><td>AT2G05520</td><td>AT5G19280</td><td>BIOGRID</td></tr>
	<tr><th scope=row>2873</th><td>AT2G27250</td><td>AT1G75820</td><td>BIOGRID</td></tr>
	<tr><th scope=row>14663</th><td>AT2G03670</td><td>AT4G34460</td><td>BIOGRID</td></tr>
</tbody>
</table>




```R
interactome <- fread('TAIR/Quick_interactome2.0.txt')
interactome <- interactome[,1:2]
```


```R
interactome <- interactome[interactome$TAIR8A !=interactome$TAIR8B,]
```


```R
dim(interactome)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>70700</li><li>2</li></ol>




```R
interactome2 <- data.frame(TAIR8A=interactome$TAIR8B,TAIR8B=interactome$TAIR8A)
interactome <- rbind(interactome,interactome2)
interactome <- unique(interactome)
```


```R
dim(interactome)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>141400</li><li>2</li></ol>




```R
LR_interactome <- interactome %>%
    drop_na() %>%
    filter(TAIR8A %in% c(Ligands$`Gene names  (ordered locus )`) & TAIR8B %in% c(Receptors$`Gene names  (ordered locus )`)) %>%
    unique() %>%
    mutate(Ligands=TAIR8A,Receptors=TAIR8B,source='interactome2.0') %>%
    select(Ligands,Receptors,source)
```


```R
dim(LR_interactome)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>50</li><li>3</li></ol>




```R
head(LR_interactome)
```


<table class="dataframe">
<caption>A data.table: 6 × 3</caption>
<thead>
	<tr><th scope=col>Ligands</th><th scope=col>Receptors</th><th scope=col>source</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>AT2G05520</td><td>AT1G21250</td><td>interactome2.0</td></tr>
	<tr><td>AT2G27250</td><td>AT1G75820</td><td>interactome2.0</td></tr>
	<tr><td>AT2G29960</td><td>AT1G13980</td><td>interactome2.0</td></tr>
	<tr><td>AT4G23170</td><td>AT3G43810</td><td>interactome2.0</td></tr>
	<tr><td>AT3G12490</td><td>AT1G02680</td><td>interactome2.0</td></tr>
	<tr><td>AT5G20340</td><td>AT1G04750</td><td>interactome2.0</td></tr>
</tbody>
</table>




```R
# grep 'taxid:3702(arath)' intact.txt >intact_arth.txt
```


```R
IntAct <- fread('IntAct/intact_arth.txt')
```


```R
IntAct <- IntAct[,1:2]
```


```R
IntAct$V1 <- gsub('uniprotkb:','',IntAct$V1)
IntAct$V2 <- gsub('uniprotkb:','',IntAct$V2)
IntAct <- na.omit(IntAct)
```


```R
IntAct <- IntAct[IntAct$V1!=IntAct$V2,]
```


```R
IntAct2 <- data.frame(V1=IntAct$V2,V2=IntAct$V1)
IntAct <- rbind(IntAct,IntAct2)
IntAct <- unique(IntAct)
```


```R
tmp <- merge(IntAct,uniprot,by.x='V1',by.y='Entry')
tmp <- merge(tmp,uniprot,by.x='V2',by.y='Entry')
```


```R
IntAct <- tmp[,c(4,7)]
```


```R
colnames(IntAct) <- c('V1','V2')
```


```R
IntAct <- na.omit(IntAct)
```


```R
LR_IntAct <- IntAct %>%
    filter(V1 %in% c(Ligands$`Gene names  (ordered locus )`) & V2 %in% c(Receptors$`Gene names  (ordered locus )`)) %>%
    unique() %>%
    mutate(Ligands=V1,Receptors=V2,source='IntAct') %>%
    select(Ligands,Receptors,source)
```


```R
ENOG <- fread('complete_orthogroup_protID_mapping.csv')
ENOG <- ENOG %>%
    as.data.frame() %>%
    filter(spec=='arath') %>%
    mutate(gene=str_extract_all(ProteinID,'AT\\d+G\\d+')) %>%
    mutate(gene=as.character(gene)) %>%
    select(ID,gene)
```


```R
head(ENOG)
```


<table class="dataframe">
<caption>A data.frame: 6 × 2</caption>
<thead>
	<tr><th></th><th scope=col>ID</th><th scope=col>gene</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>ENOG411ECXG</td><td>AT3G01080</td></tr>
	<tr><th scope=row>2</th><td>ENOG411DWNV</td><td>AT1G13960</td></tr>
	<tr><th scope=row>3</th><td>ENOG411DWNV</td><td>AT2G03340</td></tr>
	<tr><th scope=row>4</th><td>ENOG411DQZD</td><td>AT3G27090</td></tr>
	<tr><th scope=row>5</th><td>ENOG411DQZD</td><td>AT3G29530</td></tr>
	<tr><th scope=row>6</th><td>ENOG411DPN7</td><td>AT3G08920</td></tr>
</tbody>
</table>




```R
scores <- fread('allplants_cfms_scores_annot.txt')
scores <- scores %>%
    filter(P_1>0.3) %>%
    as.data.frame() %>%
    dplyr::select(ID1,ID2) %>%
    unique()
```


```R
scores <- merge(scores,ENOG,by.x='ID1',by.y='ID')
scores <- unique(scores)
scores <- merge(scores,ENOG,by.x='ID2',by.y='ID')
scores <- unique(scores)
```


```R
scores <- scores %>%
    filter(gene.x!='character(0)' & gene.y!='character(0)') %>%
    filter(gene.x!=gene.y) %>%
    select(gene.x,gene.y)
```


```R
dim(scores)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>101170</li><li>2</li></ol>




```R
scores2 <- data.frame(gene.x=scores$gene.y,gene.y=scores$gene.x)
scores <- rbind(scores,scores2)
scores <- unique(scores)
```


```R
LR_plantMap <- scores %>%
    filter(gene.x %in% c(Ligands$`Gene names  (ordered locus )`) & gene.y %in% c(Receptors$`Gene names  (ordered locus )`)) %>%
    unique() %>%
    mutate(Ligands=gene.x,Receptors=gene.y,source='plant.MAP') %>%
    select(Ligands,Receptors,source)
```


```R
dim(LR_plantMap)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>22</li><li>3</li></ol>




```R
literature <- read_excel('LR_pair_literature.xlsx')
```


```R
head(literature)
```


<table class="dataframe">
<caption>A tibble: 6 × 4</caption>
<thead>
	<tr><th scope=col>Receptor</th><th scope=col>ID1</th><th scope=col>Ligand</th><th scope=col>ID2</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ACR4</td><td>Q9LX29</td><td>CLE40</td><td>Q9LXU0</td></tr>
	<tr><td>BAK1</td><td>Q94F62</td><td>NA   </td><td>NA    </td></tr>
	<tr><td>BAM1</td><td>O49545</td><td>CLV3 </td><td>Q9XF04</td></tr>
	<tr><td>BAM1</td><td>O49545</td><td>CLE5 </td><td>Q8S8N2</td></tr>
	<tr><td>BAM1</td><td>O49545</td><td>CLE11</td><td>Q3ECU1</td></tr>
	<tr><td>BAM1</td><td>O49545</td><td>CLE18</td><td>Q3ECH9</td></tr>
</tbody>
</table>




```R
literature <- merge(literature,uniprot,by.x='ID1',by.y='Entry')
literature <- merge(literature,uniprot,by.x='ID2',by.y='Entry')
```


```R
literature <- literature[,c(9,6)]
colnames(literature) <- c('Ligands','Receptors')
```


```R
literature$source <- 'literature'
```


```R
dim(literature)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>174</li><li>3</li></ol>




```R
head(literature)
```


<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>Ligands</th><th scope=col>Receptors</th><th scope=col>source</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>AT3G50610</td><td>AT1G72180</td><td>literature</td></tr>
	<tr><th scope=row>2</th><td>AT3G50610</td><td>AT5G49660</td><td>literature</td></tr>
	<tr><th scope=row>3</th><td>AT5G66816</td><td>AT1G72180</td><td>literature</td></tr>
	<tr><th scope=row>4</th><td>AT5G66816</td><td>AT5G49660</td><td>literature</td></tr>
	<tr><th scope=row>5</th><td>AT5G51451</td><td>AT5G48940</td><td>literature</td></tr>
	<tr><th scope=row>6</th><td>AT5G51451</td><td>AT4G26540</td><td>literature</td></tr>
</tbody>
</table>



orthologs assignment


```R
CSOmap <- read.table('PlantPhoneDB/CSOmap/LR_pairs.txt',head=T)
```


```R
CellTalkDB <- read.table('PlantPhoneDB/CellTalkDB/human_lr_pair.txt',head=T)
```


```R
CellTalkDB <- CellTalkDB[,2:3]
```


```R
CSOmap <- CSOmap[,1:2]
```


```R
LRdb <- fread('PlantPhoneDB/SingleCellSignalR/LRdb_122019.txt')
```


```R
LRdb <- LRdb[,1:2]
```


```R
colnames(CellTalkDB) <- c('Ligand','Receptor')
```


```R
colnames(LRdb) <- c('Ligand','Receptor')
```


```R
colnames(CSOmap) <- c('Ligand','Receptor')
```


```R
LR_orthologs <- rbind(CSOmap,LRdb,CellTalkDB)
```


```R
LR_orthologs <- unique(LR_orthologs)
LR_orthologs <- LR_orthologs[LR_orthologs$Receptor !=LR_orthologs$Ligand,]
```


```R
#Homologene <- fread('同源基因/homologene.data',sep='\t')
```


```R
head(LR_orthologs)
```


<table class="dataframe">
<caption>A data.frame: 6 × 2</caption>
<thead>
	<tr><th></th><th scope=col>Ligand</th><th scope=col>Receptor</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>A2M   </td><td>LRP1  </td></tr>
	<tr><th scope=row>2</th><td>AANAT </td><td>MTNR1A</td></tr>
	<tr><th scope=row>3</th><td>AANAT </td><td>MTNR1B</td></tr>
	<tr><th scope=row>4</th><td>ACE   </td><td>AGTR2 </td></tr>
	<tr><th scope=row>5</th><td>ACE   </td><td>BDKRB2</td></tr>
	<tr><th scope=row>6</th><td>ADAM10</td><td>AXL   </td></tr>
</tbody>
</table>




```R
human <- read_excel('uniprot数据库/human/uniprot-filtered-reviewed yes+AND+organism Homo+sapiens+(Human)+[96--.xlsx')
human <- human %>%
    as.data.frame() %>%
    mutate(`Gene names  (ordered locus )`=toupper(`Gene names  (ordered locus )`)) %>%
    select(Entry,Status,`Gene names  (primary )`)
```


```R
##
InParanoid <- read.table('同源基因/InParanoid.A.thaliana-H.sapiens/sqltable.A.thaliana-H.sapiens',sep='\t',fill=T,head=F)
```


```R
InParanoid <- InParanoid[,c(1,2,5,3)]
colnames(InParanoid) <- c('HID','Gene.ID','Gene.Symbol','Taxonomy')
```


```R
head(InParanoid)
```


<table class="dataframe">
<caption>A data.frame: 6 × 4</caption>
<thead>
	<tr><th></th><th scope=col>HID</th><th scope=col>Gene.ID</th><th scope=col>Gene.Symbol</th><th scope=col>Taxonomy</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>1</td><td>4133</td><td>Q9SSD2</td><td>A.thaliana</td></tr>
	<tr><th scope=row>2</th><td>1</td><td>4133</td><td>F4JUG5</td><td>A.thaliana</td></tr>
	<tr><th scope=row>3</th><td>1</td><td>4133</td><td>Q6P2Q9</td><td>H.sapiens </td></tr>
	<tr><th scope=row>4</th><td>2</td><td>2451</td><td>Q9SYP1</td><td>A.thaliana</td></tr>
	<tr><th scope=row>5</th><td>2</td><td>2451</td><td>O48534</td><td>A.thaliana</td></tr>
	<tr><th scope=row>6</th><td>2</td><td>2451</td><td>O75643</td><td>H.sapiens </td></tr>
</tbody>
</table>




```R
InParanoid_homologene = function(genes, inTax, outTax,dataset){
    genes <- unique(genes) #remove duplicates
    out = dataset %>% 
        dplyr::filter(Taxonomy %in% inTax & (Gene.Symbol %in% genes | Gene.ID %in% genes)) %>%
        dplyr::select(HID,Gene.Symbol,Gene.ID)
    names(out)[2] = inTax
    names(out)[3] = paste0(inTax,'_ID')
    
    out2 = dataset %>%  dplyr::filter(Taxonomy %in% outTax & HID %in% out$HID) %>%
      dplyr::select(HID,Gene.Symbol,Gene.ID)
    names(out2)[2] = outTax
    names(out2)[3] = paste0(outTax,'_ID')
    
    output = merge(out,out2) %>% dplyr::select(2,4,3,5)

    # preserve order with temporary column
    output$sortBy <- factor(output[,1], levels = genes)
    output <- dplyr::arrange(output, sortBy)
    output$sortBy <- NULL
    
    return(output)
}
```


```R
tmp <- merge(LR_orthologs,human,by.x='Ligand',by.y='Gene names  (primary )')
tmp <- merge(tmp,human,by.x='Receptor',by.y='Gene names  (primary )')
```


```R
tmp <- tmp[,c('Entry.x','Entry.y')]
colnames(tmp) <- c('Ligands','Receptors')
```


```R
L <- InParanoid_homologene(tmp$Ligands,'H.sapiens','A.thaliana',InParanoid)
L <- L[,1:2]
R <- InParanoid_homologene(tmp$Receptors,'H.sapiens','A.thaliana',InParanoid)
R <- R[,1:2]
```


```R
tmp2 <- merge(tmp,L,by.x='Ligands',by.y='H.sapiens')
tmp2 <- merge(tmp2,R,by.x='Receptors',by.y='H.sapiens')
```


```R
tmp2 <- tmp2[,3:4]
colnames(tmp2) <- c('Ligands','Receptors')
```


```R
tmp2 <- unique(tmp2)
```


```R
dim(tmp2)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>3123</li><li>2</li></ol>




```R
tmp2 <- merge(tmp2,uniprot,by.x='Ligands',by.y='Entry')
tmp2 <- merge(tmp2,uniprot,by.x='Receptors',by.y='Entry')
```


```R
LR_orthologs <- tmp2[,c('Gene names  (ordered locus ).x','Gene names  (ordered locus ).y')]
colnames(LR_orthologs) <- c('Ligands','Receptors')
```


```R
LR_orthologs$source <- 'orthologs'
```


```R
LR_orthologs <- LR_orthologs[LR_orthologs$Receptor !=LR_orthologs$Ligand,]
```


```R
LR_pair <- rbind(LR_STRING,LR_IntAct,LR_BIOGRID,LR_interactome,LR_plantMap,literature,LR_orthologs)
```


```R
table(LR_pair$source)
```


    
           BIOGRID         IntAct interactome2.0     literature      orthologs 
               109            103             50            174           2087 
         plant.MAP         STRING 
                22           1112 



```R
LR_pair$Organism <- 'Arabidopsis thaliana'
```


```R
#save(LR_pair,file='LR_pair_ath.RDa')
```


```R
dim(unique(LR_pair[,1:2]))
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>3514</li><li>2</li></ol>




```R

```

# Oryza sativa


```R

```


```R
tmp <- merge(LR_pair,uniprot,by.x='Ligands',by.y='Gene names  (ordered locus )')
tmp <- merge(tmp,uniprot,by.x='Receptors',by.y='Gene names  (ordered locus )')
```


```R
tmp <- tmp[,c('Entry.x','Entry.y')]
colnames(tmp) <- c('Ligands','Receptors')
```


```R
LR_convert <- function(specieA='A.thaliana',specieB='Z.mays',score=0.1,LRdb,InParanoid,...){
    InParanoid <- InParanoid[InParanoid$V4>score,]
    InParanoid <- InParanoid[,c(1,2,5,3)]
    colnames(InParanoid) <- c('HID','Gene.ID','Gene.Symbol','Taxonomy')
    L <- InParanoid_homologene(LRdb$Ligands,specieA,specieB,InParanoid)
    L <- L[,1:2]
    R <- InParanoid_homologene(LRdb$Receptors,specieA,specieB,InParanoid)
    R <- R[,1:2]
    LRdb2 <- merge(LRdb,L,by.x='Ligands',by.y=specieA)
    LRdb2 <- merge(LRdb2,R,by.x='Receptors',by.y=specieA) 
    LRdb2 <- LRdb2[,3:4]
    colnames(LRdb2) <- c('Ligands','Receptors')
    LRdb2 <- LRdb2[LRdb2$Ligands!= LRdb2$Receptors,]
    LRdb2 <- unique(LRdb2)
    LRdb2$source <- 'orthologs'
    return(LRdb2)
}
```


```R
##
InParanoid <- read.table('同源基因/InParanoid.A.thaliana-O.sativa/sqltable.A.thaliana-O.sativa',sep='\t',fill=T,head=F)
```


```R
LR_pair_osa <- LR_convert(specieA='A.thaliana',specieB='O.sativa',score=0.1,LRdb=tmp,InParanoid)
LR_pair_osa$Organism <- 'Oryza sativa'
```


```R
#save(LR_pair_osa,file='LR_pair_osa.RDa')
```


```R
dim(unique(LR_pair_osa[,1:2]))
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>3762</li><li>2</li></ol>



# Solanum lycopersicum


```R
##
InParanoid <- read.table('同源基因/InParanoid.A.thaliana-S.lycopersicum/sqltable.A.thaliana-S.lycopersicum',sep='\t',fill=T,head=F)
```


```R
LR_pair_sly <- LR_convert(specieA='A.thaliana',specieB='S.lycopersicum',score=0.1,LRdb=tmp,InParanoid)
LR_pair_sly$Organism <- 'Solanum lycopersicum'
```


```R
#save(LR_pair_sly,file='LR_pair_sly.RDa')
```


```R
dim(unique(LR_pair_sly[,1:2]))
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>1751</li><li>2</li></ol>



# zea mays 


```R
# zea mays AND reviewed:no AND organism:"Zea mays (Maize) [4577]"
```


```R
#less -S  uniprot-reviewed\ yes+AND+organism\ Arabidopsis+thaliana+\(Mouse-ear+cress--.fasta |awk -F"[>|]" '{if($0~/>/){print $1">"$3}else{print $1}}'|less -S >ath.fasta
#less -S  less -S  uniprot-zea+mays-filtered-reviewed\ no+AND+organism\ Zea+mays+\(Maize\)+%--.fasta |awk -F"[>|]" '{if($0~/>/){print $1">"$3}else{print $1}}'|less -S >zma.fasta |awk -F"[>|]" '{if($0~/>/){print $1">"$3}else{print $1}}'|less -S >zma.fasta
# perl inparanoid.pl ../ath.fasta ../zma.fasta

```


```R
##
InParanoid <- read.table('同源基因/InParanoid.A.thaliana-zma/sqltable.ath.fasta-zma.fasta',sep='\t',fill=T,head=F)
```


```R
LR_pair_zma <- LR_convert(specieA='A.thaliana',specieB='Z.mays',score=0.9,LRdb=tmp,InParanoid)
LR_pair_zma$Organism <- 'Zea mays'
```


```R
#save(LR_pair_zma,file='LR_pair_zma.RDa')
```


```R
dim(unique(LR_pair_zma[,1:2]))
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>2823</li><li>2</li></ol>



# Populus alba x Populus glandulosa


```R
InParanoid <- read.table('同源基因/InParanoid.A.thaliana-pp/sqltable.ath.fasta-84K.v3.1.proteins.fasta',sep='\t',fill=T,head=F)
```


```R
LR_pair_pp <- LR_convert(specieA='A.thaliana',specieB='Populus alba x Populus glandulosa',score=0.9,LRdb=tmp,InParanoid)
LR_pair_pp$Organism <- 'Populus alba x Populus glandulosa'
```


```R
#save(LR_pair_pp,file='LR_pair_pp.RDa')
```


```R
dim(unique(LR_pair_pp[,1:2]))
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>3110</li><li>2</li></ol>




```R

```


```R

```
