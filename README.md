# 2-dimensional-jitter
Helper R function for plotting overlapping data points.  
The function **jitter2D** takes two numerical vectors of equal length, and returns a matrix with two columns, containing randomly shifted original inputs.
The base::jitter() by Werner Stahel and Martin Maechler, ETH Zurich is helpful in plotting overlapping data points, but shifts the points along the axis. Sometimes it would produce a prettier image if the points were shifted radially instead, hence I modified this helper function from theirs.
