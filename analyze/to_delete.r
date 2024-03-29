library(nlme)

# data_generation
logger <- 1:150
time <- 1:600

aux <- rnorm(length(time), 0, 3)
x1 <- rnorm(length(time) * length(logger), rep(aux, length(logger)), 2)
x2 <- rnorm(length(time) * length(logger), rep(sample(aux), length(logger)), 2)
x3 <- rep(rnorm(length(time), 0, 2), length(logger))
l1 <- rep(rnorm(length(logger), 0, 2), each = length(time))

resp <- rnorm(length(time) * length(logger), -2 + 2 * x1 - 3 * x2 + 1 * x3 + l1)

dat <- data.frame(resp, logger = factor(rep(logger, each = length(time))),
  time = factor(rep(time, length(logger))), x1, x2, x3, l1)

# analysis
mod <- lme(resp ~ x1 + x2 + x3 + l1, random = ~ 1 | logger, data = dat)

#plot(mod)
summary(mod)
anova(mod)