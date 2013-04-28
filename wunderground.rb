require "wunderground-api"
require 'pp'
w = Wunderground.new(ziip)
f = w.forecast
PP.pp f
day = f[2]
condition = day["skyicon"]
print condition
good = condition =~ /sunny/
puts good
