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

bioFabric( mis_igraph)
