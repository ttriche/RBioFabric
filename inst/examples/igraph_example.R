library(igraph)
library(igraphdata)
library(RBioFabric)

bfGraph = graph.tree(20, children=2, mode="out")
bfGraph <- autoNameForFabric(bfGraph)
startAtBF1 <- function(bfGraph) {
  return (defaultNodeOrder(bfGraph, firstLabel=V(bfGraph)[1]$name))
}

bioFabric_htmlwidget(
  bioFabric(bfGraph, orderFunc=startAtBF1)
)

bioFabric_htmlwidget(
  bioFabric(bfGraph)
)

data(karate)
bioFabric_htmlwidget(
  bioFabric(karate)
)

# use igraph cohesive.blocks example
#   to show how we can provide a different sort order
## The science camp network
mw <- graph.formula(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
                    5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
                    10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
                    17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
                    21-22:23, 22-23)

mwBlocks <- cohesive.blocks(mw)
plot(mwBlocks, mw)

# use default order which is degree
bioFabric( mw )

# if we wanted to specify by block order
bioFabric_htmlwidget(
  bioFabric(
    mw
    , userOrder = get.data.frame(
      mw
      ,what = "vertices"
    )[unique(c(unlist(blocks(mwBlocks)[-1]),1:length(V(mw)))),]
  )
)