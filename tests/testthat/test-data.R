test_that("tytko_2026_ri matches Chapter 4 (Code Blocks 4.3-4.12)", {
  d <- tytko_2026_ri
  expect_equal(dim(d), c(65, 4))
  expect_named(d, c("ID", "comprehension", "dwell_image", "integrative_saccades"))
  expect_false(anyNA(d))
  expect_equal(d$comprehension[1], 0.8965517, tolerance = 1e-6)
  r <- cor.test(~ integrative_saccades + comprehension, data = d)
  expect_equal(unname(r$estimate), 0.3812491, tolerance = 1e-6)
  expect_equal(r$conf.int[1:2], c(0.1514310, 0.5719634), tolerance = 1e-6)
})


test_that("sim_swahili matches Chapter 4 (Code Blocks 4.1-4.2)", {
  s <- sim_swahili
  expect_equal(dim(s), c(40, 3))
  expect_equal(s$Name[1:4], c("Jimin", "Jisoo", "Yuna", "P104"))
  r <- cor.test(s$time_hours, s$vocab_score)
  expect_equal(unname(r$estimate), 0.9429707, tolerance = 1e-6)
  expect_equal(r$conf.int[1:2], c(0.8940972, 0.9696508), tolerance = 1e-6)
})
