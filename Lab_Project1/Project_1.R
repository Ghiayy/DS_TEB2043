install.packages("tidyr")

# LOAD REQUIRED LIBRARIES
library(tidyr)
library(stringr)

# STEP 1: READ DATA
data <- read.csv("Unclean Dataset.csv",
                 fileEncoding = "latin1",
                 stringsAsFactors = FALSE)


# STEP 2: SEPARATE MESSY COLUMN
cleaned_data <- separate(data,
                         Student_ID,
                         into = c("Student_ID",
                                  "First_Name",
                                  "Last_Name",
                                  "Age",
                                  "Gender",
                                  "Course",
                                  "Enrollment_Date",
                                  "Total_Payments"),
                         sep = "\\|")


# STEP 3: TRIM EXTRA SPACES
cleaned_data$Student_ID <- str_trim(cleaned_data$Student_ID)
cleaned_data$First_Name <- str_trim(cleaned_data$First_Name)
cleaned_data$Last_Name <- str_trim(cleaned_data$Last_Name)
cleaned_data$Age <- str_trim(cleaned_data$Age)
cleaned_data$Gender <- str_trim(cleaned_data$Gender)
cleaned_data$Course <- str_trim(cleaned_data$Course)
cleaned_data$Enrollment_Date <- str_trim(cleaned_data$Enrollment_Date)
cleaned_data$Total_Payments <- str_trim(cleaned_data$Total_Payments)


# STEP 4: REMOVE SPECIAL CHARACTERS
cleaned_data$First_Name <- gsub("[^A-Za-z]", "", cleaned_data$First_Name)
cleaned_data$Last_Name <- gsub("[^A-Za-z]", "", cleaned_data$Last_Name)
cleaned_data$Course <- gsub("[^A-Za-z ]", "", cleaned_data$Course)


# STEP 5: CONVERT DATA TYPES
cleaned_data$Age <- as.numeric(cleaned_data$Age)

cleaned_data$Total_Payments <- gsub("[^0-9.]", "", cleaned_data$Total_Payments)
cleaned_data$Total_Payments <- as.numeric(cleaned_data$Total_Payments)

cleaned_data$Enrollment_Date <- as.Date(cleaned_data$Enrollment_Date,
                                        format = "%Y-%m-%d")


# STEP 6: REMOVE DUPLICATES
cleaned_data <- cleaned_data[!duplicated(cleaned_data), ]


# STEP 7: HANDLE MISSING VALUES

# Replace missing Age with mean
mean_age <- mean(cleaned_data$Age, na.rm = TRUE)
cleaned_data$Age[is.na(cleaned_data$Age)] <- mean_age

# Replace missing Total_Payments with median
median_payment <- median(cleaned_data$Total_Payments, na.rm = TRUE)
cleaned_data$Total_Payments[is.na(cleaned_data$Total_Payments)] <- median_payment

# Replace missing text values with "Unknown"
cleaned_data$First_Name[is.na(cleaned_data$First_Name)] <- "Unknown"
cleaned_data$Last_Name[is.na(cleaned_data$Last_Name)] <- "Unknown"
cleaned_data$Gender[is.na(cleaned_data$Gender)] <- "Unknown"
cleaned_data$Course[is.na(cleaned_data$Course)] <- "Unknown"

cleaned_data$Last_Name[cleaned_data$Last_Name == ""] <- "Unknown"

# Remove row where student ID is missing
cleaned_data <- cleaned_data[
  !is.na(cleaned_data$Student_ID) &
    cleaned_data$Student_ID != "", ]


# STEP 8: HANDLE OUTLIERS USING IQR (AGE)
Q1 <- quantile(cleaned_data$Age, 0.25)
Q3 <- quantile(cleaned_data$Age, 0.75)
IQR_value <- Q3 - Q1

lower_limit <- Q1 - 1.5 * IQR_value
upper_limit <- Q3 + 1.5 * IQR_value

# Print limits
lower_limit
upper_limit

# Show possible outliers
outliers <- cleaned_data$Age[
  cleaned_data$Age < lower_limit |
    cleaned_data$Age > upper_limit
]

outliers

# Visual check
boxplot(cleaned_data$Age)

# STEP 9: REMOVE ANY REMAINING NA
cleaned_data <- cleaned_data[complete.cases(cleaned_data), ]


# STEP 10: SAVE FINAL CLEAN DATASET
write.csv(cleaned_data,
          "cleaned_dataset.csv",
          row.names = FALSE)


# CHECK FINAL RESULT
colSums(is.na(cleaned_data))
summary(cleaned_data)

# RECHECK
# Check Structure
str(cleaned_data)

# Check Missing Values
colSums(is.na(cleaned_data))

# Check Empty Strings
sum(cleaned_data$Last_Name == "")

# Check Duplicates Removed
sum(duplicated(cleaned_data))

# Check Outliers Were Removed (Age)
boxplot(cleaned_data$Age)

# Check Row Count

nrow(cleaned_data)
