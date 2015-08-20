library(igraph)
library(igraphdata)
library(dplyr)
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

# use igraph dendPlot example
#   to show how we can provide a different sort order
data( karate )
fc <- fastgreedy.community(karate)
plot(fc, karate)

# use default order which is degree
bioFabric( karate )

# if we wanted to specify by community
bioFabric_htmlwidget(
  bioFabric(
    karate
    , userOrder = 
      data.frame(membership = membership(fc), degree = degree(karate)) %>%
        mutate( id = rownames(.) ) %>%
        arrange( membership, desc( degree ) ) %>%
        select( id ) %>%
        as.vector
  )
)


# let's sort by authority score
bioFabric_htmlwidget(
  bioFabric(
    karate
    , userOrder = names(sort(authority.score(karate)$vector,decreasing=TRUE))
  )
)
