RBioFabric
==========

An R implementation of the BioFabric network visualization tool.

The `htmlwidget` branch will provide an interactive BioFabric visualization directly from `R`.  It will leverage the functionality of `bioFabric` and all the power of `igraph`.  This is highly experimental, but it does work.  If you would like to try, here is some code.

```r
#devtools::install_github("timelyportfolio/RBioFabric@htmlwidget")

library(igraph)
library(RBioFabric)

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

bioFabric_htmlwidget( bioFabric( mis_igraph ) )

```


```
library(igraph)
library(igraphdata)
library(RBioFabric)

data(Koenigsberg)

bioFabric_htmlwidget( bioFabric( Koenigsberg ) )