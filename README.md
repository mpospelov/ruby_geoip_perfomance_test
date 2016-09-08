This code is targeted to compare performace of geoip gems for ruby

```
Warming up --------------------------------------
           maxminddb    97.000  i/100ms
       geoip2_compat     4.686k i/100ms
         hive_geoip2   873.000  i/100ms
      maxmind_geoip2   146.000  i/100ms
Calculating -------------------------------------
           maxminddb    986.849  (± 3.5%) i/s -      4.947k in   5.019226s
       geoip2_compat     47.570k (± 4.1%) i/s -    238.986k in   5.032289s
         hive_geoip2      8.952k (± 4.7%) i/s -     45.396k in   5.082901s
      maxmind_geoip2      1.468k (± 3.3%) i/s -      7.446k in   5.078649s
```

the winner is geoip2_compat
