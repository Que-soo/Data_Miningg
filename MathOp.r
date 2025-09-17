x <- 10
y <- 5
operation <- "multiply"

print(paste("x is", x, "y is", y, "and operation is", operation))

result <- switch(operation,
"add" = x+y,
"subtract" = x-y,
"multiply" = x*y,
"devide" = x/y,
"Invalid Operation"
)

print(result)
