std.data <- data.frame( 
  std_name = c ("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas"), 
  std_score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0), 
  attempts = c(1, 3, 2, 3, 2, 1, 2) 
)

std.data$qualify <- c("yes","no","yes","no","no","no", "yes") 
v <- std.data 

# Add new row - Create second data frame
std.newdata <- data.frame( 
  std_name = c ("Emily"), 
  std_score = c(14.5), 
  attempts = c(1), 
  qualify = c("yes") 
) 
# Bind the two data frames. 
std.finaldata <- rbind(std.data,std.newdata) 

# Display Structure
str(std.data)

# Display summary
std.data$qualify <- as.factor(std.data$qualify)
summary(std.data) 

# Display number of rows and columns
dim(std.data) # both
nrow(std.data) # row only
ncol(std.data) # column only
