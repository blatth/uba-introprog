parteEntera:: Float -> Integer

parteEntera n | n>=0 && n<1 = 0
              | n > -1 && n<0 = -1
              | n >= 1 = 1 + parteEntera(n-1)
              | otherwise = (-1) + parteEntera(n+1)