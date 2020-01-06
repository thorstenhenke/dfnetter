source("data-raw/utils.R")

ng <- 5:10
id <- rep(1:length(ng), ng)

nets <- lapply(ng, function(i) {
    x <- make_net(i)
    x <- expand_net(x, max(ng))
    data.frame(x)
})

# Fall 1 strikt aufteigend
df_strict <- do.call("rbind", nets)
df_strict <- cbind.data.frame(id = 1:length(id), g = id, df_strict)

# Fall 2 direkt an der id festgemacht
# Neeee, das trifft den Fall auf jeden Fall noch nicht so richtig?
# EUROPA!?!?!
set.seed(42)
df_random <- lapply(nets, permute_nets)
df_random <- do.call("rbind", df_random)
df_random <- cbind.data.frame(id = 1:length(id), g = id, df_random)


rm(list = setdiff(ls(), c('df_strict', 'df_random')))
# Save statement

usethis::use_data("DATASET")
