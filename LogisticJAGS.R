
  ## Logistic example for Primer
    model{
      # priors
      K ~ dunif(0, 4000) # dunif(alpha = lower limit, beta = upper limit)
      r ~ dunif (0, 2) # dunif(alpha, beta)
      sigma ~ dunif(0, 2) # dunif(alpha, beta)
      tau <- 1/sigma^2
      # likelihood
      for(i in 1:n){
        mu[i] <- r - r/K * x[i]
        y[i] ~ dnorm(mu[i], tau) # dnorm(mu,tau)
      }
      ## quantities of interest
      # population size where the population growth rate is maximum
      N_max_pop_grwth_rt <- K/2
      # The rate of population growth
      for(j in 1:length(N)){
        pop_grwth_rt[j] <- r * N[j] * (1 - ( N[j] / K ))
      }
    }
  
