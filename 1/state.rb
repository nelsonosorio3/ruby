class Test
  def initialize(f=0)
    @foo = f
  def m1
    @foo = 0
  end

  def m2(x)
    @foo += x
    @bar = 0
  end

  def foo
    @foo
  end
end

x = Test.new(3 )
y = Test.new
z = x

x.foo
x.m1
z.foo
y.foo

class Other
  Age = 28

  def self.reset_bar
    @@bar = 0
  end

  def initialize(f=0)
    @foo = f
  end

  def m2 (x)
    @foo += x
    @@bar += 1
  end

  def foo
    @foo
  end

  def bar
    @@bar
  end
end