
  model{
    # priors
    a ~ dnorm(0, 10000)
    b ~ dnorm(0, 10000)
    # likelihood
    for (i in 1:n) {
      p[i] <- ilogit(a + b*x[i])
      # logit(p[i]) <- a + b*x[i] ??? which one
      y[i] ~ dbern(p[i])
    }
    ## quantities of interest
      # The predicted probability of occupancy
      for(j in 1:length(perim_area_z)){
        p_est[j] <- ilogit(a + b*perim_area_z[j])
      }
  
  }
  
