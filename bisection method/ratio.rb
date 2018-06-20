
UPPER_BOUND = 2000000000  # => 2000000000

def ratio(b, a)
  return (a * 100) / b  # => 80, 99, 80, 99, 80, 99, 80, 99, 80, 99, ...
end                     # => :ratio

def find_needs_games(games, won)
  if ratio(games, won) == ratio(games + UPPER_BOUND, won + UPPER_BOUND)  # => false, false, true, false, false
    return -1                                                            # => -1
  end

  return (0..UPPER_BOUND).bsearch {|i| ratio(games, won) < ratio(games + i, won + i) }  # => 1, 6, 1000, 19230770
end                                                                                     # => :find_needs_games


find_needs_games(10, 8)                  # => 1
find_needs_games(100, 80)                # => 6
find_needs_games(47, 47)                 # => -1
find_needs_games(99000, 0)               # => 1000
find_needs_games(1000000000, 470000000)  # => 19230770
