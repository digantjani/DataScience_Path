## print(x) will print x
## Everything in R is object
  ## Atomic Classes
  ## - Character
  ## - numberic (real Numbers)
  ## - integer : If you want only integer object then add L at end of number will give you integer explicitly
    ## - Example: 1L and Inf is infinity, NaN is not a number used if it is not integer or missing values.
  ## - complex
  ## - logical (True/False)

  ## Vector(Most basic object)
  ## Vector can conetain objects of same classes.
  ## list - represented as vector but contains object of different classes
  ## Empty vectors are created using Vector() fucntion.
  ## R attributes : (Attributes)
    ## names/dimnames
    ## dimensions
    ## class
    ## length
    ## C() functions can be used as vector objects.used for concatination (X<-c(1,2))
    ## Coercian : as.numeric(), Biggest vecotr iwll be created.
    x <- 0:6
    class(x)  ## class(x) will give class of object
    as.numeric(x)  ## as.numeric(x) will convert into numeric vector
    as.logical(x)
    as.character(x)
    ## NonSensical Coercion results in NAS
    X <- c("a","b","c")
    as.numeric(X)  ## Warning message: NAs introduced by coercion
    as.logical(X)
    X <- c("a","b","c")
    as.complex(X)

    ## MATRICES : Vectors with Dimension (Dimension = integer vector length 2 (nrow,ncol))
    m <- matrix(1:6, nrow = 2, ncol = 3)
    m
    dim(m)
    attributes(m)
    ## Convert Vectors to matrix
    dim(m) <- c(2,5)
    ## Column Binding - CBind and Row Binding - RBind
    x <- 1:3
    y <- 10:12
    cbind(x,y)
    rbind(x,y)
    ## Factor is speical type of categorical data. (ordered and unordered)
    ##lm() and glm() - Factors with labels are better than integer.
    x <- factor(c("yes","no","yes","yes","no"))  ## NO is the base level as no 1 comes before yes 2. Explicitly define baseline level like this. x <- factor(c("yes","no","yes","yes","no"), levels=("yes", "no"))
    x
    table(x)
    unclass(x)
    ## NA or NaN value
    x <- c(NA, NaN)
    is.na(x)
    is.nan(x)

    ## Dataframe stores data in tabular format
    ## special type of list where length of every elements should be same but type doesn't matter in row but in column it matters
    ## row.name is attribute
    ## read.table() or read.csv()
    ## data.matrix()
    x <- data.frame(foo = 1:4, bar=c(T,F,F,T))
    x
    nrow(x)
    ncol(x)
    names(x)

    m <-matrix(1:4, nrow=2, ncol=2)
    dimnames(m) <- list(c("A", "B"), c("C","D"))
    m

    ### DATA
    ## read.table()
      ## File attribute name of file or connection.
      ## header, logical file has header line or not.
      ## sep - how columns are separated.
      ## colCalsses - a character vector indicating the class of each column in the dataset.
      ## nrows - number of rows
      ## comment.char
      ## skip - skip number of lines from begining
      ## stringsAsFactors - character variable be coded as factors ?
    ## read.csv()  output is Dataframes.
    ## ReadLines will read lines in text format
    ## source will read R code files. (inverse of dump)
    ## dget will read R code files (inverse of dput)
    ## load to read in saved workspaces.
    ## unserialize will read R files in binary form ?

    ### WRITING DATA
    ## write.table()
    ## wirteLines()
    ## dump() - Editable text format. In case of corruption, potentially recoverable.
    ## dput()
    ## save()
    ## serialize()

  ## Interfaces with outside world
  ## gzfile - opens connection to file using zip file
  ## bzfile - open connection to file using bzip2
  ## url - connection to webpage.
  ## [ always return same class as original; can select more than one element
  ## [[ is used to extract elements from list or Data Frame; it can extract ssingle emlement of class; returned element and the class of the returend objects will not necessarily be a list or data fream.
  ## $ is used to extract elements of a list or data frame by name; sementics are similar to that of [[.

  x <- c("a", "b", "c", "d", "a")
  ## Numeric index
  x[1]
  x[2]
  x[2:4]

  ## Logical Index
  x[x > "a"]
  u <- x >"a"
  u
  x[u]

  ## Subsetting list
  x <- list(foo = 1:4, bar = 0.6)
  x[1] #Lst and sequence both will be returend
  x[[1]] # only Sequence will be returend.
  x$bar # ouput is value
  x[["bar"]] # same as $
  x["bar"] #give me list and sequence both

  x <- list(foo = 1:4, bar = 0.6, baz="hello")
  x[c(1,3)] #Can't use double braces or $

  name <- "foo"
  x[[name]] ## Computed index for 'foo'
  x$name    ##element name doesn't exist
  x$foo

  x <- list(a=list(10,12,14), b=list(3.14,2.18))
  x[[c(1,3)]]
  x[[1]][[3]]
  x[[c(2,1)]]

  ## SUbsetting Matrices
  x <- matrix(1:6, 2,3)
  x[1,2] ## pulling single element, It will return vector of length 1. It can return 1X1 matrix if you put drop = false
  x[2,1]
  x[1,]
  x[,2]
  x[1,2, drop=FALSE] ## drops the demetion
  x[1,, drop = FALSE]

  ## Partial Matching
  x <- list (aardvark = 1:5)
  x$a
  x[["a"]]
  x[["a", exact = FALSE]]

  ## REmoving Missing Values
  x <- c(1,2,NA,5,NA,6)
  bad <- is.na(x)
  x[!bad]

  #Removing NA values
  x <- c(1,2,NA,4,NA,6)
  y <- c("a","b",NA,"d",NA,"f")
  good <- complete.cases(x,y)
  good
  x[good]
  y[good]

  airquality[1:6,]
  good <- complete.cases(airquality)
  airquality[good, ][1:6, ]

  ##VECTOR OPERATIONs
  x <- 1:4; y <-6:9
  x + y
  x > 2
  x >= 2
  y == 8
  x * y
  x/y

  x <- matrix(1:4, 2,2); y <- matrix(rep(10,4), 2,2)
  x * y ## ELEMENT-Wise Multiplication
  x / y ##  ELEMENT-Wise DIVISION
  x %*% y ## TRUE MATRIX MULTIPLICATION



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





