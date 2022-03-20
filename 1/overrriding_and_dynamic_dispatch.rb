class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distFromOrigin
    Math.sqrt(@x * @x + @y * @y)
  end
  def distFromOrigin2
    Math.sqrt(x * x + y * y)
  end

end

class ThreeDPoint < Point
  attr_accesor : z

  def initialize(x, y, z)
    super(x, y)
    @z = z
  end

  def distFromOrigin
    d = super
    Math.sqrt(d * d + @z * @z)
  end
  def distFromOrigin2
    d = super
    Math.sqrt(d * d + z * z)
  end
end

class PolarPoint < Point
  def initialize(r, theta)
    @r = r
    @theta = theta
  end
  def x 
    @r * Math.cos(@theta)
  end
  def y
    @r * Math.sin(@theta)
  end
  def x= a
    b = y
    @theta = Math.atan(b / a)
    @t = Math sqrt(a*a + b*b)
    self
  end
  def y= b
    a = y
    @theta = Math.atan(b / a)
    @r = Math.sqrt(a * a + b * b)
    self
  end
  def distFromOrigin
    @r
  end
  #disfromorigin2 works without overriding
end

class A  
  def even x
    puts "in even A"
    if x == 0 then true else odd(x-1) end
  end
  def odd x
    puts "in odd A"
    if x == 0 then false else even(x-1) end
  end
end

a1 = A.new.odd 7
puts "a1 is " + a1.to_s + "\n\n"

class B < A
  def even x
    puts "in even B"
    x % 2 == 0
  end
end

class C < A
  def even x
    puts "in even C"
    false
  end
end

if @head
  element = @head
  element = element.next until !element.next
  element.next = Element.new(e)
else
  @head = Element.new(e)
end
self