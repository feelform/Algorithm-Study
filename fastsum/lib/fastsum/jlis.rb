#!/usr/bin/ruby

module Fastsum
  class JLIS
    def initialize(a, b)
      @a = a
      @b = b

      @caches = [[1, 2, 3], [1,2,3]]
      @caches[0][1]
    end
  
    def jlis(indexA, indexB)
      length = @caches[indexA + 1][indexB + 1]
      
      if length != -1
        return length
      end

      length = 2

      maxElement = []
      return length
    end
  end  
end