PRACTICE
flag_shapes <- flags[, 19:23]

| You are quite good my friend!

  |======================================================================================================================================================                                                                                    |  64%
| Each of these columns (i.e. variables) represents the number of times a particular shape or design appears on a country's flag. We are interested in the minimum and maximum number of times each shape or design appears.

...

  |==========================================================================================================================================================                                                                                |  66%
| The range() function returns the minimum and maximum of its first argument, which should be a numeric vector. Use lapply() to apply the range function to each column of flag_shapes. Don't worry about storing the result in a new variable. By
| now, we know that lapply() always returns a list.

> lapply(flag_shapes)
Error in match.fun(FUN) : argument "FUN" is missing, with no default
> lapply(flag_shapes)
Error in match.fun(FUN) : argument "FUN" is missing, with no default
> range(lapply(flag_shapes))
Error in match.fun(FUN) : argument "FUN" is missing, with no default
> lapply(flag_shapes, range(flag_shapes))
Error in match.fun(FUN) :
  'range(flag_shapes)' is not a function, character or symbol
> lapply(flag_shapes, range)
$circles
[1] 0 4

$crosses
[1] 0 2

$saltires
[1] 0 1

$quarters
[1] 0 4

$sunstars
[1]  0 50


| Nice work!

  |===============================================================================================================================================================                                                                           |  68%
| Do the same operation, but using sapply() and store the result in a variable called shape_mat.

> shape_mat <- sapply(flag_shapes, range)

| You nailed it! Good job!

  |====================================================================================================================================================================                                                                      |  70%
| View the contents of shape_mat.

> shape_mat
circles crosses saltires quarters sunstars
[1,]       0       0        0        0        0
[2,]       4       2        1        4       50

| Great job!

  |========================================================================================================================================================================                                                                  |  72%
| Each column of shape_mat gives the minimum (row 1) and maximum (row 2) number of times its respective shape appears in different flags.

...

|=============================================================================================================================================================================                                                             |  74%
| Use the class() function to confirm that shape_mat is a matrix.

> class(shape_mat)
[1] "matrix"

| Great job!

  |==================================================================================================================================================================================                                                        |  76%
| As we've seen, sapply() always attempts to simplify the result given by lapply(). It has been successful in doing so for each of the examples we've looked at so far. Let's look at an example where sapply() can't figure out how to simplify
| the result and thus returns a list, no different from lapply().

...

|=======================================================================================================================================================================================                                                   |  78%
| When given a vector, the unique() function returns a vector with all duplicate elements removed. In other words, unique() returns a vector of only the 'unique' elements. To see how it works, try unique(c(3, 4, 5, 5, 5, 6, 6)).

> unique(c(3, 4, 5, 5, 5, 6, 6))
[1] 3 4 5 6

| You nailed it! Good job!

  |===========================================================================================================================================================================================                                               |  80%
| We want to know the unique values for each variable in the flags dataset. To accomplish this, use lapply() to apply the unique() function to each column in the flags dataset, storing the result in a variable called unique_vals.

> unique_vals <- lapply(flags, uniqiue)
Error in match.fun(FUN) : object 'uniqiue' not found
> unique_vals <- lapply(flags, unique)

| Excellent work!

  |================================================================================================================================================================================================                                          |  82%
| Print the value of unique_vals to the console.

