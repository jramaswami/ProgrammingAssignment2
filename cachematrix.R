## Matrix inversion is a costly computation so there may
## be some value in caching the inverse of a matrix rather
## than computing it repeatedly.  The functions below
## facilitate the caching of the inverse of a matrix.

## The makeCacheMatrix function creates a special
## matrix object that can cache its inverse.
## 
## Args:
##      x: a square invertible matrix
##
## Returns:
##      The matrix object, which is a list
##      of functions: get, set, getinverse,
##      and setinverse
##
makeCacheMatrix <- function(m = matrix()) {
        # variable to store the cached inverse
        i <- NULL
        
        # function to set the value of the matrix
        # note that the cached inverse is reset
        # to NULL when the value of the matrix
        # is changed
        set <- function(y) {
                m <<- y
                i <<- NULL
        }
        
        # function to get the current value of
        # the matrix
        get <- function() m
                
        # function to set the cached value of
        # the inverse of the matrix
        setinverse <- function(inverse) i <<- inverse
        
        # function to get the cached value of
        # the inverse of the matrix
        getinverse <- function() i
        
        # list of functions that is returned
        list(set = set, get = get, 
             setinverse = setinverse, getinverse = getinverse)
}


## The cacheSolve function computes the inverse of the 
## cache matrix object created with the makeCacheMatrix
## function above. If the inverse has already been 
## calculated (and the matrix has not changed), then 
## cacheSolve should retrieve the inverse from the cache.
##
## Args:
##      x: a cache matrix object created with makeCacheMatrix
##      ...: any other arguments to be passed to the solve()
##           function used to compute the inverse of the matrix
##
## Returns:
##      The inverse of the matrix.
##
cacheSolve <- function(x, ...) {
        # Get the current value of the inverse matrix
        # cached in the cache matrix object
        i <- x$getinverse()
        
        # If the cached value of the inverse matrix
        # is not NULL then get the cached value
        # and return it
        if (!is.null(i)) {
                message("Getting cached inverse matrix")
                return(i)
        }
        
        # If the cached value wasn't NULL get the matrix ...
        mx <- x$get()
        # ... compute its inverse
        inv <- solve(mx, ...)
        # ... and cache that computed value
        x$setinverse(inv)
        
        # Return a matrix that is the inverse of 'x'
        inv
}
