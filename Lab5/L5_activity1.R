# User to input a year
year <- as.integer(readline(prompt = "Input year: "))

# Check leap year condition
if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
  cat(year, "is a leap year.\n")
} else {
  cat(year, "is not a leap year.\n")
}