> unique_vals
$name
[1] Afghanistan              Albania                  Algeria                  American-Samoa           Andorra                  Angola                   Anguilla                 Antigua-Barbuda          Argentina
[10] Argentine                Australia                Austria                  Bahamas                  Bahrain                  Bangladesh               Barbados                 Belgium                  Belize
[19] Benin                    Bermuda                  Bhutan                   Bolivia                  Botswana                 Brazil                   British-Virgin-Isles     Brunei                   Bulgaria
[28] Burkina                  Burma                    Burundi                  Cameroon                 Canada                   Cape-Verde-Islands       Cayman-Islands           Central-African-Republic Chad
[37] Chile                    China                    Colombia                 Comorro-Islands          Congo                    Cook-Islands             Costa-Rica               Cuba                     Cyprus
[46] Czechoslovakia           Denmark                  Djibouti                 Dominica                 Dominican-Republic       Ecuador                  Egypt                    El-Salvador              Equatorial-Guinea
[55] Ethiopia                 Faeroes                  Falklands-Malvinas       Fiji                     Finland                  France                   French-Guiana            French-Polynesia         Gabon
[64] Gambia                   Germany-DDR              Germany-FRG              Ghana                    Gibraltar                Greece                   Greenland                Grenada                  Guam
[73] Guatemala                Guinea                   Guinea-Bissau            Guyana                   Haiti                    Honduras                 Hong-Kong                Hungary                  Iceland
[82] India                    Indonesia                Iran                     Iraq                     Ireland                  Israel                   Italy                    Ivory-Coast              Jamaica
[91] Japan                    Jordan                   Kampuchea                Kenya                    Kiribati                 Kuwait                   Laos                     Lebanon                  Lesotho
[100] Liberia                  Libya                    Liechtenstein            Luxembourg               Malagasy                 Malawi                   Malaysia                 Maldive-Islands          Mali
[109] Malta                    Marianas                 Mauritania               Mauritius                Mexico                   Micronesia               Monaco                   Mongolia                 Montserrat
[118] Morocco                  Mozambique               Nauru                    Nepal                    Netherlands              Netherlands-Antilles     New-Zealand              Nicaragua                Niger
[127] Nigeria                  Niue                     North-Korea              North-Yemen              Norway                   Oman                     Pakistan                 Panama                   Papua-New-Guinea
[136] Parguay                  Peru                     Philippines              Poland                   Portugal                 Puerto-Rico              Qatar                    Romania                  Rwanda
[145] San-Marino               Sao-Tome                 Saudi-Arabia             Senegal                  Seychelles               Sierra-Leone             Singapore                Soloman-Islands          Somalia
[154] South-Africa             South-Korea              South-Yemen              Spain                    Sri-Lanka                St-Helena                St-Kitts-Nevis           St-Lucia                 St-Vincent
[163] Sudan                    Surinam                  Swaziland                Sweden                   Switzerland              Syria                    Taiwan                   Tanzania                 Thailand
[172] Togo                     Tonga                    Trinidad-Tobago          Tunisia                  Turkey                   Turks-Cocos-Islands      Tuvalu                   UAE                      Uganda
[181] UK                       Uruguay                  US-Virgin-Isles          USA                      USSR                     Vanuatu                  Vatican-City             Venezuela                Vietnam
[190] Western-Samoa            Yugoslavia               Zaire                    Zambia                   Zimbabwe
194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina Argentine Australia Austria Bahamas Bahrain Bangladesh Barbados Belgium Belize Benin Bermuda Bhutan Bolivia Botswana ... Zimbabwe

$landmass
[1] 5 3 4 6 1 2

$zone
[1] 1 3 2 4

$area
[1]   648    29  2388     0  1247  2777  7690    84    19     1   143    31    23   113    47  1099   600  8512     6   111   274   678    28   474  9976     4   623  1284   757  9561  1139     2   342    51   115     9   128    43    22
[40]    49   284  1001    21  1222    12    18   337   547    91   268    10   108   249   239   132  2176   109   246    36   215   112    93   103  3268  1904  1648   435    70   301   323    11   372    98   181   583   236    30  1760
[79]     3   587   118   333  1240  1031  1973  1566   447   783   140    41  1267   925   121   195   324   212   804    76   463   407  1285   300   313    92   237    26  2150   196    72   637  1221    99   288   505    66  2506    63
[118]    17   450   185   945   514    57     5   164   781   245   178  9363 22402    15   912   256   905   753   391

$population
[1]   16    3   20    0    7   28   15    8   90   10    1    6  119    9   35    4   24    2   11 1008    5   47   31   54   17   61   14  684  157   39   57  118   13   77   12   56   18   84   48   36   22   29   38   49   45  231  274   60

$language
[1] 10  6  8  1  2  4  3  5  7  9

$religion
[1] 2 6 1 0 5 3 4 7

$bars
[1] 0 2 3 1 5

$stripes
[1]  3  0  2  1  5  9 11 14  4  6 13  7

$colours
[1] 5 3 2 8 6 4 7 1

$red
[1] 1 0

$green
[1] 1 0

$blue
[1] 0 1

$gold
[1] 1 0

$white
[1] 1 0

$black
[1] 1 0

$orange
[1] 0 1

$mainhue
[1] green  red    blue   gold   white  orange black  brown
Levels: black blue brown gold green orange red white

$circles
[1] 0 1 4 2

$crosses
[1] 0 1 2

$saltires
[1] 0 1

$quarters
[1] 0 1 4

$sunstars
[1]  1  0  6 22 14  3  4  5 15 10  7  2  9 50

$crescent
[1] 0 1

$triangle
[1] 0 1

$icon
[1] 1 0

$animate
[1] 0 1

$text
[1] 0 1

$topleft
[1] black  red    green  blue   white  orange gold
Levels: black blue gold green orange red white

$botright
[1] green  red    white  black  blue   gold   orange brown
Levels: black blue brown gold green orange red white


| Excellent job!

  |=====================================================================================================================================================================================================                                     |  84%
| Since unique_vals is a list, you can use what you've learned to determine the length of each element of unique_vals (i.e. the number of unique values for each variable). Simplify the result, if possible. Hint: Apply the length() function to
| each element of unique_vals.

