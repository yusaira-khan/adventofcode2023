elfData <- read.delim("input", header = FALSE)[['V1']]
twoNumbers <- "^[[:alpha:]]*(\\d)\\w*(\\d)[[:alpha:]]*$"
singleNumber <- "^[[:alpha:]]*(\\d)[[:alpha:]]*$"
callibratedData1 <- as.numeric(
  ifelse(
    grepl(twoNumbers,elfData),
    gsub(twoNumbers,"\\1\\2",elfData),
    gsub(singleNumber,"\\1\\1",elfData)
  )
)
print(sum(callibratedData1))


digits <- list(one=1, two=2, three=3, four=4, five=5, six=6, seven=7, eight=8, nine=9)
digitGroup<- paste(names(digits),collapse="|")
firstPattern <-paste(c("\\w*?", "(", "\\d|", digitGroup, ")+?", "\\w*"), collapse="")
lastPattern <-paste(c("\\w*", "(", "\\d|", digitGroup, ")", "\\w*"), collapse="")
n4 <- gsub("\\w*(\\d|four|five)\\w*","\\1","fouronevhnrz44") #output 4
nFour <-gsub("\\w*?(\\d|four|five)\\w*","\\1","fouronevhnrz44") #output four

# getDigitFromString <- function(str) {
#   ifelse(grepl("^\\d$",str),as.numeric(str),as.numeric(digits[str]))
# }
getDigitFromPattern <- function(pattern,strData){
  strNum <- gsub(pattern,"\\1",strData)

  a<-grepl("^\\d$",strNum)
  b<-as.numeric(ifelse(a,
         digits[as.numeric(strNum)],
         digits[strNum]
  ))
  # print(strNum)
  # print(a)
  # print(b)
  b
}

firstNumber<-getDigitFromPattern(firstPattern,elfData)
lastNumber<-getDigitFromPattern(lastPattern,elfData)
callibratedData2<- firstNumber*10+lastNumber
# print (callibratedData2)

print(sum(callibratedData2))
