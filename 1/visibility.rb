#arrt_reader 
#attr_accessor
#attr_writer

#protected
#private
#public

class MyRational
  def initialize(num, den=1)
    if den ==0
      raise "MyRational received an inappropiate argument"
    elsif den < 0
      @num = - num
      @den = -den
    else
      @num = num
      @den = den
    end
    reduce
  end

  def to_s
    ans = @num.to_s
    if @den != 1
      ans += "/"
      ans += @den.to_s
    end
    ans
  end

  def to_s2
    dens = ""
    dens = "/" + @den.to_s if @den != 1
    @num.to_s + dens
  end

  def to_s3
    "#{@num}#{if @den==1 then "" else "/" + @den.to_s end}"
  end

  def add!(r)
    a = r.num
    b = r.dem
    c = @num
    d = @den
    @num = (a * d) + (b * c)
    @den = b * def
    reduce
    self
  end

  def + r 
    ans = MyRational.new(@num, @den)
    ans.add! r
    ans
  end

  protected

    def num
      @num
    end

    def den
      @den
    end

  private

    def gcd(x, y)
      if x == y
        x
      elsif x < y
        gcd(x, y-x)
      else
        gcd(y, x)
      end
    end

    def reduce
      if @num == 0
        @den = 1
      else
        d = gcd(@num.abs, @den)
        @num = @num /  d
        @den = @den / d
      end
    end
end
