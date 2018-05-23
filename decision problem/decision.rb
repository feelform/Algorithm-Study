
n = 0

dist = Array.new(101) { Array.new(101) }

def decision(distance)
  visited = Array.new(n, false)
  visited[0] = true

  queue = []
  queue.push(0)

  seen = 0
  while !queue.empty?  do
    here = queue.shift
    ++seen

    n.times { |there|
      if !visited[there] && dist[here][there] <= distance
        visited[there] = true
        queue.push(there)
      end
    }
  end
  return seen == n
end

def optimize()
  lo = 0, hi = 1416.00
  100.times {
    double mid = (lo + hi) / 2
    if decision(mid)
      hi = mid
    else
      lo = mid
    end
  }

  return hi
end

def distance loc1, loc2
  rad_per_deg = Math::PI/180  # PI / 180
  rkm = 6371                  # Earth radius in kilometers
  rm = rkm * 1000             # Radius in meters

  dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
  dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

  lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
  lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

  a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  rm * c # Delta in meters
end


