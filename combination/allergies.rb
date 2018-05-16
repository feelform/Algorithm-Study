class Allergies

  def initialize()
    @values = {}
  end

  def add(friends)
    @values[@values.keys.length] = friends
  end

  def available_foods()
    menu = {}

    friends = @values.values.flatten.uniq
    @values.keys.each { |key|
      menu[key] = {}
      friends.each { |friend|
        menu[key][friend] = @values[key].select { |value| value == friend }.length
      }
    }

    (1..@values.keys.length).each { |food_index|
      @values.keys.combination(food_index).select { |foods|

        available_friends = foods.flat_map { |food|
          menu[food].select {|k,v| v > 0}.keys
        }.uniq
        
        if friends.length == available_friends.length
          return foods
        end
      }
    }
  end

  def count_available_foods()
    available_foods().length
  end
end

def run()
  count_test_case = gets.to_i
    
  (1..count_test_case).each {
    allergies = Allergies.new()
    
    number_of_foods = gets.split(' ').last.to_i
    gets
    (1..number_of_foods).each {
      allergies.add(gets.split(' ').drop(1))
    }
    puts allergies.count_available_foods()
  }
end

run()

allergies = Allergies.new()
allergies.add(["dara", "minzy"])
allergies.add(["cl", "minzy"])
allergies.add(["cl", "dara"])
allergies.add(["cl"])
allergies.add(["bom", "dara"])
allergies.add(["bom", "minzy"])
allergies.available_foods()
allergies.count_available_foods()

allergies = Allergies.new()
allergies.add(["a", "c", "d", "h", "i", "j"])
allergies.add(["a", "d", "i"])
allergies.add(["a", "c", "f", "g", "h", "i", "j"])
allergies.add(["b", "d", "g"])
allergies.add(["b", "c", "f", "h", "i"])
allergies.add(["b", "e", "g", "j"])
allergies.add(["b", "c", "g", "h", "i"])
allergies.available_foods()
allergies.count_available_foods()
