library(RBioFabric)
library(igraph)

# d3 example from BioFabric
#  source:   https://github.com/wjrl/D3BioFabric
#  example:  http://rawgit.com/wjrl/D3BioFabric/master/src/JustBioFabric.html

miserables <- jsonlite::fromJSON(
  "https://rawgit.com/wjrl/D3BioFabric/master/src/data/miserablesSimple.json"
)

mis_igraph <- graph.data.frame(
  d = miserables$links
  ,vertices = data.frame(
    id = as.character( 0:(nrow(miserables$nodes)-1) ) 
    ,name = miserables$nodes
    ,stringsAsFactors = F
  )
)

bioFabric( mis_igraph )

bioFabric_htmlwidget( bioFabric( mis_igraph ))


# demo userOrder with igraph topological sort
bioFabric_htmlwidget(
  bioFabric(
    mis_igraph
    ,userOrder=get.data.frame(mis_igraph,what="vertices")[rev(topological.sort(mis_igraph)),]
    )
  )
# for fun let's not rev the sort
bioFabric_htmlwidget(
  bioFabric(
    mis_igraph
    ,userOrder=get.data.frame(mis_igraph,what="vertices")[topological.sort(mis_igraph),]
  )
)
