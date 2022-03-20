class Hello

  def my_first_method
    puts "Hello, world!"
  end
end

x = Hello.new
x.my_first_method

class A

  def m1
    34
  end

  def m2 (x, y)
    z = 7
    if x > y
      false
    else
      x + y * z
    end
  end

end

a = A.new

a.m1
a.m2(3, 5)

class B
  def m1
    4
  end

  def m3 x
    x.abs * 2 + self.m1
  end
end

b = B.new

puts b.m3(3)

class C 
  def m1
    print "hi"
    self
  end
  def m2
    print "bye"
    self
  end
  def m3
    print "\n"
    self
  end
end


class IsbnVerifier
  def self.valid?(str)
    arr = str.split("")
    clean = ""
    arr.each { |char| clean += char if char.match(/[0-9X]/)}
    sum = 0
    (0...10).each { |n| sum += clean[n] == "X" ? 10 * (10 - n) : clean[n].to_i * (10 - n)}
    sum % 11
  end
end

puts IsbnVerifier.valid?("3-598-21508-9")

test = @garden[0]
test2 = @garden[1]
test3 = @garden[@index + 1]
test4 = @garden[@index + 2]
[@@convention[test], @@convention[test2], @@convention[test3], @@convention[test4]]