> lapply(unique_vals, length)
$name
[1] 194

$landmass
[1] 6

$zone
[1] 4

$area
[1] 136

$population
[1] 48

$language
[1] 10

$religion
[1] 8

$bars
[1] 5

$stripes
[1] 12

$colours
[1] 8

$red
[1] 2

$green
[1] 2

$blue
[1] 2

$gold
[1] 2

$white
[1] 2

$black
[1] 2

$orange
[1] 2

$mainhue
[1] 8

$circles
[1] 4

$crosses
[1] 3

$saltires
[1] 2

$quarters
[1] 3

$sunstars
[1] 14

$crescent
[1] 2

$triangle
[1] 2

$icon
[1] 2

$animate
[1] 2

$text
[1] 2

$topleft
[1] 7

$botright
[1] 8


| Nice try, but that's not exactly what I was hoping for. Try again. Or, type info() for more options.

| Apply the length() function to each element of the unique_vals list using sapply(). Remember, no parentheses after the name of the function you are applying (i.e. length).

> sapply(unique_vals, length)
name   landmass       zone       area population   language   religion       bars    stripes    colours        red      green       blue       gold      white      black     orange    mainhue    circles    crosses   saltires   quarters
194          6          4        136         48         10          8          5         12          8          2          2          2          2          2          2          2          8          4          3          2          3
sunstars   crescent   triangle       icon    animate       text    topleft   botright
14          2          2          2          2          2          7          8

| You are amazing!

  |=========================================================================================================================================================================================================                                 |  86%
| The fact that the elements of the unique_vals list are all vectors of *different* length poses a problem for sapply(), since there's no obvious way of simplifying the result.

...

  |==============================================================================================================================================================================================================                            |  88%
| Use sapply() to apply the unique() function to each column of the flags dataset to see that you get the same unsimplified list that you got from lapply().

> sapply(flags,unique)
$name
  [1] Afghanistan              Albania                  Algeria                  American-Samoa           Andorra                  Angola                   Anguilla                 Antigua-Barbuda          Argentina
 [10] Argentine                Australia                Austria                  Bahamas                  Bahrain                  Bangladesh               Barbados                 Belgium                  Belize
 [19] Benin                    Bermuda                  Bhutan                   Bolivia                  Botswana                 Brazil                   British-Virgin-Isles     Brunei                   Bulgaria
 [28] Burkina                  Burma                    Burundi                  Cameroon                 Canada                   Cape-Verde-Islands       Cayman-Islands           Central-African-Republic Chad
 [37] Chile                    China                    Colombia                 Comorro-Islands          Congo                    Cook-Islands             Costa-Rica               Cuba                     Cyprus
 [46] Czechoslovakia           Denmark                  Djibouti                 Dominica                 Dominican-Republic       Ecuador                  Egypt                    El-Salvador              Equatorial-Guinea
 [55] Ethiopia                 Faeroes                  Falklands-Malvinas       Fiji                     Finland                  France                   French-Guiana            French-Polynesia         Gabon
 [64] Gambia                   Germany-DDR              Germany-FRG              Ghana                    Gibraltar                Greece                   Greenland                Grenada                  Guam
 [73] Guatemala                Guinea                   Guinea-Bissau            Guyana                   Haiti                    Honduras                 Hong-Kong                Hungary                  Iceland
 [82] India                    Indonesia                Iran                     Iraq                     Ireland                  Israel                   Italy                    Ivory-Coast              Jamaica
 [91] Japan                    Jordan                   Kampuchea                Kenya                    Kiribati                 Kuwait                   Laos                     Lebanon                  Lesotho
[100] Liberia                  Libya                    Liechtenstein            Luxembourg               Malagasy                 Malawi                   Malaysia                 Maldive-Islands          Mali
[109] Malta                    Marianas                 Mauritania               Mauritius                Mexico                   Micronesia               Monaco                   Mongolia                 Montserrat
[118] Morocco                  Mozambique               Nauru                    Nepal                    Netherlands              Netherlands-Antilles     New-Zealand              Nicaragua                Niger
[127] Nigeria                  Niue                     North-Korea              North-Yemen              Norway                   Oman                     Pakistan                 Panama                   Papua-New-Guinea
[136] Parguay                  Peru                     Philippines              Poland                   Portugal                 Puerto-Rico              Qatar                    Romania                  Rwanda
[145] San-Marino               Sao-Tome                 Saudi-Arabia             Senegal                  Seychelles               Sierra-Leone             Singapore                Soloman-Islands          Somalia
[154] South-Africa             South-Korea              South-Yemen              Spain                    Sri-Lanka                St-Helena                St-Kitts-Nevis           St-Lucia                 St-Vincent
[163] Sudan                    Surinam                  Swaziland                Sweden                   Switzerland              Syria                    Taiwan                   Tanzania                 Thailand
[172] Togo                     Tonga                    Trinidad-Tobago          Tunisia                  Turkey                   Turks-Cocos-Islands      Tuvalu                   UAE                      Uganda
[181] UK                       Uruguay                  US-Virgin-Isles          USA                      USSR                     Vanuatu                  Vatican-City             Venezuela                Vietnam
[190] Western-Samoa            Yugoslavia               Zaire                    Zambia                   Zimbabwe
194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina Argentine Australia Austria Bahamas Bahrain Bangladesh Barbados Belgium Belize Benin Bermuda Bhutan Bolivia Botswana ... Zimbabwe

