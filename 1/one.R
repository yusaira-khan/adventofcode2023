elfData <- read.delim("1/input", header = FALSE)[['V1']]
twoNumbers <- "^[[:alpha:]]*(\\d)\\w*(\\d)[[:alpha:]]*$"
singleNumber <- "^[[:alpha:]]*(\\d)[[:alpha:]]*$"
callibratedData <- as.numeric(
  ifelse(
    grepl(twoNumbers,elfData),
    gsub(twoNumbers,"\\1\\2",elfData),
    gsub(singleNumber,"\\1\\1",elfData)
  )
)
print(sum(callibratedData))
# print(as.numeric(gsub("[[:alpha:]].**(\\d).*", "\\1",myData)))
