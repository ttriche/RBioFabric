RBioFabric
==========

An R implementation of the BioFabric network visualization tool by [William Longabaugh (@wjrl)](https://github.com/wjrl)

This fork is almost entirely code from the original source, but this forked version is an attempt to add an interactive `htmlwidget` BioFabric visualization directly from `R`.  It will leverage the functionality of `bioFabric` and all the power of `igraph`.  This is highly experimental, but it does work.  If you would like to try, here is some code.

Most of the remaining work is adding helpful interactivity on the `d3.js`/JavaScript side.  Thankfully, [@maxogden](https://github.com/maxogden) had started generalizing @wjrl's JavaScript [here](https://github.com/maxogden/biofabric).  So far, I have been able to add crude pan/zoom, better sizing, and a first pass at helpful `mouseover` interactivity.

### Installation

`RBioFabric` is not on CRAN, so please install with `devtools`.

```r
devtools::install_github("timelyportfolio/RBioFabric")
```

### Examples

Here are a couple examples.

```r
#devtools::install_github("timelyportfolio/RBioFabric")

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
```