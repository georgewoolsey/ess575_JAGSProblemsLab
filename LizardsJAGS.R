
  model{
    # priors
    a ~ dnorm(0,1E-6)
    b ~ dnorm(0,1E-6)
    # likelihood
    for (i in 1:n) {
      p[i] <- ilogit(a + b*x[i])
      y[i] ~ dbern(p[i])
    }
    ## quantities of interest
      # The predicted probability of occupancy
      for(j in 1:length(perim_area_z)){
        p_est[j] <- ilogit(a + b*perim_area_z[j])
      }
  
  }
  
