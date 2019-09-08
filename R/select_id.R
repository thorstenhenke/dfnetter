validity_check_regex_internal <- function(r) {
    stopifnot(is.character(r))
    stopifnot(length(r) == 1)
    stopifnot(grepl("^[X.]+$", r))
    # Der Fall von nur einem X (ein Fehler!) ist nicht abgedeckt.
}

gen_regex_internal <- function(pseudo_r) {
    # Schwierig, wenn man auch X.X.XX erfassen will
    pseudo_rv <- strsplit(pseudo_r, split = "")[[1]]
    real_regex <- ""
    i <- 1
    while(i <= length(pseudo_rv)) {
        if (pseudo_rv[[i]] == "X") {
            real_regex <- append(real_regex, ".")
            i <- i + 1
        } else {
            real_regex <- append(real_regex, "(")
            while(i <= length(pseudo_rv) && (pseudo_rv[[i]] == ".")) {
                real_regex <- append(real_regex, ".")
                i <- i + 1
            }
            real_regex <- append(real_regex, ")")
        }
        message("Outer Loop i = ", i)

        if (i > 100) stop("Too Many characters!")

    }
    paste(real_regex, collapse = "")
}

# numconv : convert a..z and A..Z to numbers where a and A are considered the same
id_by_pattern <- function(numconv = TRUE)