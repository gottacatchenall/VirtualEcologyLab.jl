All drift models are called via  

```
function simulate(mech::AbstractDriftModel)

end

```

Drift is defined as

$N(t) = f(N(t-1), \theta)$

where $f$ is some random process applied to $N(t-1)$.


The domains `Abundance`, `Occupancy`, `` 
