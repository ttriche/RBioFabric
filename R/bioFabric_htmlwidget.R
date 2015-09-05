#' Create an Interactive BioFabric Plot
#'
#' bioFabric produces static plot.  This uses the output from bioFabric
#' to create a rich interactive d3.js visualization.  Since it is an 
#' htmlwidget, it will work in all R contexts including the console, RStudio,
#' rmarkdown, and Shiny.
#' 
#' @param data an \code{expression} to create a \code{\link{bioFabric}} plot
#' @param zoomMin,zoomMax \code{numeric} giving the minimum and maximum allowable
#'          zoom.  The defaults are \code{zoomMin = 0.5}.
#'          and \code{zoomMax = 15}.
#' @param width,height a valid \code{CSS} size for the \code{div} container
#'          for the htmlwidget output.
#'
#' @example inst/examples/igraph_example.R
#' @example inst/examples/miserables_example.R
#' 
#' @import htmlwidgets
#'
#' @export
bioFabric_htmlwidget <- function(
  data, zoomMin = 0.5, zoomMax = 15, width = NULL, height = NULL
) {
  
  # convert igraph
  if(inherits(data,"igraph")){
    #  need names if not provided
    data <- autoNameForFabric( data )
    data <- get.data.frame(
      autoNameForFabric( data )
      , what="both"
    )
    data <- list(
      nodes = data.frame(
        "name" = data$vertices$name
        , data$vertices[-match("name",names(data$vertices))]
        , stringsAsFactors = FALSE
      )
      , links = data.frame(
        "source" = match(data$edges$from, data$vertices$name) - 1
        , "target" = match(data$edges$to, data$vertices$name) - 1
        , data$edges[-match(c("to","from"),names(data$edges))]
      )
    )
  }
  
  # forward options using x
  x = list(
    data = data,
    options = list(
      zoomMin = zoomMin,
      zoomMax = zoomMax
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'bioFabric_htmlwidget',
    x,
    width = width,
    height = height,
    package = 'RBioFabric'
  )
}

#' Shiny bindings for bioFabric_htmlwidget
#'
#' Output and render functions for using bioFabric_htmlwidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bioFabric_htmlwidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bioFabric_htmlwidget-shiny
#'
#' @export
bioFabric_htmlwidgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'bioFabric_htmlwidget', width, height, package = 'RBioFabric')
}

#' @rdname bioFabric_htmlwidget-shiny
#' @export
renderBioFabric_htmlwidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, bioFabric_htmlwidgetOutput, env, quoted = TRUE)
}
