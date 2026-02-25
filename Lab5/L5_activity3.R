# User to input a number
num <- as.integer(readline(prompt = "Input an integer: "))

# Store original number
original_num <- num

# Count number of digits
n <- nchar(as.character(num))

# Initialize sum
sum <- 0

# While loop to calculate sum of digits^n
while (num > 0) {
  
  digit <- num %% 10        # get last digit
  sum <- sum + digit^n      # add digit^power
  num <- num %/% 10         # remove last digit
}

# Check if Armstrong
if (sum == original_num) {
  cat(original_num, "is an Armstrong number.\n")
} else {
  cat(original_num, "is not an Armstrong number.\n")
}