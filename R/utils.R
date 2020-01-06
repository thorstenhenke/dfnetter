force_tovec <- function(x, df) {
    stopifnot(is.data.frame(df))
    if (length(x) == 1) {
        x <- df[[x]]
    }
    stopifnot(length(x) == nrow(df))
    x
}

get_names <- function(i) {

}

str_chvec <- function(s) {
    stopifnot(is.vector(s))
    stopifnot(length(s) == 1)
    stopifnot(is.character(s))
    strsplit(s, "")[[1]]
}