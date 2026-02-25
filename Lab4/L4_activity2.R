# Create vector V1
V1 = c(2,3,1,5,4,6,8,7,9)

# Create 3x3 matrix using V1
Matrix1 <- matrix(V1, nrow = 3, ncol = 3)

# Print Matrix1
Matrix1

# Transpose Matrix1 to create Matrix2
Matrix2 <- t(Matrix1)

# Print Matrix2
Matrix2

# Rename rows and columns
rownames(Matrix1) <- c("R1","R2","R3")
colnames(Matrix1) <- c("C1","C2","C3")

rownames(Matrix2) <- c("R1","R2","R3")
colnames(Matrix2) <- c("C1","C2","C3")

# Show updated matrices
Matrix1
Matrix2

# MATRIX OPERATIONS
# Addition
Matrix1 + Matrix2

# Subtraction
Matrix1 - Matrix2

# Multiplication
Matrix1 * Matrix2

# Division
Matrix1 / Matrix2