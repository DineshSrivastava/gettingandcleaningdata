
##############################################
#######                             ##########
#######  Programming Assignment II  ##########
#######                             ##########
#######         5/25                ##########
#######                             ##########
##############################################



## Note If X is a square invertible matrix, then solve(X) returns its inverse.



#####   makeCacheMatrix() ##################################################


makeCacheMatrix <- function(x=matrix()) {
        
        #  This function creates a special "matrix" object that can cache its inverse.
        ## Define Set and get methods for matrix and its invers matrix.
        
        m <- NULL
        setMat <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        getMat <- function() x
        setInv <- function(inverse) m <<- inverse
        getInv <- function() m
        list(setMat = setMat, getMat = getMat, setInv = setInv, 
             getInv = getInv)
        
}

#####   cacheSolve() ##################################################

cacheSolve <- function(x, ...) {
        
        ##  This function computes the inverse of the special "matrix" 
        ##  returned by makeCacheMatrix above. If the inverse has already been 
        ##  calculated (and the matrix has not changed), then the cachesolve should
        ##  retrieve the inverse from the cache.
        
        m <- x$getInv()          
        if ( ! is.null(m)) {    
                print("Retrieving cached data")
                return(m)
        }
        m <- solve(x$getMat())  ## Computes the inverse of the matrix
        x$setInv(m)
        m             ## Return a matrix that is the inverse of 'x'
}

#############################################################
##                                                         ##
## Test scripts for 2x2, 3x3, and 4x4 invertible matrices. ##
##                                                         ##
#############################################################


## A 2x2 matrix - invertible example:
## ==================================

## a <- makeCacheMatrix(matrix(c(2, -3, 5, 7),2)) ## Define Matrix "a"
## a$getMat()       ## Display the matrix on the console
## a$getInv()       ## Display the inverse of the matrix on console
## cacheSolve(a)    ## Create the inverse matrix by using CacheSolve function
##   and display on the console
## b = a$getInv()   ## Assign Inverse of martix "a" to matrix "b"
## round((a$getMat() %*% b),digit=0) ## Multiply Matrix A and B to get an 
## Identity Matrix


## A 3x3 matrix - invertible example:
## ==================================

## a <- makeCacheMatrix(matrix(c(-1, 0, -5, 3, -6, -3, -3, 
##                               5, 1),3)) ## Define Matrix "a"
## a$getMat()       ## Display the matrix on the console
## a$getInv()       ## Display the inverse of the matrix on console
## cacheSolve(a)    ## Create the inverse matrix by using CacheSolve function
##   and display on the console
## b = a$getInv()   ## Assign Inverse of martix "a" to matrix "b"
## round((a$getMat() %*% b),digit=0) ## Multiply Matrix A and B to get an 
## Identity Matrix


## A 4x4 matrix - invertible example:
## ==================================

## a <- makeCacheMatrix(matrix(c(3, 1, 0, -1, 5, 4, -2, 6, -1, -.7, 0, 0, -4, 
##                               -3, 1, .3),4)) ## Define Matrix "a"
## a$getMat()       ## Display the matrix on the console
## a$getInv()       ## Display the inverse of the matrix on console
## cacheSolve(a)    ## Create the inverse matrix by using CacheSolve function
##   and display on the console
## b = a$getInv()   ## Assign Inverse of martix "a" to matrix "b"
## round((a$getMat() %*% b),digit=0) ## Multiply Matrix A and B to get an 
## Identity Matrix


###################



