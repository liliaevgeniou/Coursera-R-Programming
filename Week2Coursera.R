
fill.id <- function(i){
  if (i < 10) {
    j = paste(0, 0, i, sep = "")
  } else {
    if (i < 100 && i >= 10) {
      j = paste(0, i, sep = "")
    } else 
      j = i
  }
  j
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  tmp = NULL
  for (i in id) {
    tmp1 <- read.csv(paste(directory, "/", fill.id(i), ".csv", sep = ""))
    tmp <- c(tmp, tmp1[[pollutant]][!is.na(tmp1[[pollutant]])])
  }
  mean(tmp)
}

complete <- function(directory, id = 1:332) {
  nobs = NULL
  for (i in id) 
    nobs = c(nobs, sum(complete.cases(read.csv(paste(directory, "/", fill.id(i), ".csv", sep = "")))))
  data.frame(id, nobs)
}

corr <- function(directory, threshold = 0) {
  res = NULL
  thecomplete <- complete(directory)
  for (i in which(thecomplete$nobs > threshold)) {
    tmp = read.csv(paste(directory, "/", fill.id(i), ".csv", sep = ""))
    res = c(res, cor(tmp$nitrate[!is.na(tmp$nitrate) & !is.na(tmp$sulfate)], tmp$sulfate[!is.na(tmp$nitrate) & !is.na(tmp$sulfate)]))
  }
  res
} 















