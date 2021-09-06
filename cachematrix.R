## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Creo la función
makeCacheMatrix <- function(x=matrix()) {
  # Configuro la matriz
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

# Creo la función
cacheSolve <- function(x, ...) {
# Configuro la matriz  
  m <- x$getinvm
# Configuro el mensaje  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
# Asigno data  
  data <- x$get()
# Resuelvo la operación
  m <- solve(data) %*% data
  
  x$setinvm(m)
  
  ## Imprimo la matriz
  m
}