$landmass
[1] 5 3 4 6 1 2

$zone
[1] 1 3 2 4

$area
  [1]   648    29  2388     0  1247  2777  7690    84    19     1   143    31    23   113    47  1099   600  8512     6   111   274   678    28   474  9976     4   623  1284   757  9561  1139     2   342    51   115     9   128    43    22
 [40]    49   284  1001    21  1222    12    18   337   547    91   268    10   108   249   239   132  2176   109   246    36   215   112    93   103  3268  1904  1648   435    70   301   323    11   372    98   181   583   236    30  1760
 [79]     3   587   118   333  1240  1031  1973  1566   447   783   140    41  1267   925   121   195   324   212   804    76   463   407  1285   300   313    92   237    26  2150   196    72   637  1221    99   288   505    66  2506    63
[118]    17   450   185   945   514    57     5   164   781   245   178  9363 22402    15   912   256   905   753   391

$population
 [1]   16    3   20    0    7   28   15    8   90   10    1    6  119    9   35    4   24    2   11 1008    5   47   31   54   17   61   14  684  157   39   57  118   13   77   12   56   18   84   48   36   22   29   38   49   45  231  274   60

$language
 [1] 10  6  8  1  2  4  3  5  7  9

$religion
[1] 2 6 1 0 5 3 4 7

$bars
[1] 0 2 3 1 5

$stripes
 [1]  3  0  2  1  5  9 11 14  4  6 13  7

$colours
[1] 5 3 2 8 6 4 7 1

$red
[1] 1 0

$green
[1] 1 0

$blue
[1] 0 1

$gold
[1] 1 0

$white
[1] 1 0

$black
[1] 1 0

$orange
[1] 0 1

$mainhue
[1] green  red    blue   gold   white  orange black  brown
Levels: black blue brown gold green orange red white

$circles
[1] 0 1 4 2

$crosses
[1] 0 1 2

$saltires
[1] 0 1

$quarters
[1] 0 1 4

$sunstars
 [1]  1  0  6 22 14  3  4  5 15 10  7  2  9 50

$crescent
[1] 0 1

$triangle
[1] 0 1

$icon
[1] 1 0

$animate
[1] 0 1

$text
[1] 0 1

$topleft
[1] black  red    green  blue   white  orange gold
Levels: black blue gold green orange red white

$botright
[1] green  red    white  black  blue   gold   orange brown
Levels: black blue brown gold green orange red white


| You are doing so well!

  |===================================================================================================================================================================================================================                       |  90%
| Occasionally, you may need to apply a function that is not yet defined, thus requiring you to write your own. Writing functions in R is beyond the scope of this lesson, but let's look at a quick example of how you might do so in the context
| of loop functions.

...

|=======================================================================================================================================================================================================================                   |  92%
| Pretend you are interested in only the second item from each element of the unique_vals list that you just created. Since each element of the unique_vals list is a vector and we're not aware of any built-in function in R that returns the
| second element of a vector, we will construct our own function.

...

  |============================================================================================================================================================================================================================              |  94%
| lapply(unique_vals, function(elem) elem[2]) will return a list containing the second item from each element of the unique_vals list. Note that our function takes one argument, elem, which is just a 'dummy variable' that takes on the value of
| each element of unique_vals, in turn.

> lapply(unique_vals, function(elem) elem[2])
$name
[1] Albania
194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina Argentine Australia Austria Bahamas Bahrain Bangladesh Barbados Belgium Belize Benin Bermuda Bhutan Bolivia Botswana ... Zimbabwe

$landmass
[1] 3

$zone
[1] 3

$area
[1] 29

$population
[1] 3

$language
[1] 6

$religion
[1] 6

$bars
[1] 2

$stripes
[1] 0

$colours
[1] 3

$red
[1] 0

$green
[1] 0

$blue
[1] 1

$gold
[1] 0

$white
[1] 0

$black
[1] 0

$orange
[1] 1

$mainhue
[1] red
Levels: black blue brown gold green orange red white

$circles
[1] 1

$crosses
[1] 1

$saltires
[1] 1

$quarters
[1] 1

$sunstars
[1] 0

$crescent
[1] 1

$triangle
[1] 1

$icon
[1] 0

$animate
[1] 1

$text
[1] 1

$topleft
[1] red
Levels: black blue gold green orange red white

$botright
[1] red
Levels: black blue brown gold green orange red white


| You got it!

  |=================================================================================================================================================================================================================================         |  96%
| The only difference between previous examples and this one is that we are defining and using our own function right in the call to lapply(). Our function has no name and disappears as soon as lapply() is done using it. So-called 'anonymous
| functions' can be very useful when one of R's built-in functions isn't an option.

...

  |=====================================================================================================================================================================================================================================     |  98%
| In this lesson, you learned how to use the powerful lapply() and sapply() functions to apply an operation over the elements of a list. In the next lesson, we'll take a look at some close relatives of lapply() and sapply().

...

|==========================================================================================================================================================================================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

  1: Yes
2: No

