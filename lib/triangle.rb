class Triangle
  class TriangleError < StandardError
  end
  
  def initialize(a,b,c)
    @sides = [a,b,c].sort
    raise TriangleError if @sides.any?(&:zero?) || @sides.any?(&:negative?)
    raise TriangleError if @sides[0] + @sides[1] <= @sides[2]
  end
  
  def kind
    return :equilateral if @sides.uniq.length == 1
    return :isosceles if @sides.uniq.length == 2
    return :scalene if @sides.uniq.length == 3
  end
end

