CCI_circle <- function(interaction_count, mycolor){
    # parameters
    circos.clear()
    circos.par(start.degree = 90, gap.degree = 4, track.margin = c(-0.1, 0.1), points.overflow.warning = FALSE)
    par(mar = rep(0, 4))
	arr.col <- interaction_count %>%
        select(Ligands_cell,Receptors_cell) %>%
        unique() %>%
        mutate(color='black') %>%
        as.data.frame()
    # color palette
    #mycolor <- viridis(num_cluster, alpha = 1, begin = 0, end = 1, option = "D")
    #mycolor <- mycolor[sample(1:num_cluster)]  
    chordDiagram(
      x = interaction_count, 
      grid.col = mycolor,
      transparency = 0.25,
      directional = 1,
      direction.type = c("arrows", "diffHeight"), 
      diffHeight  = -0.04,
      annotationTrack = "grid", 
      annotationTrackHeight = c(0.05, 0.1),
      #link.arr.type = "big.arrow", 
        symmetric = TRUE,
      link.sort = TRUE, 
      link.arr.col = arr.col, link.arr.length = 0.3,
      link.largest.ontop = TRUE)

    # Add text and axis
    circos.trackPlotRegion(
      track.index = 1, 
      bg.border = NA, 
      panel.fun = function(x, y) {
        xlim = get.cell.meta.data("xlim")
        sector.index = get.cell.meta.data("sector.index")
        # Add names to the sector. 
        circos.text(
          x = mean(xlim), 
          y = 3.2, 
          labels = sector.index, 
          facing = "bending", 
          cex = 1.5
          )
      }
    )
}