#' check_linearity
#'
#' @param model A linear regression model object ('lm')
#' @param independent The independent variable to test
#' @param dependent The dependent variable to test
#'
#' @return A scatter plot
#' @export
#'
#' @examples check_linearity(m1)
check_linearity <- function(model, independent, dependent) {
  if (class(model) != "lm") {
    stop("Error. Please provide a linear model ('lm')")
  }

  plot(model[["model"]][[independent]], model[["model"]][[dependent]])

}

