class Allergies

  def initialize()
    @values = {}    # => {}
  end               # => :initialize

  def add(friends)
    @values[@values.keys.length] = friends  # => ["dara", "minzy"], ["cl", "minzy"]
  end                                       # => :add

  def list()
    menu = {}  # => {}

    friends = @values.values.flatten.uniq                                           # => ["dara", "minzy", "cl"]
    @values.keys.each { |key|                                                       # => [0, 1]
      menu[key] = {}                                                                # => {},                      {}
      friends.each { |friend|                                                       # => ["dara", "minzy", "cl"], ["dara", "minzy", "cl"]
        menu[key][friend] = @values[key].select { |value| value == friend }.length  # => 1, 1, 0, 0, 1, 1
      }                                                                             # => ["dara", "minzy", "cl"], ["dara", "minzy", "cl"]
    }                                                                               # => [0, 1]

    menu                                                     # => {0=>{"dara"=>1, "minzy"=>1, "cl"=>0}, 1=>{"dara"=>0, "minzy"=>1, "cl"=>1}}
    1.upto(@values.keys.length).each { |food_index|          # => #<Enumerator: 1:upto(2)>
      food_index                                             # => 1,                                    2
      @values.keys.combination(food_index).select { |foods|  # => #<Enumerator: [0, 1]:combination(1)>, #<Enumerator: [0, 1]:combination(2)>
        foods.each { |food|                                  # => [0], [1], [0, 1]
          food                                               # => 0,     1,     0,     1
          menu[food].values.all? { |value| value > 0 }       # => false, false, false, false
        }                                                    # => [0], [1], [0, 1]
      }                                                      # => [[0], [1]], [[0, 1]]
    }                                                        # => 1
  end                                                        # => :list
end                                                          # => :list

allergies = Allergies.new()       # => #<Allergies:0x00007fca108a4648 @values={}>
allergies.add(["dara", "minzy"])  # => ["dara", "minzy"]
allergies.add(["cl", "minzy"])    # => ["cl", "minzy"]
allergies.list()                  # => 1
