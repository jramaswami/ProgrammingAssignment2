library(testthat)

# test that initialized matrix is the same 
mx1 <- matrix(c(1,2,3,4),nrow=2, ncol=2)
cm <- makeCacheMatrix(matrix(c(1,2,3,4),nrow=2, ncol=2))
expect_equal(mx1, cm$get())

# test setting a new matrix
mx2 <- matrix(c(4,3,2,1),nrow=2, ncol=2)
cm$set(matrix(c(4,3,2,1),nrow=2,ncol=2))
expect_equal(mx2, cm$get())

# test solved matrix
mx2sol <- solve(mx2)
cmsol <- cacheSolve(cm)
expect_equal(mx2sol, cmsol)

# test cache
expect_message(cacheSolve(cm), "Getting cached inverse matrix")
