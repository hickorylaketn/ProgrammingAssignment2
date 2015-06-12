## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ##  In this example we introduce the `<<-` operator which can be used to
    ##  assign a value to an object in an environment that is different from the
    ##  current environment. Below are two functions that are used to create a
    ##  special object that stores a numeric matrix and caches its mean.
    ##  
    ##  The first function, `makeVector` creates a special "matrix", which is
    ##  really a list containing a function to
    ##  
    ##  1.  set the value of the matrix
    ##  2.  get the value of the matrix
    ##  3.  set the value of the inverse matrix
    ##  4.  get the value of the inverse matrix
    m_inverse <- NULL
    set <- function(y) {
      x <<- y
      m_inverse <<- NULL
    }
    get <- function() x
    set_inverse <- function(solve) m_inverse <<- solve
    get_inverse <- function() m_inverse
    list(set = set, get = get,
         set_inverse = set_inverse,
         get_inverse = get_inverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
