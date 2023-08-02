add2 <- function(x, y) {
  x + y
}


# takes vector as an input
above10 <- function(x) {
  # logical vector of elements, that > 10
  use <- x > 10
  # apply this subset to the vector
  x[use] 
}


# analogical to the prev one
# takes vector and higher border as an input
above <- function(x, n = 10) {
  # logical vector of elements, that > n
  use <- x > n
  # apply this subset to the vector
  x[use] 
}


# takes matrix or dataframe as an input
column_mean <- function(y) {
  # calc num of cols
  n_col <- ncol(y)
  # store the means in the vector in the size of the columns num 
  means_vector <- numeric(n_col)
  # looping through the columns
  for(i in 1:n_col){
    # columns [,i]
    means_vector[i] <- mean(y[ ,i])
  }
  #last expression would be returned
  means_vector
}

# made a remake with removing Na by default
# takes matrix or dataframe as an input
column_mean <- function(y, removeNA = TRUE) {
  # calc num of cols
  n_col <- ncol(y)
  # store the means in the vector in the size of the columns num 
  means_vector <- numeric(n_col)
  # looping through the columns
  for(i in 1:n_col){
    # columns [,i]
    means_vector[i] <- mean(y[ ,i], na.rm = removeNA)
  }
  #last expression would be returned
  means_vector
}