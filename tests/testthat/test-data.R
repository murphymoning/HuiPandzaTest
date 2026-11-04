test_that("ch4_tytko_2026 matches Chapter 4 (Code Blocks 4.6-4.14)", {
  expect_equal(dim(ch4_tytko_2026), c(130, 5))
  expect_named(ch4_tytko_2026, c("ID", "condition", "comprehension",
                                 "dwell_image", "integrative_saccades"))
  expect_false(anyNA(ch4_tytko_2026))
  expect_equal(as.vector(table(ch4_tytko_2026$condition)), c(65, 65))
  d <- subset(ch4_tytko_2026, condition == "RI")
  expect_equal(d$comprehension[1], 0.8965517, tolerance = 1e-6)
  r <- cor.test(~ integrative_saccades + comprehension, data = d)
  expect_equal(unname(r$estimate), 0.3812491, tolerance = 1e-6)
  expect_equal(r$conf.int[1:2], c(0.1514310, 0.5719634), tolerance = 1e-6)
  sp <- cor.test(~ dwell_image + comprehension, data = d, method = "spearman", exact = FALSE)
  expect_equal(unname(sp$estimate), 0.0314625, tolerance = 1e-6)
})

test_that("ch4_sim_swahili matches Chapter 4 (Code Blocks 4.1-4.2)", {
  s <- ch4_sim_swahili
  expect_equal(dim(s), c(40, 3))
  expect_equal(s$Name[1:4], c("Jimin", "Jisoo", "Yuna", "P104"))
  r <- cor.test(s$time_hours, s$vocab_score)
  expect_equal(unname(r$estimate), 0.9429707, tolerance = 1e-6)
  expect_equal(r$conf.int[1:2], c(0.8940972, 0.9696508), tolerance = 1e-6)
})

test_that("ch3_sim_listen_overlap matches Chapter 3 (Code Block 3.4)", {
  expect_equal(dim(ch3_sim_listen_overlap), c(40, 2))
  tt <- t.test(score ~ group, data = ch3_sim_listen_overlap)
  expect_equal(unname(tt$statistic), -2.030819, tolerance = 1e-6)
  expect_equal(tt$conf.int[1:2], c(-7.190170, -0.01), tolerance = 1e-6)
  })

test_that("ch5_sim_wm_read matches Chapter 5 (Code Blocks 5.1-5.3)", {
  d <- ch5_sim_wm_read
  expect_equal(dim(d), c(10000, 3))
  expect_equal(sum(d$in_sample), 50)
  expect_equal(cor(d$WM, d$reading), 0.3, tolerance = 1e-6)
  s <- subset(d, in_sample, select = c(WM, reading))
  m1 <- lm(reading ~ WM, data = s)
  expect_equal(unname(coef(m1)), c(60.149279, 0.216833), tolerance = 1e-6)
  expect_equal(s$reading[3], 70.2041, tolerance = 1e-4)
})
