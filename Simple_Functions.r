add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function (x, n = 10) {
  use <- x > n
  x[use]
}

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i],   na.rm = removeNA)
  }
  means
}


x <- 1:10
if (x > 5) {
  x <- 0
}

x <- 5
y <- if (x < 3) {
  NA
} else {
  10
}



# Exact Match,
# Partial Match,
# Positional Match.
#
# Lazy Evaluation
#
# Binding value
# .globalEnv = In your Workspace
# stats paackage to fit linear model
# Base is the last one always
# Separate name Space for funcations and non functions
#
# Scoping rules makes R different then S
# R uses Lexical scoping or Dynamic scoping.
# z if not defined called free variable
# Enviornment is symbol value pair
# Function with enviornment = Function closures
# After base there is Empty Enviornment
#
# POSIXct and POSIXlt classes

## LAPPLY - LOOP OVER A LIST AND EVALUATION FUCNTION ON EACH ELEMENT.
  ##  3 ARGUMENTS - 1st is x = LIST 2nd FUN/FUNCTION 3rd ... ARGUMENTS
  ##  X SHOULD BE LIST OR COERCED/CONVERTED TO LIST by {as.list(x)}
  ## lapply(x, runif, min=0,max=10) = RUNIF = Random number generator between 0 and 10

## SAPPLY - SAME AS LAPPY BUT TRY TO SYMPLIFY THE RESULT.
## APPLY - APPLY FUNCTIONS OVER THE MARGINS OF AN ARRAY. (SUMMARIES OF MATRICES)
  ## Usually used in rows or column of matrix, used in general arrays like average of array of matrices.
  ## apply(x,1, quantile, probs=c(0.25,0.75))

## TAPPLY - APPLY A FUNCTION OVER SUBSETS OF A VECTOR.
  ## X is vector
  ## INDEX is factor or a list of factors
  ## FUN Function
  ## ... is other args.
  ## Simplify = TRUE


## MAPPLY - MULTIVARIATE VERSION OF LAPPY.
  ## mapply(rep, 1:5, 5:1)

## SPLIT - IT SPLIT OBJECTS INTO PIECES USED WITH LAPPLY AND SAPPLY USUALLY.
  ## X  is vector
  ## f is factor variable or list of factors
  ## drop is used to empty factors level should be dropped or not.
    ## EXAMPLE
    ##  x<- c(rnorm(10), runif(10), rnorm(10,1))
    ##  f <- g1(3,10)
    ##  split(x,f)

## DEBUGGING TOOLS
  ## Warning is shown after the function is executed. {log (-1)}
  ## Condition is like Manual Exception.
  ## Traceback - gives how deep the error occoured.
  ## Debug - Flag a function for debug
  ## trace will allow you to insert debugging code
