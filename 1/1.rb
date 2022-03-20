def factorial(n)
  if n == 0
    1
  else
    n * factorial(n-1)
  end
end

puts factorial(6)
def n_choose_m(n, m)
  factorial(n) / ((factorial(n - m)) * (factorial(m)))
end

puts n_choose_m(6,3)

class Luhn
  def self.valid?(str)
    return false if str.match(/[^0-9\s]/)
    arr = str.split(" ")
    arr2 = arr.map do |set|
      count = 0
      set.split("").map do |d|
        count += 1
        if count % 2 == 0
          d.to_i*2 > 9 ? d.to_i*2 - 9 : d.to_i*2
        else
          d.to_i
        end
      end
    end
    arr2.inject(0) { |acc, set| acc + set.sum} 
  end
end

puts Luhn.valid?("4539 3195 0343 6467")

class Sieve
  def initialize(n)
    @n = n 
  end

  def primes
    n = @n - 2 > 0 ? @n - 2 : 0
    sqrt = Math.sqrt(@n)
    arr = Array.new(@n) { true }
    (2..sqrt).each do |i|
      if arr[i]
        (i**2..sqrt**2).step(i).each { |j| arr[j-2] = false}
      end
    end
    primes = (2..@n).filter { |i| arr[i-2]}
  end
end

test = Sieve.new(49).primes
puts test

class Allergies
  @@table = {
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }
  def initialize(n)
    @n = n 
  end
  def allergic_to?(str)
    score = @n
    str_score = @@table[str]
    while score > 0
      if str_score > score
        return false
      elsif str_score == @n 
        return true 
      end
      possible = @@table.select { |k, v| v <= score }
      return true if possible.keys[-1] == str
      score -= possible.values[-1]    
    end
  end
  def list
    arr = []
    current = @n < 256 ? @n : @n - 256*((@n/256).floor)
    until current == 0
      possible = @@table.select { |k, v| v <= current }
      arr.push(possible.keys[-1])
      number = possible.values[-1]
      current -= number
    end
    arr
  end
end

allergies = Allergies.new(2045)
puts allergies.list.sort