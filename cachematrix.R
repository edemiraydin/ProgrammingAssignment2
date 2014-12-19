## This function returns inverse of a matrix

 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL   
              
 get <- function() { x } 
 setInverse <- function(inverse)  { m <<- inverse }
 getInverse <- function() { m } 
  list(get = get,          #  OK, this is accessed each time makeVector() is called,       
         setInverse = setInverse,  #   that is, each time we make a new object.  This is a list of 
         getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    inv<- x$getInverse()               # accesses the object 'x' and gets the value of the mean
    if(!is.null(inv)) {              # if mean was already cached (not NULL) ...

        message("getting cached data")  # ... send this message to the console
        return(inv)                       # ... and return the mean ... "return" ends 
                        #   the function cachemean(), note
    }
    data <- x$get()        # we reach this code only if x$getmean() returned NULL
    inv <- solve (data)   # if m was NULL then we have to calculate the mean
    x$setInverse(inv)           # store the calculated mean value in x (see setmean() in makeVector
    inv              # return the mean to the code that called this function
        
}
