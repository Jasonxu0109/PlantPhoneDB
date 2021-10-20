LRscore <- function(expr, LRdb, cluster = NULL, min.pct = 0.1, method='LRscore',iterations=10, seed=123, ...){
    expr <- as.data.frame(expr)
    expr <- expr[rowSums(expr)>0,]
    u <- sum(expr)/(nrow(expr)*ncol(expr))
    expr_flt <- function(expr, LR_gene, ident='NK'){
        tmp <- expr[rownames(expr) %in% LR_gene, new_cluster==ident]
        pct <- apply(tmp, 1, function(x){
            sum(x>0)
        })
        pct <- pct/ncol(tmp)
        tmp <- tmp[pct>min.pct, ]
        tmp <- apply(tmp,1,mean)
        return(tmp)
    }
    score <- function(l,r,u=NULL,method='LRscore'){
        if(method=='LRscore'){
            if(!is.null(u)){
                s <- (l*r)^(1/2)/((l*r)^(1/2)+u)   
            }else{
                print('u is NULL')
            }
        }else if(method=='WeightProduct'){
            s <- l*r
            z_scores <- (s-mean(s))/sd(s)
            ## max min normalization
            s <- (z_scores - min(z_scores))/(max(z_scores)-min(z_scores))
        }else if(method=='Average'){
            s <- (l+r)/2
        }else if(method=='Product'){
            s <- (l*r)
        }
      return(as.numeric(s))
    }
    
    LR_result <- NULL
    set.seed(seed)
    for(Ligands_cell in unique(cluster)){
        for(Receptors_cell in unique(cluster)){
            new_cluster <- cluster
            tmp.L <- expr_flt(expr, LRdb$Ligands, Ligands_cell)
            tmp.R <- expr_flt(expr, LRdb$Receptors, Receptors_cell)
            tmp.LR <- LRdb[LRdb$Receptors %in% names(tmp.R) & LRdb$Ligands %in% names(tmp.L),]
			if(nrow(tmp.LR)<=0){
				next
			}
            tmp.LR$Ligands_cell <- Ligands_cell
            tmp.LR$Receptors_cell <- Receptors_cell
            tmp.LR$Ligands_expr <- tmp.L[tmp.LR$Ligands]
            tmp.LR$Receptors_expr <- tmp.R[tmp.LR$Receptors]
            tmp.LR$Score <- score(l=tmp.L[tmp.LR$Ligands], r=tmp.R[tmp.LR$Receptors],u=u, method)
            Score <- matrix(0,nrow(tmp.LR),iterations)
            if(method %in% c('Product','Average')){
                for(i in 1:iterations){
                    cols <- sample(1:ncol(expr),ncol(expr))
                    new_cluster <- cluster[cols]
                    sample.L <- expr_flt(expr, LRdb$Ligands, Ligands_cell)
                    sample.R <- expr_flt(expr, LRdb$Receptors, Receptors_cell)
                    L <- sample.L[tmp.LR$Ligands]
                    L[is.na(L)] <- 0
                    R <- sample.R[tmp.LR$Receptors]
                    R[is.na(R)] <- 0
                    SS <- score(l=L, r=R,u=u, method)
                    Score[,i] <- SS
                }
                p.value <- lapply(1:nrow(tmp.LR),function(x){
                    random <- as.numeric(Score[x,])
                    ttest <- t.test(random,mu=tmp.LR$Score[x],alternative = 'less')
                    return(ttest$p.value)
                })
                tmp.LR$Pvalue <- unlist(p.value)                
            }
            LR_result <- rbind(LR_result,tmp.LR)
        }
    }
    rownames(LR_result) <- 1:nrow(LR_result)
    LR_result$Type <- ifelse(LR_result$Ligands_cell==LR_result$Receptors_cell,'Autocrine','Paracrine')
    LR_result$LR_pair <- paste0(LR_result$Ligands,'->',LR_result$Receptors)
    LR_result$Cell_pair <- paste0(LR_result$Ligands_cell,'->',LR_result$Receptors_cell)
    return(LR_result)
}