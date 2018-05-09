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

    1.upto(@values.keys.length).to_a.each { |food_index|        # => [1, 2]
      @values.keys.combination(food_index).to_a.select { |sub|  # => [[0], [1]], [[0, 1]]
        sub                                                     # => [0], [1], [0, 1]
      }                                                         # => [[0], [1]], [[0, 1]]
    }                                                           # => [1, 2]
  end                                                           # => :list
end                                                             # => :list

allergies = Allergies.new()       # => #<Allergies:0x00007fef3980b210 @values={}>
allergies.add(["dara", "minzy"])  # => ["dara", "minzy"]
allergies.add(["cl", "minzy"])    # => ["cl", "minzy"]
allergies.list()                  # => [1, 2]
