m1 <- glm(destination ~ origin, data = datasets::occupationalStatus,
          family = binomial())
m1 <- checkr::check_logit(m1)

context("Test over results")
test_that("Intercept is in results", {
  expect_true(grepl("(Intercept)", m1$ind$predictor[1]))
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
