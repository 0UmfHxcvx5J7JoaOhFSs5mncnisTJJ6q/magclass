context("Coordinate handling test")

data("population_magpie")

test_that("getCoords can read and write coordinates", {
  x <- population_magpie
  coords <- data.frame(x=1:ncells(x)+0.1,y=ncells(x):1+0.1)
  expect_error(getCoords(x), "No coordinates found")
  expect_silent(getCoords(x) <- coords)
  expect_identical(getCoords(x), coords)
  expect_identical(getItems(x,"x"), sub(".",",",coords$x,fixed=TRUE))
  coords2 <- data.frame(x=coords$y,y=coords$x)
  expect_silent(getCoords(x) <- coords2)
  expect_identical(getItems(x,"x"), sub(".",",",coords2$x,fixed=TRUE))
  expect_identical(getCoords(x), coords2)
  expect_silent(getCoords(x, xlab = "x2", ylab = "y2") <- coords)
  expect_identical(getItems(x,"y2"), sub(".",",",coords$y,fixed=TRUE))
  expect_identical(getCoords(x, xlab = "x2", ylab = "y2"), coords)
})


