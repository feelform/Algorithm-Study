class Allergies

  def initialize()
    @values = {}    # => {}
  end               # => :initialize

  def add(friends)
    @values[@values.keys.length] = friends  # => ["dara", "minzy"], ["cl", "minzy"]
  end                                       # => :add

  def available_foods()
    menu = {}            # => {}, {}

    friends = @values.values.flatten.uniq                                           # => ["dara", "minzy", "cl"], ["dara", "minzy", "cl"]
    @values.keys.each { |key|                                                       # => [0, 1],                  [0, 1]
      menu[key] = {}                                                                # => {},                      {},                      {},                      {}
      friends.each { |friend|                                                       # => ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"]
        menu[key][friend] = @values[key].select { |value| value == friend }.length  # => 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, ...
      }                                                                             # => ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy", "cl"]
    }                                                                               # => [0, 1], [0, 1]

    (1..@values.keys.length).each { |food_index|             # => 1..2, 1..2
      @values.keys.combination(food_index).select { |foods|  # => #<Enumerator: [0, 1]:combination(1)>, #<Enumerator: [0, 1]:combination(2)>, #<Enumerator: [0, 1]:combination(1)>, #<Enumerator: [0, 1]:combination(2)>

        available_friends = foods.flat_map { |food|  # => [0], [1], [0, 1], [0], [1], [0, 1]
          menu[food].select {|k,v| v > 0}.keys       # => ["dara", "minzy"], ["minzy", "cl"], ["dara", "minzy"], ["minzy", "cl"], ["dara", "minzy"], ["minzy", "cl"], ["dara", "minzy"], ["minzy", "cl"]
        }.uniq                                       # => ["dara", "minzy"], ["minzy", "cl"], ["dara", "minzy", "cl"], ["dara", "minzy"], ["minzy", "cl"], ["dara", "minzy", "cl"]

        if friends == available_friends  # => false, false, true, false, false, true
          return foods                   # => [0, 1], [0, 1]
        end
      }                                  # => [], []
    }
  end                                    # => :available_foods

  def count_available_foods()
    available_foods().length   # => 2
  end                          # => :count_available_foods
end                            # => :count_available_foods

allergies = Allergies.new()        # => #<Allergies:0x00007ff9fd144570 @values={}>
allergies.add(["dara", "minzy"])   # => ["dara", "minzy"]
allergies.add(["cl", "minzy"])     # => ["cl", "minzy"]
allergies.available_foods()        # => [0, 1]
allergies.count_available_foods()  # => 2
