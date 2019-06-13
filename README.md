# 2-dimensional-jitter
Helper R function for plotting overlapping data points.  
The function **jitter2D**(x, y, factor, amount) takes two numerical vectors of equal length, and returns a matrix with two columns, containing randomly shifted original inputs.

Optional parameters _factor_ and _amount_ allow control of the amount of added noise:
 - Increasing _factor_ increases the dispersal. Values greater than 5 allow the closest points to overlap after jittering.
 - _amount_ gives the range of added noise. If a single value is passed, it used for both vectors. Both can be specified separately by passing a vector of length two.

The base::jitter() by Werner Stahel and Martin Maechler, ETH Zurich is helpful in plotting overlapping data points, but shifts the points along the axis. Sometimes it would produce a prettier image if the points were shifted radially instead, hence I modified this helper function from theirs.
