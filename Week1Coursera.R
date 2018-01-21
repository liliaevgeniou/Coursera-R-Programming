#Question 11

colnames(airquality)

#Q12

airquality[c(1,2),]

#Q13

nrow(airquality)

#Q14

airquality[c(152,153),] #from the answer to Q13, which was 153
airquality[c((nrow(airquality)-1),nrow(airquality)),]

#Q15

airquality[47,1]
airquality[47,"Ozone"]

airquality$Ozone[47]

#Q16

#number_of_na <- function(x = (is.na(airquality[,"Ozone"]))) {
 # good <- (TRUE == x)
  #length(good)
#}

#isTRUE(is.na(airquality[,"Ozone"]))

is.na(airquality[,"Ozone"])

dataFrameNA <- function(airquality) {  # how do I make it generic so that it can
                                       # take any data.frame?
  x = 0
  for (i in 1:(nrow(airquality))) {
    if (is.na(airquality[i,"Ozone"])) {
      x = x+1
    }
  }
  x
}

# what did I do up there... so dumb and long
# Much easier version:
sum(is.na(airquality$Ozone))

#Q17

mean(airquality[,"Ozone"]) #I need to exclude NA values

mean(airquality[!is.na(airquality$Ozone), "Ozone"])

#Q18

OzoneAbove31withNA <- airquality[airquality$Ozone > 31, "Ozone"]
TemperatureAbove90withNA <- airquality[airquality$Temp > 90, "Temp"]
complete.cases()

mean(airquality$Solar.R[!is.na(airquality$Solar.R) & airquality$Ozone > 31 &
                          !is.na(airquality$Ozone) & airquality$Temp > 90])

#Q19

mean(airquality$Temp[airquality$Month == 6])

#Q20

max(airquality$Ozone[!is.na(airquality$Ozone) & airquality$Month == 5])
