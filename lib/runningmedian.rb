require 'set'

def running_median(n, a, b)
  input = 1983
  sum = input
  median = input
  
  n.times {
    input = (input * a + b) % 20090711
  }

  sum
end

running_median(10, 1, 0)
