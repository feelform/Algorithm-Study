class Allergies

  def initialize()
    @values = {}    # => {}, {}
  end               # => :initialize

  def add(friends)
    @values[@values.keys.length] = friends  # => ["dara", "minzy"], ["cl", "minzy"], ["cl", "dara"], ["cl"], ["bom", "dara"], ["bom", "minzy"], ["a", "c", "d", "h", "i", "j"], ["a", "d", "i"], ["a", "c", "f", "g", "h", "i", "j"], ["b", "d", "g"], ...
  end                                       # => :add

  def available_foods()
    menu = {}            # => {}, {}, {}, {}

    friends = @values.values.flatten.uniq                                           # => ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["a", "c", "d", "h", "i", "j", "f", "g", "b", "e"], ["a", "c", "d", "h", "i", "j", "f", "g", "b", "e"]
    @values.keys.each { |key|                                                       # => [0, 1, 2, 3, 4, 5],             [0, 1, 2, 3, 4, 5],             [0, 1, 2, 3, 4, 5, 6],                              [0, 1, 2, 3, 4, 5, 6]
      menu[key] = {}                                                                # => {},                             {},                             {},                             {},                             {},                             {},                             {},                             {},                             {},                             {},                             ...
      friends.each { |friend|                                                       # => ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ...
        menu[key][friend] = @values[key].select { |value| value == friend }.length  # => 1,                              1,                              0,                              0,                              0,                              1,                              1,                              0,                              1,                              0,                              ...
      }                                                                             # => ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ["dara", "minzy", "cl", "bom"], ...
    }                                                                               # => [0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5, 6], [0, 1, 2, 3, 4, 5, 6]

    (1..@values.keys.length).each { |food_index|             # => 1..6, 1..6, 1..7, 1..7
      @values.keys.combination(food_index).select { |foods|  # => #<Enumerator: [0, 1, 2, 3, 4, 5]:combination(1)>, #<Enumerator: [0, 1, 2, 3, 4, 5]:combination(2)>, #<Enumerator: [0, 1, 2, 3, 4, 5]:combination(1)>, #<Enumerator: [0, 1, 2, 3, 4, 5]:combination(2)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(1)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(2)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(3)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(1)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(2)>, #<Enumerator: [0, 1, 2, 3, 4, 5, 6]:combination(3)>

        available_friends = foods.flat_map { |food|  # => [0],               [1],             [2],            [3],    [4],             [5],              [0, 1],                  [0, 2],                  [0, 3],                  [0, 4],                   ...
          menu[food].select {|k,v| v > 0}.keys       # => ["dara", "minzy"], ["minzy", "cl"], ["dara", "cl"], ["cl"], ["dara", "bom"], ["minzy", "bom"], ["dara", "minzy"],       ["minzy", "cl"],         ["dara", "minzy"],       ["dara", "cl"],           ...
        }.uniq                                       # => ["dara", "minzy"], ["minzy", "cl"], ["dara", "cl"], ["cl"], ["dara", "bom"], ["minzy", "bom"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "bom"], ...
        
        if friends.length == available_friends.length  # => false, false, false, false, false, false, false, false, false, false, ...
          return foods                                 # => [1, 4], [1, 4], [0, 2, 5], [0, 2, 5]
        end
      }                                                # => [], [], [], [], [], []
    }
  end                                                  # => :available_foods

  def count_available_foods()
    available_foods().length   # => 2, 3
  end                          # => :count_available_foods
end                            # => :count_available_foods

allergies = Allergies.new()        # => #<Allergies:0x00007ffa42936a18 @values={}>
allergies.add(["dara", "minzy"])   # => ["dara", "minzy"]
allergies.add(["cl", "minzy"])     # => ["cl", "minzy"]
allergies.add(["cl", "dara"])      # => ["cl", "dara"]
allergies.add(["cl"])              # => ["cl"]
allergies.add(["bom", "dara"])     # => ["bom", "dara"]
allergies.add(["bom", "minzy"])    # => ["bom", "minzy"]
allergies.available_foods()        # => [1, 4]
allergies.count_available_foods()  # => 2

allergies = Allergies.new()                         # => #<Allergies:0x00007ffa4294a0e0 @values={}>
allergies.add(["a", "c", "d", "h", "i", "j"])       # => ["a", "c", "d", "h", "i", "j"]
allergies.add(["a", "d", "i"])                      # => ["a", "d", "i"]
allergies.add(["a", "c", "f", "g", "h", "i", "j"])  # => ["a", "c", "f", "g", "h", "i", "j"]
allergies.add(["b", "d", "g"])                      # => ["b", "d", "g"]
allergies.add(["b", "c", "f", "h", "i"])            # => ["b", "c", "f", "h", "i"]
allergies.add(["b", "e", "g", "j"])                 # => ["b", "e", "g", "j"]
allergies.add(["b", "c", "g", "h", "i"])            # => ["b", "c", "g", "h", "i"]
allergies.available_foods()                         # => [0, 2, 5]
allergies.count_available_foods()                   # => 3
