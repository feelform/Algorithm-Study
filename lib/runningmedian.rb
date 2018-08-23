require 'set'

def running_median(n, a, b)
  input = 1983
  sum = input
  seq = SortedSet.new([input])
  left_seq = []
  right_seq = []
  median = input
  
  (n-1).times {
    input = (input * a + b) % 20090711

    if input > median
      right_seq.push input
    else
      left_seq.push input
    end

    diff = left_seq.size - right_seq.size

    if diff > 0
      right_seq.push median
      median = left_seq.pop
    elsif diff < 0
      left_seq.push median
      median = right_seq.pop
    end

    median

    sum = (sum + median) % 20090711
  }

  sum
end

def run()
  gets.to_i.times {
    args = gets.split.map(&:to_i)
    puts running_median(args[0], args[1], args[2])
  }
end

run()


running_median(10, 1, 0)
running_median(10, 1, 1)
#running_median(10000, 1273, 4936)


