#The following two functions can be used to cache the inverse of a matrix. First use the makeCacheMatrix to creates a special
#"matrix" that can cache its inverse. Then use the cacheSolve function to compute the inverse of the special "matrix"


#The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
#1. set the value of the matrix
#2. get the value of the matrix
#3. set the value of the inverse of the matrix
#4. get the value of the inverse of the matrix
makeCacheMatrix<-function(x=numeric()){
m<-NULL
set<-function(y){
x<<-y
m<<-NULL
}
get<-function()x
setinverse<-function(solve)m<<-solve
getinverse<-function()m
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


#The following function calculates the inverse of the special "matrix" created with makeCacheMatrix.
cacheSolve<-function(x,...){
m<-x$getinverse()
  #check to see if the inverse of the matrix has already been calculated. If so, gets the inverse of the matrix
  #and skips the computation. Otherwise, it calculates the inverse of the matrix.
if(!is.null(m)){
message("getting cached data")
return(m)
}
data<-x$get()
m<-solve(data,...)
  #sets the value of the inverse in the cache via the setinverse function.
x$setinverse(m)
m
}
