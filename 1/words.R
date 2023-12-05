elfData <- read.delim("1/input", header = FALSE)[['V1']]

digits <- list(one=1, two=2, three=3, four=4, five=5, six=6, seven=7, eight=8, nine=9, "1"=1,"2"=2,"3"=3,"4"=4,"5"=5,"6"=6,"7"=7,"8"=8,"9"=9 )
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
  b<-as.numeric( digits[strNum] )
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
