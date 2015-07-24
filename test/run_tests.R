# File to run tests

# Requires that working director be set to top level
# directory of project, i.e. the directory that
# contains cachematrix.R

# remove any clutter
rm(list=c("cacheSolve","makeCacheMatrix","tf"))
# source the file to be tested
source("cachematrix.R")
# test using the test file
tf <- file.path(getwd(), "test", "test_cachematrix.R")
test_file(tf)
