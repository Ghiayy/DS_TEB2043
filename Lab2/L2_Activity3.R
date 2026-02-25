#User input
name <- (readline("Name: "))
phone <- (readline("Phone NUmber: "))

#convert name to uppercase
name_upper <- toupper(name)

#extract phone number
first3 <- substr(phone, 1, 3)
last4 <- substr(phone, nchar(phone)-3, nchar(phone))

cat("Hi,", name_upper, ". A verification code has been sent to",
    first3, "-xxxxx", last4)