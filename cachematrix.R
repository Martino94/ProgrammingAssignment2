## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Creo la función
makeCacheMatrix <- function(x=matrix()) {
  # COnfiguro la matriz
  m <- NULL
  set <- function(matrix) {
    x <<- matrix
    m <<- NULL
  }
# Forma en la que obtengo la matriz
  get <- function() x
# Inversa de la matriz  
   setinvm <- function(solve) {
    m <<- solve
  }
  
  getinvm <- function() m
  # recupero los resultados
       list(set = set, get = get,
       setinvm = setinvm,
       getinvm = getinvm)
}


cacheSolve <- function(x, ...) {
  
  m <- x$getinvm
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data) %*% data
  
  x$setinvm(m)
  
  ## Imprimo la matriz
  m
}

