library(nlme)
library(profvis)

yesno <- c(0,0)
for (iii in 1:100){
print(iii)
# data_generation
logger <- 1:50
time <- 1:60

aux <- rnorm(length(time), 0, 3)
x1 <- rnorm(length(time) * length(logger), rep(aux, length(logger)), 2)
x2 <- rnorm(length(time) * length(logger), rep(sample(aux), length(logger)), 2)
x3 <- rep(rnorm(length(time), 0, 2), length(logger))

#resp <- rnorm(length(time) * length(logger), -2 + 2 * x1 - 3 * x2 + 1 * x3)
resp <- rnorm(length(time) * length(logger), -2 - 3 * x2 + 1 * x3)

dat <- data.frame(resp, logger = factor(rep(logger, each = length(time))), 
  time = factor(rep(time, length(logger))), x1, x2, x3)

# analyses
mod <- lme(resp ~ x1 + x2 + x3, random = ~ 1 | logger, data = dat)

plot(mod)
summary(mod)
anova(mod)

for (ii in 1:10){
permutation_vector <- vector(length=20)

for (i in seq.int(1, length(permutation_vector))){
  time_permutation <- sample(time)
  dat_permutation <- dat
  dat_permutation$x1 <- dat_permutation[time_permutation,]$x1
  mod2 <- lme(resp ~ x1 + x2 + x3, random = ~ 1 | logger, data = dat_permutation)
  permutation_vector[i] <- summary(mod2)$coefficients$fixed["x1"]
}
#print(quantile(permutation_vector, 0.95)-abs(mod$coefficients$fixed["x1"]))
if (quantile(abs(permutation_vector), 0.95)>abs(mod$coefficients$fixed["x1"])) 
{yesno[1] <- yesno[1]+1} else {yesno[2] <- yesno[2]+1}
}
}
#### 100|0