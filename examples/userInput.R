UserInput <- function() {
  input <- readline("Enter input: ")
  if (substr(input, 1, 1) == "n")
    cat("Your input is N\n")
  else if (substr(input, 1, 1) == "y")
    cat("Your input is Y\n")
  else
    cat("You've entered wrong input\n")
}

UserInput()

Calculate <- function(a, b) {
  operators <- c(" +   -   *   /")
  cat("operators: ", operators)
  operator <- readline("Choose operator: ")
  input <- substr(operator, 1, 1)
  switch (input,
         "+" = cat(a, " + ", b, " = ", a+b, "\n"),
         "-" = cat(a, " - ", b, " = ", a-b, "\n"),
         "*" = cat(a, " * ", b, " = ", a*b, "\n"),
         "/" = cat(a, " / ", b, " = ", a/b, "\n"),
         print("You've entered wrong input\n")
  )
}
a <- as.numeric(readline("Enter a: "))
b <- as.numeric(readline("Enter b: "))
Calculate(a, b)