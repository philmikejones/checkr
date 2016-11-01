m1 <- glm(destination ~ origin, data = datasets::occupationalStatus,
          family = binomial())
m1 <- checkr::check_logit(m1)

context("Test over results")
test_that("Intercept is in results", {
  expect_true(grepl("(Intercept)", m1$ind$predictor[1]))
})
test_that("Odds ratio in range of confidence intervals", {
  expect_true(all(m1$ind$odds_ratio > m1$ind$lower_ci, na.rm = TRUE))
  expect_true(all(m1$ind$odds_ratio < m1$ind$upper_ci, na.rm = TRUE))
})
test_that("p values between 0 and 1", {
  expect_true(all(m1$ind$p_value <= 1, na.rm = TRUE))
  expect_true(all(m1$ind$p_value >= 0, na.rm = TRUE))
})


context("Test ind results")
test_that("Test pseudo-R^2 measures are approximately equal", {
  expect_lt(m1$over$cox_snell,  0.01)
  expect_lt(m1$over$hosmer,     0.01)
  expect_lt(m1$over$nagelkerke, 0.01)
})
test_that("Test chi-square test is not significant", {
  expect_equal(m1$over$chisq_prob, 1)
})
