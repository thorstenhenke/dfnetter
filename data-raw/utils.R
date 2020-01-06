make_net <- function(n) {
    m <- matrix(0, n, n)
    m[upper.tri(m, diag = FALSE)] <- 1
    m
}

expand_net <- function(x, n) {
    stopifnot(n >= nrow(x))
    y <- matrix(0, nrow(x), n)
    y[, 1:ncol(x)] <- y[, 1:ncol(x)] + x
    y
}

permute_nets <- function(x) {
    stopifnot(is.data.frame(x) || is.matrix(x))
    i <- sample.int(ncol(x))
    x[,i]
}

