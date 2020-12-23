install.packages("lpSolve")
library(lpSolve)
library(ggplot2)

obj_coef <- c(13,23,30)
obj_coe2<- c(13,23)

con <- matrix(c(
  5,15,10,
  4,4,4,
  35,20,15,
  5,10,20
), nrow = 4, byrow = TRUE)

con2<- matrix(c(
  5,15,
  4,4,
  35,20,
  5,10
), nrow = 4, byrow = TRUE)



# directions
dir <- c("<=",
         "<=",
         "<=",
         "<="
         )
# resources
res <- c(480,
         160,
         1190,
         500
         )

sol <- lp(
  "max",
  obj_coef,
  con,
  dir,
  res
  )
sol2 <- lp(
  "max",
  obj_coef2,
  con2,
  dir,
  res
)

sol$objval
sol$solution
# visualize with Grape

barplot(sol$solution,
        main ="Amount of each type of Soda",
        names.arg = c("Strawberry", "Orange", "Grape"),
        col = "blue",
        density = 20
)


# without Grape
sol2$objval
sol2$solution

# visualize without Grabe
barplot(sol2$solution,
     main ="Amount of each type of Soda",
     names.arg = c("Strawberry", "Orange"),
     col = "blue",
     density = 20
     )
