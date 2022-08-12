#Code: Modeling a random variable
# define random variable x to be 1 if blue, 0 otherwise
beads <- rep(c("red", "blue"), times = c(2, 3))

x <- ifelse(sample(beads, 1) == "blue", 1, 0)

# demonstrate that the random variable is different every time
ifelse(sample(beads, 1) == "blue", 1, 0)
ifelse(sample(beads, 1) == "blue", 1, 0)
ifelse(sample(beads, 1) == "blue", 1, 0)

# Monte Carlo Simulation confirm that the average of the random sample
# is the average of the population

B <- 10^6
X <- sample(c(-1, 1), B, replace = TRUE, prob = c(9/19, 10/19))
mean(X)
sd(X)

# MATHEMATICALLY
a <- -1
b <- 1
p <- 9/19

expected_value.X <- a*p + b*(1-p)
expected_value.X

standard_error.X <- abs(b-a)*sqrt(p*(1-p))
standard_error.X

#Monte Carlo Simulation to confirm the sum of draws
B <- 10000
n <- 1000

S <- replicate(B, {
  X <- sample(c(-1, 1), n, replace = TRUE, prob = c(9/19, 10/19))
  sum(X)


})

mean(S)

expected_value.S <- n * expected_value.X
expected_value.S

sd(S)
standard_error.S <- sqrt(n)*standard_error.x
standard_error.S

# Monte Carlo Simulation to get the pr(sum of draws)
mean(S < 0)
# skip ,Monte Carlo Simulation and using CLT
pnorm(0, expected_value.S, standard_error.S)
