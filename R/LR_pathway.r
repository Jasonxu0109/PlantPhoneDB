LRTargetFisher <- function(Targets,GeneSets,TotalGene){
    a <- intersect(Targets,GeneSets)
    b <- setdiff(GeneSets,a)
    c <- setdiff(Targets,a)
    abc <- union(a,b)
    abc <- union(abc,c)
    d <- setdiff(TotalGene,abc) 
    tbl <- matrix(c(length(a), length(b), length(c), length(d)), nrow = 2)
    fisher <- fisher.test(tbl, alternative = "two.sided", simulate.p.value=TRUE)
    pvalue <- fisher$p.value
    overlap <- paste(a,collapse = ", ")
    return(list(pvalue=pvalue,overlap=overlap))
}

LR_pathway <- function(lr, objs, CellA, CellB, neighbor, geneSet, cor_value=0.013, ...){
    if(CellA!=CellB){
        degs <- FindMarkers(objs, ident.1 = CellA, ident.2 = CellB, only.pos = TRUE, verbose = FALSE) 
    }else{
        degs <- FindMarkers(objs, ident.1 = CellA, only.pos = TRUE, verbose = FALSE)
    }
    degs <- degs %>%
        filter(p_val_adj<0.05) 
    
    expr <- objs@assays$RNA@data
    expr <- as.data.frame(expr)
    expr <- expr[rowSums(expr)>0,]    
    cluster <- Idents(objs)  
    re <- NULL
    for(i in 1:nrow(lr)){
        needGene <- c(lr$Ligands[i],lr$Receptors[i],rownames(degs))
        if(CellA==CellB){
            expr_flt <- expr[rownames(expr) %in% needGene, cluster %in% CellA]
        }else{
            expr_flt <- expr[rownames(expr) %in% needGene, cluster %in% c(CellA,CellB)]
        }     
        pair <- t(data.frame(apply(expr_flt[c(lr$Ligands[i],lr$Receptors[i]),],2,mean)))
        rownames(pair) <- lr$LR_pair[i]
        expr_flt <- rbind(expr_flt,pair)
        expr_flt <- expr_flt[!rownames(expr_flt) %in% c(lr$Ligands[i],lr$Receptors[i]),]
        corr <- cor(t(expr_flt),method="spearman")
        corGene <- corr[,lr$LR_pair[i]]
        corGene <- corGene[corGene>cor_value]   
        miGene <- rownames(expr_flt)[rownames(expr_flt) %in% names(corGene)]
        ## calculate mutual information
        dat <- discretize(t(expr_flt[miGene,]))
        mi <- mutinformation(dat,method= "mm")
        mi <- aracne.m(mi, 0.15) 
        for(j in 1:ncol(mi)){
            mi[j,j] <- 0
        }
        g <- graph.adjacency(mi,mode="directed",weighted=T) 
        #rank <- page.rank(g)$vector
        #rankGene <- miGene[order(rank,decreasing = TRUE)]
        #degs_flt <- rankGene[1:(length(rankGene)*0.5)]
		selegoV <- ego(g, order=neighbor, nodes=lr$LR_pair[i],mode = "all", mindist = 0)
		selegoG <- induced_subgraph(g,unlist(selegoV))
		degs_flt <- get.vertex.attribute(selegoG)$name
        for(k in unique(geneSet$`Gene set name`)){
            sets <- subset(geneSet,`Gene set name`==k)
            a <- intersect(degs_flt,sets$Gene)
            if(length(a)>0){
                fisher <- LRTargetFisher(Targets=degs_flt,GeneSets=sets$Gene,TotalGene=rownames(expr))
				GeneRatio <- paste(length(a),length(degs_flt),sep="/")
				BgRatio <- paste(length(sets$Gene),length(rownames(expr)),sep="/")
                tmp <- data.frame(LR_pair=lr$LR_pair[i],Cell_pair=lr$Cell_pair[i],Pathway=unique(sets$`Gene set name`),GeneRatio,BgRatio,
                                  Pvalue=fisher$pvalue,OverlapGene=fisher$overlap)
            }else{
                tmp <- NULL
            }
            re <- rbind(re,tmp)
        }
    }
    return(re)

}