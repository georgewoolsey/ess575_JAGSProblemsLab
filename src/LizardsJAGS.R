
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
      # different perimeter-area estimates
      p_x10 <- exp(a + b*x10) / (1 + exp(a + b*x10))
      p_x20 <- exp(a + b*x20) / (1 + exp(a + b*x20))
      diff_x10_x20 <- p_x10 - p_x20
  }
  
