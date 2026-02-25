# Create first array
# 2 rows, 4 columns, 3 tables
Array1 <- array(1:24, dim = c(2,4,3))

# Print Array1
Array1

# Print second row of second matrix (table 2)
# Format: [row, column, table]
Array1[2,,2]



# Create second array
# 3 rows, 2 columns, 5 tables
Array2 <- array(25:54, dim = c(3,2,5))

# Print Array2
Array2

# Print element in 3rd row, 2nd column, 1st matrix
Array2[3,2,1]