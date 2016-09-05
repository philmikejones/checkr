datasets::occupationalStatus

m1 <- glm(destination ~ origin, data = datasets::occupationalStatus,
          family = binomial())
m1 <- checkr::check_logit(m1)

context("Test check_logit function")
test_that("Test pseudo-R^2 measures are approximately equal", {
  expect_lt(m1$cox_snell,  0.01)
  expect_lt(m1$hosmer,     0.01)
  expect_lt(m1$nagelkerke, 0.01)
})
test_that("Test chi-square test is not significant", {
  expect_equal(m1$chisq_prob, 1)
})
