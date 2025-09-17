signal <- "green"

result <- switch(signal,
"green" = "Go", 
"yellow" = "Ready", 
"red" = "Stop", 
"Invalid Signal") 

print(result)
