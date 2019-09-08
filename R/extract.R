# Daraus kann man auf jeden Fall eine gute network toolbox machen !!!!
# ggf noch eine funktion mit der man die nodeeigeschaften in die netze bekommt.

select_vars <- function(df, pattern, just.names = TRUE) {
    stopifnot(is.data.frame(df))
    i <- grep(pattern, names(df))

    if (just.names) {
        return(names(df)[i])
    } else {
        return(df[i])
    }
}

name_nodes <- function(x, n) {
    if (is.null(x) || is.null(n)) {
        return(NULL)
    }
    if (is.data.frame(x)) {
        colnames(x) <- n
        rownames(x) <- n
        return(x)
    }
    mapply(FUN = name_nodes, x = x, n = n)
}

crop_network <- function(x, i)  {
    if (is.data.frame(x)) {
        if (max(i) > ncol(x)) {
            message("Non fitting network max(i) = ", max(i))
            return(NULL)
        } else {
            return(x[,i])
        }
    }
    stopifnot(length(x) == length(i))
    mapply(FUN = crop_network, x = x, i = i)
}

extract_network <- function(df, g = NULL, vars, ids = NULL, names = NULL) {
    stopifnot(is.data.frame(df))
    stopifnot(is.vector(g))
    stopifnot(nrow(df) == length(g))
    if ((length(vars) < nrow(df)) && is.null(g)) {
        stop("It looks like you have a multilevel datset. Please provide a grouping vector")
    }
    if (is.null(ids)) {
        stop("For the network extraction an id vector is absolutely necessary.")
    }

    df <- as.data.frame(df)  # Because of haven labelled classes

    if (!is.null(g)) {
        i <- split(ids, g)
        x <- split.data.frame(df[vars], g)
    } else {
        i <- ids
        x <- df[vars]
    }
    cn <- crop_network(x, i)

    if (!is.null(names)) {
        names <- if (!is.null(g)) split(names, g)
        cn <- name_nodes(cn, names)
    }

    cn
}
