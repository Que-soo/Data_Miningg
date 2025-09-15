numbers <- c(20,55,70)

if (all(numbers > 50)) {
    print("All are above 50")
} else if (any(numbers > 50)) {
    print("Some are above 50")
} else {
    print("None are above 50")
}