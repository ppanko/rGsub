### Title:    Recursive gsub function
### Author:   Pavel Panko
### Created:  2018-NOV-20
### Modified: 2018-DEC-10

rGsub <- function(pattern, replacement, x, ...) {
    ## Initialize local variables for pattern/replacement length
    .pl <- length(pattern)
    .rl <- length(replacement)
    ## If more replacements than patterns, break
    if(.pl < .rl) {
        stop("More replacements than patterns")
        ## If length of replacements and patterns are not equal, break
    } else if (.rl > 1 && .rl != .pl) {
        stop("Patterns and replacements don't line up")
    }
    ## Recursive one-to-one replacement
    if(.pl > 1 && .rl > 1) {
        x <- gsub(pattern[[1]], replacement[[1]], x, ...)
        rGsub(pattern[-1], replacement[-1], x, ...)
        ## Recursive many-to-one replacement
    } else if(.pl > 1 && .rl == 1) {
        x <- gsub(pattern[[1]], replacement, x, ...)
        rGsub(pattern[-1], replacement, x, ...)
        ## Standard replacement
    } else if(.pl == 1) {
        x <- gsub(pattern, replacement, x, ...)
        return(x)
    }
}