Selection: 1
What is your email address? digantjani54@yahoo.com
What is your assignment token? iUN2UzkabeIY3CPH
Grade submission succeeded!

  | You are really on a roll!

  | You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Basic Building Blocks      2: Workspace and Files        3: Sequences of Numbers       4: Vectors                    5: Missing Values             6: Subsetting Vectors         7: Matrices and Data Frames   8: Logic
 9: Functions                 10: lapply and sapply         11: vapply and tapply         12: Looking at Data           13: Simulation                14: Dates and Times           15: Base Graphics

Selection: 11

  |                                                                                                                                                                                                                                          |   0%

| In the last lesson, you learned about the two most fundamental members of R's *apply family of functions: lapply() and sapply(). Both take a list as input, apply a function to each element of the list, then combine and return the result.
| lapply() always returns a list, whereas sapply() attempts to simplify the result.

...

|=========                                                                                                                                                                                                                                 |   4%
| In this lesson, you'll learn how to use vapply() and tapply(), each of which serves a very specific purpose within the Split-Apply-Combine methodology. For consistency, we'll use the same dataset we used in the 'lapply and sapply' lesson.

...

|===================                                                                                                                                                                                                                       |   8%
| The Flags dataset from the UCI Machine Learning Repository contains details of various nations and their flags. More information may be found here: http://archive.ics.uci.edu/ml/datasets/Flags

...

|============================                                                                                                                                                                                                              |  12%
| I've stored the data in a variable called flags. If it's been a while since you completed the 'lapply and sapply' lesson, you may want to reacquaint yourself with the data by using functions like dim(), head(), str(), and summary() when you
| return to the prompt (>). You can also type viewinfo() at the prompt to bring up some documentation for the dataset. Let's get started!

...

  |=====================================                                                                                                                                                                                                     |  16%
| As you saw in the last lesson, the unique() function returns a vector of the unique values contained in the object passed to it. Therefore, sapply(flags, unique) returns a list containing one vector of unique values for each column of the
| flags dataset. Try it again now.

> sapply(flags,uninque)
Error in match.fun(FUN) : object 'uninque' not found
> sapply(flags,unique)
$name
  [1] Afghanistan              Albania                  Algeria                  American-Samoa           Andorra                  Angola                   Anguilla                 Antigua-Barbuda          Argentina
 [10] Argentine                Australia                Austria                  Bahamas                  Bahrain                  Bangladesh               Barbados                 Belgium                  Belize
 [19] Benin                    Bermuda                  Bhutan                   Bolivia                  Botswana                 Brazil                   British-Virgin-Isles     Brunei                   Bulgaria
 [28] Burkina                  Burma                    Burundi                  Cameroon                 Canada                   Cape-Verde-Islands       Cayman-Islands           Central-African-Republic Chad
 [37] Chile                    China                    Colombia                 Comorro-Islands          Congo                    Cook-Islands             Costa-Rica               Cuba                     Cyprus
 [46] Czechoslovakia           Denmark                  Djibouti                 Dominica                 Dominican-Republic       Ecuador                  Egypt                    El-Salvador              Equatorial-Guinea
 [55] Ethiopia                 Faeroes                  Falklands-Malvinas       Fiji                     Finland                  France                   French-Guiana            French-Polynesia         Gabon
 [64] Gambia                   Germany-DDR              Germany-FRG              Ghana                    Gibraltar                Greece                   Greenland                Grenada                  Guam
 [73] Guatemala                Guinea                   Guinea-Bissau            Guyana                   Haiti                    Honduras                 Hong-Kong                Hungary                  Iceland
 [82] India                    Indonesia                Iran                     Iraq                     Ireland                  Israel                   Italy                    Ivory-Coast              Jamaica
 [91] Japan                    Jordan                   Kampuchea                Kenya                    Kiribati                 Kuwait                   Laos                     Lebanon                  Lesotho
[100] Liberia                  Libya                    Liechtenstein            Luxembourg               Malagasy                 Malawi                   Malaysia                 Maldive-Islands          Mali
[109] Malta                    Marianas                 Mauritania               Mauritius                Mexico                   Micronesia               Monaco                   Mongolia                 Montserrat
[118] Morocco                  Mozambique               Nauru                    Nepal                    Netherlands              Netherlands-Antilles     New-Zealand              Nicaragua                Niger
[127] Nigeria                  Niue                     North-Korea              North-Yemen              Norway                   Oman                     Pakistan                 Panama                   Papua-New-Guinea
[136] Parguay                  Peru                     Philippines              Poland                   Portugal                 Puerto-Rico              Qatar                    Romania                  Rwanda
[145] San-Marino               Sao-Tome                 Saudi-Arabia             Senegal                  Seychelles               Sierra-Leone             Singapore                Soloman-Islands          Somalia
[154] South-Africa             South-Korea              South-Yemen              Spain                    Sri-Lanka                St-Helena                St-Kitts-Nevis           St-Lucia                 St-Vincent
[163] Sudan                    Surinam                  Swaziland                Sweden                   Switzerland              Syria                    Taiwan                   Tanzania                 Thailand
[172] Togo                     Tonga                    Trinidad-Tobago          Tunisia                  Turkey                   Turks-Cocos-Islands      Tuvalu                   UAE                      Uganda
[181] UK                       Uruguay                  US-Virgin-Isles          USA                      USSR                     Vanuatu                  Vatican-City             Venezuela                Vietnam
[190] Western-Samoa            Yugoslavia               Zaire                    Zambia                   Zimbabwe
194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina Argentine Australia Austria Bahamas Bahrain Bangladesh Barbados Belgium Belize Benin Bermuda Bhutan Bolivia Botswana ... Zimbabwe

