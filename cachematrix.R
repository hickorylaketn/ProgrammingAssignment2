  ##  Below are two functions (makeCacheMatrix and cacheSolve) that are used to create a
  ##  special object  that stores a numeric matrix and caches its inverse.
makeCacheMatrix <- function(x = matrix()) {
  ##  The first function, `makeCacheMatrix` creates a "special object", which is
  ##  really an object containing a matrix and functions to
  ##  1.  set the value of the matrix
  ##  2.  get the value of the matrix
  ##  3.  set the value of the inverse matrix
  ##  4.  get the value of the inverse matrix
  m_inverse <- NULL
  set <- function(y) {
    x <<- y
    ## Whenever the data in the matrix changes, the "matrix object" is created
    ## (or re-created) and the cached matrix inverse is set to NULL
    m_inverse <<- NULL
  }
  get <- function() x
  set_inverse <- function(solve) m_inverse <<- solve
  get_inverse <- function() m_inverse
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

## This function checks to see if m_inverse exists in the cache.
## If so, then cacheSolve just returns m_inverse because the initial
## matrix has not changed. Otherwise, "solve" is used to calculate a new
## inverse matrix which is then cached for future use

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m_inverse <- x$get_inverse()
  if(!is.null(m_inverse)) {
    message("getting cached matrix inverse")
    return(m_inverse)
  }
  data <- x$get()
  m_inverse <- solve(data, ...)
  x$set_inverse(m_inverse)
  m_inverse
}  
