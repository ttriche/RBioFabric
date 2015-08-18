#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
bioFabric_htmlwidget <- function(data, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = data
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
  shinyWidgetOutput(outputId, 'bioFabric_htmlwidget', width, height, package = 'RBioFabric')
}

#' @rdname bioFabric_htmlwidget-shiny
#' @export
renderBioFabric_htmlwidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, bioFabric_htmlwidgetOutput, env, quoted = TRUE)
}