$landmass
[1] 5 3 4 6 1 2

$zone
[1] 1 3 2 4

$area
  [1]   648    29  2388     0  1247  2777  7690    84    19     1   143    31    23   113    47  1099   600  8512     6   111   274   678    28   474  9976     4   623  1284   757  9561  1139     2   342    51   115     9   128    43    22
 [40]    49   284  1001    21  1222    12    18   337   547    91   268    10   108   249   239   132  2176   109   246    36   215   112    93   103  3268  1904  1648   435    70   301   323    11   372    98   181   583   236    30  1760
 [79]     3   587   118   333  1240  1031  1973  1566   447   783   140    41  1267   925   121   195   324   212   804    76   463   407  1285   300   313    92   237    26  2150   196    72   637  1221    99   288   505    66  2506    63
[118]    17   450   185   945   514    57     5   164   781   245   178  9363 22402    15   912   256   905   753   391

$population
 [1]   16    3   20    0    7   28   15    8   90   10    1    6  119    9   35    4   24    2   11 1008    5   47   31   54   17   61   14  684  157   39   57  118   13   77   12   56   18   84   48   36   22   29   38   49   45  231  274   60

$language
 [1] 10  6  8  1  2  4  3  5  7  9

$religion
[1] 2 6 1 0 5 3 4 7

$bars
[1] 0 2 3 1 5

$stripes
 [1]  3  0  2  1  5  9 11 14  4  6 13  7

$colours
[1] 5 3 2 8 6 4 7 1

$red
[1] 1 0

$green
[1] 1 0

$blue
[1] 0 1

$gold
[1] 1 0

$white
[1] 1 0

$black
[1] 1 0

$orange
[1] 0 1

$mainhue
[1] green  red    blue   gold   white  orange black  brown
Levels: black blue brown gold green orange red white

$circles
[1] 0 1 4 2

$crosses
[1] 0 1 2

$saltires
[1] 0 1

$quarters
[1] 0 1 4

$sunstars
 [1]  1  0  6 22 14  3  4  5 15 10  7  2  9 50

$crescent
[1] 0 1

$triangle
[1] 0 1

$icon
[1] 1 0

$animate
[1] 0 1

$text
[1] 0 1

$topleft
[1] black  red    green  blue   white  orange gold
Levels: black blue gold green orange red white

$botright
[1] green  red    white  black  blue   gold   orange brown
Levels: black blue brown gold green orange red white


| Perseverance, that's the answer.

|===============================================                                                                                                                                                                                           |  20%
| What if you had forgotten how unique() works and mistakenly thought it returns the *number* of unique values contained in the object passed to it? Then you might have incorrectly expected sapply(flags, unique) to return a numeric vector,
| since each element of the list returned would contain a single number and sapply() could then simplify the result to a vector.

...

|========================================================                                                                                                                                                                                  |  24%
| When working interactively (at the prompt), this is not much of a problem, since you see the result immediately and will quickly recognize your mistake. However, when working non-interactively (e.g. writing your own functions), a
| misunderstanding may go undetected and cause incorrect results later on. Therefore, you may wish to be more careful and that's where vapply() is useful.

...

  |==================================================================                                                                                                                                                                        |  28%
| Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly. If the result doesn't match the format you specify, vapply() will throw an error, causing the operation to stop. This can
| prevent significant problems in your code that might be caused by getting unexpected return values from sapply().

...

|===========================================================================                                                                                                                                                               |  32%
| Try vapply(flags, unique, numeric(1)), which says that you expect each element of the result to be a numeric vector of length 1. Since this is NOT actually the case, YOU WILL GET AN ERROR. Once you get the error, type ok() to continue to the
| next question.

> vapply(flags, unique, numeric(1))
Error in vapply(flags, unique, numeric(1)) : values must be length 1,
but FUN(X[[1]]) result is length 194
> ok()

| Great job!

  |====================================================================================                                                                                                                                                      |  36%
| Recall from the previous lesson that sapply(flags, class) will return a character vector containing the class of each column in the dataset. Try that again now to see the result.

> sapply(flags, class)
name   landmass       zone       area population   language   religion       bars    stripes    colours        red      green       blue       gold      white      black     orange    mainhue    circles    crosses   saltires   quarters
"factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer"  "integer"  "integer"
sunstars   crescent   triangle       icon    animate       text    topleft   botright
"integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor"

| Keep working like that and you'll get there!

  |==============================================================================================                                                                                                                                            |  40%
| If we wish to be explicit about the format of the result we expect, we can use vapply(flags, class, character(1)). The 'character(1)' argument tells R that we expect the class function to return a character vector of length 1 when applied to
| EACH column of the flags dataset. Try it now.

> vapply(flags, class, character(1))
      name   landmass       zone       area population   language   religion       bars    stripes    colours        red      green       blue       gold      white      black     orange    mainhue    circles    crosses   saltires   quarters
  "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer"  "integer"  "integer"
  sunstars   crescent   triangle       icon    animate       text    topleft   botright
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor"

