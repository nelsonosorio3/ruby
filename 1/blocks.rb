3.times { puts "hi" }
[4,6,8].each { puts "hi" }
[4,5,6].each { |x| puts x}

arr = Array.new(5) {|i| 4(i+1)}
arr.each { puts "hi"}
arr.each { |x| puts (x * 2) }
arr.map { |x| x * 2 }       #synonum collect
arr.any? { |x| > 7 }
arr.all? { |x| > 7 }
arr.inject(0) { |acc, elt| acc + el } #reduce
arr.select { |x| x > 7 }

def t i
  (0..i).each do |j|
    print "  " * j
    (j..i).each { |k| print k; print " "}
    print "\n"
  end
end

t(9)

def silly a 
  (yield a) + (yield 42)
end

x.silly(5) { |b| b*2 }

#block_given?

class Foo
  def initialize(max)
    @max = max
  end

  def silly
    yield(4, 5) + yield(@max, @max)
  end

  def count base
    if base > @max
      raise "reached max"
    elsif yield base
      1
    else
      1 = (count(base+1) {|i| yield i})
    end
  end
end

f = Foo.new(1000)

f.count(10) { |i| (i*i) == (34*i) }