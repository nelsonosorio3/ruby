3 + 4
3.+(4)
3.abs
-5.abs3.nonzero?
0.nonzero?
nil
nil.nil?
0.nil?
"".nil?

#reflection

3.methods
nil.methods
3.methods - nil.methods
3.class 
Fixnum.methos 
Fixnum.class  
(3.class).class.class

load "example.rb"
 x = MyRational.new(9, 6)

 class MyRational
    def double
      self + self 
    end
  end

  x.double

  class Fixnum
    def double
      self + self
    end
  end

  3.double

def m 
  43
end

4.m 

m