| Keep up the great work!

  |=======================================================================================================                                                                                                                                   |  44%
| Note that since our expectation was correct (i.e. character(1)), the vapply() result is identical to the sapply() result -- a character vector of column classes.

...

  |================================================================================================================                                                                                                                          |  48%
| You might think of vapply() as being 'safer' than sapply(), since it requires you to specify the format of the output in advance, instead of just allowing R to 'guess' what you wanted. In addition, vapply() may perform faster than sapply()
| for large datasets. However, when doing data analysis interactively (at the prompt), sapply() saves you some typing and will often be good enough.

...

  |==========================================================================================================================                                                                                                                |  52%
| As a data analyst, you'll often wish to split your data up into groups based on the value of some variable, then apply a function to the members of each group. The next function we'll look at, tapply(), does exactly that.

...

  |===================================================================================================================================                                                                                                       |  56%
| Use ?tapply to pull up the documentation.

> ?tapply

| All that hard work is paying off!

  |============================================================================================================================================                                                                                              |  60%
| The 'landmass' variable in our dataset takes on integer values between 1 and 6, each of which represents a different part of the world. Use table(flags$landmass) to see how many flags/countries fall into each group.

> table(flags$landmass)

 1  2  3  4  5  6
31 17 35 52 39 20

| That's a job well done!

  |======================================================================================================================================================                                                                                    |  64%
| The 'animate' variable in our dataset takes the value 1 if a country's flag contains an animate image (e.g. an eagle, a tree, a human hand) and 0 otherwise. Use table(flags$animate) to see how many flags contain an animate image.

> table(flags$animate)

  0   1
155  39

| That's correct!

  |===============================================================================================================================================================                                                                           |  68%
| This tells us that 39 flags contain an animate object (animate = 1) and 155 do not (animate = 0).

...

|========================================================================================================================================================================                                                                  |  72%
| If you take the arithmetic mean of a bunch of 0s and 1s, you get the proportion of 1s. Use tapply(flags$animate, flags$landmass, mean) to apply the mean function to the 'animate' variable separately for each of the six landmass groups, thus
| giving us the proportion of flags containing an animate image WITHIN each landmass group.

> tapply(flags$animate, flags$landmass, mean)
1         2         3         4         5         6
0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000

| You got it!

  |==================================================================================================================================================================================                                                        |  76%
| The first landmass group (landmass = 1) corresponds to North America and contains the highest proportion of flags with an animate image (0.4194).

...

|===========================================================================================================================================================================================                                               |  80%
| Similarly, we can look at a summary of population values (in round millions) for countries with and without the color red on their flag with tapply(flags$population, flags$red, summary).

> tapply(flags$population, flags$red, summary)
$`0`
Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
0.00    0.00    3.00   27.63    9.00  684.00

$`1`
Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
0.0     0.0     4.0    22.1    15.0  1008.0


| Keep working like that and you'll get there!

  |=====================================================================================================================================================================================================                                     |  84%
| What is the median population (in millions) for countries *without* the color red on their flag?

1: 0.0
2: 9.0
3: 4.0
4: 27.6
5: 22.1
6: 3.0

Selection: 6

| You are really on a roll!

  |==============================================================================================================================================================================================================                            |  88%
| Lastly, use the same approach to look at a summary of population values for each of the six landmasses.

> tapply(flags$population, flags$landmass, summary)
$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   0.00    0.00    0.00   12.29    4.50  231.00

$`2`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   0.00    1.00    6.00   15.71   15.00  119.00

$`3`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   0.00    0.00    8.00   13.86   16.00   61.00

$`4`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  0.000   1.000   5.000   8.788   9.750  56.000

$`5`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   0.00    2.00   10.00   69.18   39.00 1008.00

$`6`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
   0.00    0.00    0.00   11.30    1.25  157.00


| That's correct!

  |=======================================================================================================================================================================================================================                   |  92%
| What is the maximum population (in millions) for the fourth landmass group (Africa)?

  1: 5.00
2: 119.0
3: 157.00
4: 1010.0
5: 56.00

Selection: 5

| All that hard work is paying off!

  |=================================================================================================================================================================================================================================         |  96%
| In this lesson, you learned how to use vapply() as a safer alternative to sapply(), which is most helpful when writing your own functions. You also learned how to use tapply() to split your data into groups based on the value of some
| variable, then apply a function to each group. These functions will come in handy on your quest to become a better data analyst.

...

|==========================================================================================================================================================================================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

  1: No
2: Yes

Selection:
  Enter an item from the menu, or 0 to exit
Selection: 2
What is your email address? digantjani54@yahoo.com
What is your assignment token? GQb9d5bQZlbpThqM
Grade submission succeeded!

  | All that hard work is paying off!

  | You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Basic Building Blocks      2: Workspace and Files        3: Sequences of Numbers       4: Vectors                    5: Missing Values             6: Subsetting Vectors         7: Matrices and Data Frames   8: Logic
 9: Functions                 10: lapply and sapply         11: vapply and tapply         12: Looking at Data           13: Simulation                14: Dates and Times           15: Base Graphics

Selection: bye()
Enter an item from the menu, or 0 to exit
Selection: 0

| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: Take me to the swirl course repository!

Selection: 0

| Leaving swirl now. Type swirl() to resume.
