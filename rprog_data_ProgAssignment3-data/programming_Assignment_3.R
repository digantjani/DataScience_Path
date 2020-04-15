setwd("rprog_data_ProgAssignment3-data/")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])






str(outcome[,c(2,7,11,17,19,23)])

best("Sc","heart attack")
best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],   # hospital
                                data[, 7],   # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")

    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    if(!state %in% fd[, "state"]){
        stop('invalid state')
    } else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else {
        si <- which(fd[, "state"] == state)
        ts <- fd[si, ]    # extracting data for the called state
        oi <- as.numeric(ts[, eval(outcome)])
        min_val <- min(oi, na.rm = TRUE)
        result  <- ts[, "hospital"][which(oi == min_val)]
        output  <- result[order(result)]
    }
    return(output)
}


rankhospital2 <- function(state, outcome, rank = "best"){
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],   # hospital
                                data[, 7],   # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")

    if(!state %in% fd[, "state"]){
        stop('invalid state')
    } else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else if(is.numeric(rank)){

        si <- which(fd[, "state"] == state)
        ts <- fd[si, ]    # extracting data for the called state
        if(rank >  nrow(data)){
            return("NA")
        } else {
            ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
            ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
            output <- ts[, "hospital"][rank]
        }
    } else if (!is.numeric(rank)) {
        if(rank == "best") {
            output <- best(state,outcome)
        } else if(rank == "worst") {
            si <- which(fd[, "state"] == state)
            ts <- fd[si, ]    # extracting data for the called state
            oi <- as.numeric(ts[, eval(outcome)])
            min_val <- max(oi, na.rm = TRUE)
            output  <- ts[, "hospital"][which(oi == min_val)]
        } else {
            stop("invalid rank")
        }
    }
    return(output)
}

rankhospital <- function(state, outcome, rank = "best"){
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],   # hospital
                                data[, 7],   # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")

    if(!state %in% fd[, "state"]){
        stop('invalid state')
    } else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else if(is.numeric(rank)){
        si <- which(fd[, "state"] == state)
        ts <- fd[si, ]    # extracting data for the called state
        if(rank >  nrow(data)){
            return("NA")
        } else {
            si <- which(fd[, "state"] == state)
            ts <- fd[si, ]                     # extracting dataframe for the called state
            ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
            ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
            output <- ts[, "hospital"][rank]
        }
    } else if (!is.numeric(rank)) {
        if(rank == "best") {
            output <- best(state,outcome)
        } else if(rank == "worst") {
            si <- which(fd[, "state"] == state)
            ts <- fd[si, ]
            ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
            ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], decreasing = TRUE), ]
            output <- ts[, "hospital"][1]
        } else {
            stop("invalid rank")
        }
    }
    return(output)
}

rankall <- function(outcome, num = "best"){
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],  # hospital
                                data[, 7],  # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    fd[, eval(outcome)] <- as.numeric(fd[, eval(outcome)])

    ## Check that state and outcome are valid

    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else if (is.numeric(num)) {
        by_state <- with(fd, split(fd, state))
        ordered  <- list()
        for (i in seq_along(by_state)){
            by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)],
                                                 by_state[[i]][, "hospital"]), ]
            ordered[[i]]  <- c(by_state[[i]][num, "hospital"], by_state[[i]][, "state"][1])
        }
        result <- do.call(rbind, ordered)
        output <- as.data.frame(result, row.names = result[, 2], stringsAsFactors = FALSE)
        names(output) <- c("hospital", "state")
    } else if (!is.numeric(num)) {
        if (num == "best") {
            by_state <- with(fd, split(fd, state))
            ordered  <- list()
            for (i in seq_along(by_state)){
                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)],
                                                     by_state[[i]][, "hospital"]), ]
                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
            }
            result <- do.call(rbind, ordered)
            output <- as.data.frame(result, stringsAsFactors = FALSE)
            rownames(output) <- output[, 2]
        } else if (num == "worst") {
            by_state <- with(fd, split(fd, state))
            ordered  <- list()
            for (i in seq_along(by_state)){
                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)],
                                                     by_state[[i]][, "hospital"],
                                                     decreasing = TRUE), ]
                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
            }
            result <- do.call(rbind, ordered)
            output <- as.data.frame(result, stringsAsFactors = FALSE)
            rownames(output) <- output[, 2]
        } else {
            stop('invalid num')
        }
    }
    return(output)
}
