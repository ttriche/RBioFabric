library(RBioFabric)

bfGraph = graph.tree(20, children=2, mode="out")
bfGraph <- autoNameForFabric(bfGraph)
startAtBF1 <- function(bfGraph) {
  return (defaultNodeOrder(bfGraph, firstLabel=V(bfGraph)[1]$name))
}
bioFabric(bfGraph, orderFunc=startAtBF1)

