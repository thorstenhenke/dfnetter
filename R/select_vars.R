validity_check_str_internal <- function(x, str) {
    stopifnot(is.character(x))
    stopifnot(is.character(str))
    stopifnot(length(x) > 0)
    stopifnot(length(str) == 1)
}
select_internal <- function(x, str) {
    x[grep(str, x, ignore.case = FALSE)]
}

ends_with <- function(x, str) {
    validity_check_str_internal(x, str)
    select_internal(x, paste0(str, "$"))
}
starts_with <- function(x, str) {
    validity_check_str_internal(x, str)
    select_internal(x, paste0("^", str))
}
contains <- function(x, str) {
    validity_check_str_internal(x, str)
    select_internal(x, paste0(".*", str, ".*"))
}