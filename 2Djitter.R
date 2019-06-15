jitter2D <- function (x, y, factor = 1, amount = NULL)   {
  if (length(x) == 0L)
    return(x)
  if (!is.numeric(x))
    stop("'x' must be numeric")
  if (!is.numeric(y))
    stop("'y' must be numeric")
  if (length(x) != length(y))
    stop("'x' and 'y' must be of the same length")
  f <- function(x) {
    z <- diff(r <- range(x[is.finite(x)]))
    if (z == 0)
      z <- abs(r[1L])
    if (z == 0)
      z <- 1
    d <- diff(xx <- unique(sort.int(round(x, 3 - floor(log10(z))))))
    d <- if (length(d))
      min(d)
    else if (xx != 0)
      xx/10
    else z/10
    amount <- factor/5 * abs(d)
    return(amount)
  }
  if (length(amount) == 2L) {
    amount_x <- amount[1L]
    amount_y <- amount[2L]
  } else if (length(amount) == 1L) {
    amount.x <- amount.y <- amount
  } else {
    amount.x <- f(x)
    amount.y <- f(y)
  }
  directions <- stats::runif(length(x), 0, pi * 2)
  amounts <- stats::runif(length(x))
  return(cbind(
    x + cos(directions) * amount.x * amounts,
    y + sin(directions) * amount.y * amounts))
}
