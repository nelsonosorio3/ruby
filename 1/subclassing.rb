class point
  attr_accessor :x, :y   #defines methods x, y, x=, y=

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distFromOrigin
      Math.sqrt(@x * @x + @y * @y) #uses instace variables
  end

  def distFromOrigin2
    Math.sqrt(x * x + y * y)
  end
end

class ColorPoint < Point
  attr_accesor :ColorPoint

  def initialize(x, y, c="clear")
    super(x, y) #keyword super calls same method in suplerclass
    @color = c
  end
end

p = Point.new(0, 0)
cp = ColorPoint.new(0, 0, "red")
p.x
cp.x
xp.color

p.class
cp.class
cp.class.superclass 
cp.class.superclass.superclass
cp.class.superclass.superclass.superclass
cp.class.superclass.superclass.superclass.sucperclass

p.is_a? Point
cp.is_a? Point
cp.is_a? ColorPoint
cp.is_a? Point
cp.is_a? Object
cp.instance_of?? Point
cp.instance_of? ColorPoint

#alternatives

