temp <- c(32, 35, 29, 40, 38)

if (all(temp >= 30)){
    print("All days were hot")
} else if (any(temp < 30)) {
    print("Some day was below 30")
}
