require "set"


def join(point)
  $nerds[point["pi"]] = point["qi"]
  $p_set.add(point["pi"])

  $nerds
end

$nerds = {}
$p_set = SortedSet.new()
join({ "pi" => 72, "qi" => 50})
join({ "pi" => 57, "qi" => 67})

