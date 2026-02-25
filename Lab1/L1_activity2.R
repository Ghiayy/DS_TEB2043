num1 <- 0.956786
num2 <- 7.8345901

numbers <- c(num1, num2)

decimals <- c(2, 3)

for (i in 1:2) {
  result <- round(numbers[i], decimals [i])
  print(result)
}