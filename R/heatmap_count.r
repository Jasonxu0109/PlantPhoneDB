heatmap_count <- function(interaction_count,log10=FALSE,decimal=1,text_size=15,color='black',number_size=5,title=NULL){
    if(log10){
        interaction_count$Number <- log10(interaction_count$Number+1)
    }
    pic <- ggplot(interaction_count,aes(Ligands_cell,Receptors_cell, fill=Number)) + 
      geom_tile(colour='white') + 
      scale_fill_viridis_c(position="right")+
      theme(axis.ticks.x = element_blank(),
            axis.ticks.y = element_blank())+
      theme_bw()+
      theme(axis.title=element_text(size=text_size),
            axis.text=element_text(size=text_size,color='black'),
            axis.text.x=element_text(size=text_size,angle=60,hjust=1),
            legend.text=element_text(size=text_size),
            plot.title = element_text(size = text_size,hjust=0.5))+
        coord_equal()+
        ggtitle(title)
    
    ### annotate number
    for(i in 1:nrow(interaction_count)){
        if(interaction_count$Number[i]<median(interaction_count$Number)){
            color <- 'white'
        }else{
            color <- 'black'
        }
    pic <- pic+
    annotate("text", x = interaction_count$Ligands_cell[i], y = interaction_count$Receptors_cell[i], 
             label = round(interaction_count$Number[i],decimal),color=color,size=number_size)
}
    return(pic)
}