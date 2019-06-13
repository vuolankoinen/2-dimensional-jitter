jitter2D <- function (x, y, factor = 1, amount = NULL) 
{
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
    if (is.null(amount)) {
      d <- diff(xx <- unique(sort.int(round(x, 3 - floor(log10(z))))))
      d <- if (length(d))
        min(d)
      else if (xx != 0)
        xx/10
      else z/10
      amount <- factor/5 * abs(d)
    }
    else if (amount == 0)
      amount <- factor * (z/50)
    return(amount)
  }
  amount_x <- f(x)
  amount_y <- f(y)
  ratios <- stats::runif(length(x), 0, 1)
  return(cbind(
    x + ratios * stats::runif(length(x), -amount_x, amount_x),
    y + (1-ratios) * stats::runif(length(x), -amount_y, amount_y)))
}