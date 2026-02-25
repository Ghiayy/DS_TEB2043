# User to input a number
num <- as.integer(readline(prompt = "Input an integer: "))

# Loop from 1 until the number
for (i in 1:num) {
  
  cube <- i^3   # calculate cube
  
  cat("Number is:", i, "and cube of the", i, "is:", cube, "\n")
}