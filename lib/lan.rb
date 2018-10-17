class DisjoinSet
  def initialize(n)
    @parents = Array.new(n) {|i| i}
  end

  def find(x)
    return x if @parents[x] == x
    @parents[x] = find(@parents[x])
  end

  def merge(u, v)
    u = find(u)
    v = find(v)
    return if u == v
    @parents[u] = v
  end
end

class Lan
  def initialize(n, x, y)
    @set = DisjoinSet.new(n)
    @x = x
    @y = y
  end

  def add_edge(u, v)
    @set.merge(u, v)
  end

  def distance
    distances = {}
    (0...@x.length).each {|u|
      (u+1...@x.length).each {|v|
        key = [u, v]
        value = Math.sqrt((@x[u] - @x[v]) ** 2 + (@y[u] - @y[v]) ** 2)
        distances[key] = value
      }
    }
    
    ordered_keys_of_distances = distances.keys.sort_by {|key| distances[key] }
    ordered_keys_of_distances.select{|point| @set.merge(point[0], point[1])}.map{|key| distances[key]}.inject(:+)
  end
end

def run
  gets.to_i.times {
    n, m = gets.split.map(&:to_i)
    x_points = gets.split.map(&:to_i)
    y_points = gets.split.map(&:to_i)
    lan = Lan.new(n, x_points, y_points)
    m.times {
      points = gets.split.map(&:to_i)
      lan.add_edge(points[0], points[1])
    }
    puts lan.distance
  }
end

run
=begin
lan = Lan.new(3, [0, 0, 1], [0, 1, 2])
lan.add_edge(0, 1)
lan.distance

lan = Lan.new(10, [-7, -7, 10, -4, 10, -4, -5, 0, -10, -6], [6, 8, -5, 3, -4, 6, -10, 4, -7, 10])
lan.add_edge(9, 7)
lan.add_edge(7, 3)
lan.add_edge(9, 7)
lan.add_edge(5, 0)
lan.add_edge(8, 6)
lan.distance
=end
