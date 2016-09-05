#' check_logit
#'
#' Check logistic regression statistics and assumptions
#'
#' @param model a logit model object to test
#'
#' @return A list containing: the difference between the null deviance and model deviance; the difference in degrees of freedom; the chi-squared probability of the deviance statistic; Cox and Snell pseudo-R^2; Nagelkerke pseudo-R^2; and Hosmer pseudo-R^2.
check_logit <- function(model) {

  # Difference between null model and model should be positive
  # I.e. if model deviance < null model deviance, model is an improvement
  diff_deviance <- model[["null.deviance"]] - model[["deviance"]]

  # Difference in degrees of freedom used to calculate chisq p value
  diff_df       <- model[["df.null"]] - model[["df.residual"]]

  # Determine statistical significance (because diff_deviance is chisq dist)
  chisq_prob    <- 1 - stats::pchisq(q  = diff_deviance, df = diff_df)

  # Pseudo R squares
  cox_snell <- 1 - exp((model[["deviance"]] - model[["null.deviance"]]) /
                         length(model[["fitted.values"]]))
  nagelkerke <- cox_snell /
    (1 - (exp(-(model[["null.deviance"]] / length(model[["fitted.values"]])))))
  hosmer <- diff_deviance / model[["null.deviance"]]

  # List of outputs
  out <- list(
    "diff_deviance" = diff_deviance,
    "diff_df"       = diff_df,
    "chisq_prob"    = chisq_prob,
    "cox_snell"     = cox_snell,
    "nagelkerke"    = nagelkerke,
    "hosmer"        = hosmer)

  out

}
