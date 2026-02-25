scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61,
            13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

pass <- scores > 49
print(pass)

A <- sum(scores >= 90 & scores <= 100)
B <- sum(scores >= 80 & scores <= 89)
C <- sum(scores >= 70 & scores <= 79)
D <- sum(scores >= 60 & scores <= 69)
E <- sum(scores >= 50 & scores <= 59)
F <- sum(scores <= 49)

grade_table <- data.frame(
  score = c("90-100", "80-89", "70-79", "60-69", "50-59", "<=49"),
  grade = c("A", "B", "C", "D", "E", "F"),
  Num_of_students = c(A, B, C, D, E, F)
    )

print(grade_table)