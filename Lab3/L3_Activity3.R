students <- list(
  Robert   = c(Chemistry = 59, Physics = 89),
  Hemsworth= c(Chemistry = 71, Physics = 86),
  Scarlett = c(Chemistry = 83, Physics = 65),
  Evans    = c(Chemistry = 68, Physics = 52),
  Pratt    = c(Chemistry = 65, Physics = 60),
  Larson   = c(Chemistry = 57, Physics = 67),
  Holland  = c(Chemistry = 62, Physics = 40),
  Paul     = c(Chemistry = 92, Physics = 77),
  Simu     = c(Chemistry = 92, Physics = 90),
  Renner   = c(Chemistry = 59, Physics = 61)
)

chemistry_scores <- sapply(students, function(x) x[["Chemistry"]])
physics_scores <- sapply(students, function(x) x[["Physics"]])

fail_chemistry <- sum(chemistry_scores <= 49)
fail_physics <- sum(physics_scores <= 49)

highest_chemistry <- max(chemistry_scores)
highest_physics <- max(physics_scores)

top_chemistry_students <- names(chemistry_scores)[chemistry_scores == highest_chemistry]
top_physics_students <- names(physics_scores)[physics_scores == highest_physics]

cat("Chemistry failures:", fail_chemistry, "\n")
cat("Physics failures:", fail_physics, "\n")

cat("Highest Chemistry score:", highest_chemistry, "\n")
cat("Student(s) with highest Chemistry score:", top_chemistry_students, "\n")

cat("Highest Physics score:", highest_physics, "\n")
cat("Student(s) with highest Physics score:", top_physics_students, "\n")

