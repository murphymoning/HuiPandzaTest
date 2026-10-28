test_that("ch4_tytko_2026_ri matches Chapter 4 (Code Blocks 4.3-4.12)", {
  d <- ch4_tytko_2026_ri
  expect_equal(dim(d), c(65, 4))
  expect_named(d, c("ID", "comprehension", "dwell_image", "integrative_saccades"))
  expect_false(anyNA(d))
  expect_equal(d$comprehension[1], 0.8965517, tolerance = 1e-6)
  r <- cor.test(~ integrative_saccades + comprehension, data = d)
  expect_equal(unname(r$estimate), 0.3812491, tolerance = 1e-6)
  expect_equal(r$conf.int[1:2], c(0.1514310, 0.5719634), tolerance = 1e-6)
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

test_that("Tytko raw files have the structure Code Block 4.S1 expects", {
  expect_equal(dim(ch4_tytko_2026_comp), c(66, 91))
  expect_equal(dim(ch4_tytko_2026_list), c(66, 2))
  expect_equal(dim(ch4_tytko_2026_con), c(540, 3))
  expect_equal(dim(ch4_tytko_2026_et), c(6825, 14))
  expect_equal(names(ch4_tytko_2026_et)[c(2, 6, 9, 14)],
               c("ID", "PvsT", "IA_DWELL_TIME", "IntegrSacc"))
})
