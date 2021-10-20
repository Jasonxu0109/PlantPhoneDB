CCI_network <- function(interaction_count,mycolor, vertex.label.cex=1.5, edge.label.cex=1, title="",edgeLabel=TRUE){
    color <- data.frame(Ligands_cell=unique(interaction_count$Ligands_cell),color=mycolor[unique(interaction_count$Ligands_cell)])
    interaction_count <- interaction_count %>%
        inner_join(color)
    net <- graph_from_data_frame(interaction_count)
    karate_groups <- cluster_optimal(net)
    coords <- layout_in_circle(net, order= order(membership(karate_groups))) 
    E(net)$width  <- E(net)$Number/10 
    V(net)$color <- mycolor[get.vertex.attribute(net)$name]
    #E(net)$color <- mycolor
    if(edgeLabel){
        E(net)$label <- E(net)$Number
    }
    pic <- plot(net, edge.arrow.size=1, 
     edge.curved=0.2,
     vertex.label.color="black",
     layout = coords,
	 edge.label.cex= edge.label.cex,
     vertex.label.cex=vertex.label.cex,main=title)
}