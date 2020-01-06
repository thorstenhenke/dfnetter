validity_check_regex_internal <- function(r) {
    stopifnot(is.character(r))
    stopifnot(length(r) == 1)
    stopifnot(grepl("^[X.]+$", r))
}

gen_regex_internal <- function(pseudo_r) {
    # Einfach in die Syntax einbringen, eine 0 als Kennzeichen, dass es eine
    # Id mit ein oder zwei stellen haben koennte.
    validity_check_regex_internal(pseudo_r)
    pseudo_r <- gsub('X\\.', 'X(.', pseudo_r)
    pseudo_r <- gsub('\\.X', '.)X', pseudo_r)
    pseudo_r <- gsub('^\\.', '(.', pseudo_r)
    pseudo_r <- gsub('\\.$', '.)', pseudo_r)
    gsub('X', '.', pseudo_r)
}

gen_replace_internal <- function(regex) {
    n <- nchar(gsub("[^(]", "", regex))
    if (n == 0) return("")
    paste("\\", 1:n, sep = "", collapse = "")
}

# numconv : convert a..z and A..Z to numbers where a and A are considered the same
id_by_pattern <- function(x, p, numconv = TRUE) {

    if (numconv) {
        old <- paste(letters, collapse = "")
        new <- paste(1:26, collapse = "")
        i <- chartr(old = old, new = new, x = tolower(x))
    }
    i
}