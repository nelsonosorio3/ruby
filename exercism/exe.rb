class HelloWorld
  def self.hello
    "Hello, World!"
  end
end

class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    return EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end
  def preparation_time_in_minutes(layers)
    return layers * 2
  end
  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    return preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end

class Attendee
  def initialize(height)
    @height = height
  end
  def height
    @height
  end
  def pass_id
    @pass_id
  end
  def issue_pass!(pass_id)
    @pass_id = pass_id
  end
  def revoke_pass!
    @pass_id = nil
  end
end

class Attendee
  def initialize(height)
    @height = height
  end
  def issue_pass!(pass_id)
    @pass_id = pass_id
  end
  def revoke_pass!
    @pass_id = nil
  end
  # Do not edit above methods, add your own methods below.
  # rubocop:disable Naming/PredicateName
  def has_pass?
    !!@pass_id
  end
  # rubocop:enable Naming/PredicateName
  def fits_ride?(ride_minimum_height)
    @height >= ride_minimum_height
  end
  def allowed_to_ride?(ride_minimum_height)
    fits_ride?(ride_minimum_height) && has_pass?
  end
end

class LogLineParser
  def initialize(line)
    @line = line
  end
  def message
    new_line = @line.strip
    new_line[(new_line.index(" ")+1)..-1].strip
  end
  def log_level
    new_line = @line.strip.downcase
    new_line[1...(new_line.index("]"))].strip
  end
  def reformat
    "#{message} (#{log_level})"
  end
end


class AssemblyLine
  def initialize(speed)
    @speed = speed
  end
  def production_rate_per_hour
    items_per_hour = 221 * @speed
    if @speed < 5
      return items_per_hour
    elsif @speed < 9
      return (items_per_hour * 0.9)
    elsif @speed == 9
      return (items_per_hour * 0.8)
    elsif @speed == 10
      return (items_per_hour * 0.77)
    end
  end
  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end

module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      return -3.213
    elsif balance < 1000
      return 0.5
    elsif balance < 5000
      return 1.621
    else
      return 2.475
    end
  end
  def self.annual_balance_update(balance)
    if balance > 0
      return balance + ((interest_rate(balance)/100) * balance)
    else
    balance - ((interest_rate(balance)/100) * balance)
    end
  end
  def self.years_before_desired_balance(current_balance, desired_balance)
    count = 0
    while current_balance < desired_balance
      count += 1
      current_balance = annual_balance_update(current_balance)
    end
    count
  end
end

class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end
  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end
  def yesterday
    @birds_per_day[-2]
  end
  def total
    @birds_per_day.sum
  end
  def busy_days
    @birds_per_day.inject(0) {|acc, d| d >= 5 ? acc + 1 : acc }
  end
  def day_without_birds?
    @birds_per_day.any? { |d| d == 0}
  end
end

class BoutiqueInventory
  def initialize(items)
    @items = items
  end
  def item_names
    arr_names = @items.map { |item| item[:name]}
    arr_names.sort
  end
  def cheap
    @items.select { |item| item[:price] < 30}
  end
  def out_of_stock
    @items.select { |item| item[:quantity_by_size].count == 0 }
  end
  def stock_for_item(name)
    stock = @items.find { |item| item[:name] == name}
    stock[:quantity_by_size]
  end
  def total_stock
    subtotal = @items.map { |item| item[:quantity_by_size].sum { |k, v| v} }
    subtotal.sum
  end
  private
  attr_reader :items
end


class BoutiqueInventory
  attr_reader :items
  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
  end
  def item_names
    (@items.map { |item| item.name }).sort
  end
  def total_stock
    @items.sum { |item| item.quantity_by_size.sum {|_, v| v}}
  end
end

# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end
class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end
  def ticket_price
    @age > 59 ? 10.00 : 15.00
  end
  def watch_scary_movie?
    @age >= 18
  end
  # Popcorn is 🍿
  def claim_free_popcorn!
    if @member then "🍿" else raise NotMovieClubMemberError end
  end
end


class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError
  end
  def self.calculate(first_operand, second_operand, operation)
    if !first_operand.is_a?(Integer) || !second_operand.is_a?(Integer)
      raise ArgumentError.new()
    end
    case operation
      when "+"
        result = first_operand + second_operand
      when "/"
        begin
          result = first_operand / second_operand
        rescue => e 
          return "Division by zero is not allowed."
        end
      when "*"
        result = first_operand * second_operand
      else
        raise UnsupportedOperation.new()
    end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end



=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/two-fer` directory.
=end
class TwoFer
  def self.two_fer(name="you")
    "One for #{name}, one for me."
  end
end

=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end
class ResistorColorDuo
  @@convention = {"black" => 0, "brown" => 1, "red" => 2, "orange" => 3,
                  "yellow" => 4, "green" => 5, "blue" => 6, "violet" => 7,
                  "grey" => 8, "white" => 9}
  def self.value(arr)
    (@@convention[arr[0]] * 10) + @@convention[arr[1]]
  end
end

=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
  def self.abbreviate(phrase)
    arr = phrase.gsub("-", " ").split(" ")
    acronym = ""
    arr.each {|word| acronym += word[0].upcase}
    acronym
  end
end

=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end
class HighScores
  attr_reader :scores, :latest, :personal_best, :personal_top_three
  def initialize(arr)
    @scores = arr
    @latest = @scores[-1]
    @personal_best = @scores.max
    @personal_top_three = @scores.sort_by { |score| -score }[0..2]
  end
  def latest_is_personal_best?
    latest == personal_best
  end
end

=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  def initialize(word)
    @word = word
  end
  def word_count
    arr = @word.downcase.split(/[,\s]/)
    counts = Hash.new(0)
    arr.each do |word|
      clean = ""
      chars = word.split("")
      chars.each { |char| clean += char if char.match(/[a-z0-9']/)}
      if clean[-1] == "'"
        counts[clean[1..-2]] = counts[clean[1..-2]] + 1
      else
        counts[clean] = counts[clean] + 1
      end
    end
    counts.delete("")
    counts
  end
end

=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.size != s2.size
    count = 0
    (0...s1.size).each { |n| count +=1 unless s1[n] == s2[n]}
    count
  end
end

=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops
  def self.convert(number)
    str = ""
    str += "Pling" if number % 3 == 0
    str += "Plang" if number % 5 == 0
    str += "Plong" if number % 7 == 0
    str += number.to_s if str == ""
    str
  end
end
    
=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
class Isogram
  def self.isogram?(input)
    letters = Hash.new(0)
    chars = input.downcase.split("")
    chars.each {|char| letters[char] = letters[char] + 1 if char.match(/[a-z]/) }
    letters.all? { |key, value| value < 2}
  end
end


=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end
class Scrabble
  @@points = Hash.new(0)
  def initialize(str)
    @word = str ? str.strip.downcase.split("") : []
    ("a".."z").each do |l|
      case l 
        when /[aeioulnrst]/
          @@points[l] = 1
        when /[dg]/
          @@points[l] = 2
        when /[bcmp]/
          @@points[l] = 3
        when /[fhvwy]/
          @@points[l] = 4
        when /k/
          @@points[l] = 5
        when /[jx]/
          @@points[l] = 8
        when /[qz]/
          @@points[l] = 10
      end
    end
  end
  def self.score(str)
    if str then word = str.strip.downcase.split("") else return 0 end
    word.inject(0) { |acc, char| acc + @@points[char] }
  end
  def score
    @word.inject(0) { |acc, char| acc + @@points[char] }
  end
  
end

=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn
  def self.valid?(str)
    return false if str.match(/[^0-9\s]/)
    arr = str.split(" ")
    count = str.strip.length % 2 == 0 ? 1 : 0
    arr2 = arr.map do |set|
      set.split("").map do |d|
        count += 1
        if count % 2 == 0
          d.to_i*2 > 9 ? d.to_i*2 - 9 : d.to_i*2
        else
          d.to_i
        end
      end
    end
    summation = arr2.inject(0) { |acc, set| acc + set.sum} 
    summation % 10 == 0 &&  (summation != 0 || arr.length > 1)
  end
end


=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end
class Clock
  attr_accessor :hour, :minute
  def initialize(hash)
    @hour = hash[:hour] ? hash[:hour] : 0
    @minute = hash[:minute] ? hash[:minute] : 0
  end
  def to_s
    minutes_clean = @minute % 60
    extra_hours = (@minute / 60).floor
    hours_clean = (@hour + extra_hours) % 24
    hour_str = ""
    minute_str = ""
    minute_str = minutes_clean < 10 ? "0#{minutes_clean}" : minutes_clean.to_s
    hour_str = hours_clean < 10 ? "0#{hours_clean}" : hours_clean.to_s
    hour_str + ":" + minute_str
  end
  def +(other_clock)
      extra_hours = ((@minute + other_clock.minute) / 60).floor
      @minute = (@minute + other_clock.minute) % 60
      @hour = (@hour + other_clock.hour + extra_hours) % 24
      self
  end
  def -(other_clock)
    if @minute >= other_clock.minute
      @minute = @minute - other_clock.minute
      extra = 0
    else
      @minute = 60 + @minute - other_clock.minute
      extra = 1
    end
    if @hour >= other_clock.hour
      @hour = @hour - other_clock.hour - extra
    else
      @hour = 24 + @hour - other_clock.hour - extra
    end
    self
  end
  def ==(other_clock)
    str_other = other_clock.to_s
    minute_other = str_other[-2..-1].to_i
    hour_other = str_other[0..1].to_i
    str = to_s
    minute = str[-2..-1].to_i
    hour = str[0..1].to_i
    minute == minute_other && hour == hour_other
  end
end


=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament
  def self.tally(input)
    tally = "Team                           | MP |  W |  D |  L |  P\n"
    arr1 = input.split("\n")
    arr2 = []
    arr1.each { |data| arr2.push(data.split(";"))}
    hash = Hash.new()
    arr2.each do |team|
      hash[team[0]] = {
      "MP" => 0,
      "W" => 0,
      "D" => 0,
      "L" => 0,
      "P" => 0
    }
      hash[team[1]] = {
      "MP" => 0,
      "W" => 0,
      "D" => 0,
      "L" => 0,
      "P" => 0
    }
    end
    arr2.each do |info| 
      hash[info[0]]["MP"] = hash[info[0]]["MP"] + 1
      hash[info[1]]["MP"] = hash[info[1]]["MP"] + 1
      case info[2]
        when  "win"
          hash[info[0]]["W"] = hash[info[0]]["W"] + 1
          hash[info[0]]["P"] = hash[info[0]]["P"] + 3
          hash[info[1]]["L"] = hash[info[1]]["L"] + 1
        when "loss"
          hash[info[1]]["W"] = hash[info[1]]["W"] + 1
          hash[info[1]]["P"] = hash[info[1]]["P"] + 3
          hash[info[0]]["L"] = hash[info[0]]["L"] + 1
        when "draw"
          hash[info[0]]["D"] = hash[info[0]]["D"] + 1
          hash[info[0]]["P"] = hash[info[0]]["P"] + 1
          hash[info[1]]["D"] = hash[info[1]]["D"] + 1
          hash[info[1]]["P"] = hash[info[1]]["P"] + 1
      end
    end
    hash = hash.sort_by { |team, data| [-data["P"], team]}
    hash.each do |key, v| 
      space = ""
      (31-key.length).times {|i| space += " "}
      tally += "#{key}#{space}|  #{v["MP"]} |  #{v["W"]} |  #{v["D"]} |  #{v["L"]} |  #{v["P"]}\n"
    end
    tally
  end
end


=begin
Write your code for the 'Resistor Color' exercise in this file. Make the tests in
`resistor_color_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/resistor-color` directory.
=end
class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white]
  def self.color_code(str)
    COLORS.index(str)
  end
end
   


=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end
class Complement
  @@table ={
    "A" => "U",
    "T" => "A",
    "C" => "G",
    "G" => "C",
    "" => ""
  }
  def self.of_dna(str)
    arr = str.split("")
    complement = ""
    arr.each {|char| complement += @@table[char]}
    complement
  end
end
    


=begin
Write your code for the 'Leap' exercise in this file. Make the tests in
`leap_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/leap` directory.
=end
class Year
  def self.leap?(year)
    year % 4 == 0 && (year % 400 == 0 || year % 100 != 0)
  end
end


=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end
class Pangram
  @alphabet = Hash.new(0)
  def self.pangram?(sentence)
    ("a".."z").each { |char| @alphabet[char] = 0}
    arr = sentence.split("")
    arr.each { |char| @alphabet[char.downcase] = @alphabet[char.downcase] + 1}
    return @alphabet.all? {|k, v| v > 0}
  end
end
  

=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end
class SpaceAge
  attr_reader :on_earth, :on_mercury, :on_venus,
              :on_mars, :on_jupiter, :on_saturn,
              :on_uranus, :on_neptune
  def initialize(seconds)
    @on_earth = seconds / (60 * 60 * 24 * 365.25 )
    @on_mercury = on_earth / 0.2408467 
    @on_venus = on_earth / 0.61519726 
    @on_mars = on_earth / 1.8808158 
    @on_jupiter = on_earth / 11.862615 
    @on_saturn = on_earth / 29.447498 
    @on_uranus = on_earth / 84.016846 
    @on_neptune = on_earth / 164.79132 
  end
end



=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end
class Triangle
  def initialize(arr)
    @a = arr[0]
    @b = arr[1]
    @c = arr[2]
  end
  def invalid?  
    @a <= 0 || @b <= 0 || @c <= 0 || @a + @b <= @c || @a + @c <= @b || @b + @c <= @a
  end
  def equilateral?
    return @a == @b && @a == @c unless invalid?
    false
  end
  def isosceles?
    return @a == @b || @a == @c || @b == @c unless invalid?
    false
  end
  def scalene?
    return !isosceles? unless invalid?
    false
  end
end


=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end
class Squares
  def initialize(n)
    @n = n
  end
  def square_of_sum
    ((@n * (@n + 1)) / 2) ** 2
  end
  def sum_of_squares
    (@n * (@n+1) * (2*@n +1))/6
  end
  def difference
    square_of_sum - sum_of_squares
  end
end


=begin
Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
`armstrong_numbers_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/armstrong-numbers` directory.
=end
class ArmstrongNumbers
  def self.include?(n)
    num_arr = n.to_s.split("")
    len = num_arr.length
    sum = num_arr.inject(0) { |acc, d| acc + d.to_i**len}
    n == sum
  end
end



=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end
class FlattenArray
  def self.flatten(arr)
    flat = []
    arr.each do |element| 
      if element.is_a? Array 
        flat.concat(flatten(element)) 
      elsif element 
        flat.push(element) 
      end
    end
    flat
  end
end


=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end
class PhoneNumber
  def self.clean(str)
    arr = str.split("")
    number = ""
    arr.each { |char| number += char if char.match(/[0-9]/) }
    if number.length == 10
      if number[0].match(/[2-9]/) and number[3].match(/[2-9]/)
        return number
      else 
        return nil
      end
    elsif number.length == 11
      if number[0] == "1" and number[1].match(/[2-9]/) and number[4].match(/[2-9]/)
        return number[1..-1]
      else 
        return nil
      end
    else
      return nil
    end
  end
end


=begin
Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
`collatz_conjecture_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/collatz-conjecture` directory.
=end
class CollatzConjecture
  def self.steps(n, acc=0)
    raise ArgumentError.new() if n < 1
    if n == 1
      acc
    else
      n % 2 == 0 ? steps(n / 2, acc + 1) : steps((n * 3) + 1, acc + 1)
    end
  end
end


=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end
class Sieve
  def initialize(n)
    @n = n 
  end
  def primes
    n = @n - 2 > 0 ? @n - 2 : 0
    sqrt = Math.sqrt(@n)
    arr = Array.new(@n) { true }
    (2..sqrt).each do |i|
      if arr[i-2]
        (i**2..sqrt**2).step(i).each { |j| arr[j-2] = false}
      end
    end
    primes = (2..@n).filter { |i| arr[i-2]}
  end
end


=begin
Write your code for the 'Accumulate' exercise in this file. Make the tests in
`accumulate_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/accumulate` directory.
=end
class Array
  def accumulate
    arr = []
    self.each do |e|
      arr.push(yield e)
    end
    arr
  end
end


=begin
Write your code for the 'Strain' exercise in this file. Make the tests in
`strain_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/strain` directory.
=end
Array.class_eval do 
  def keep
    arr = []
    (0...self.length).each  do |n|
      arr.push(self[n]) if yield self[n]
    end
    arr
  end
  def discard
    arr = []
    (0...self.length).each do |n|
      arr.push(self[n]) if !yield self[n]
    end
    arr
  end
end
    
  
=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end
class BinarySearch
  def initialize(arr)
    @arr = arr
  end
  def search_for(n)
    low = 0
    high = @arr.length - 1
    mid = ((low + high) / 2).floor  
    current = @arr[mid]
    return mid if current == n
    until low >= high
      if current > n 
        high = mid
        mid = ((low + high) / 2).floor
      else
        low = mid + 1
        mid = ((low + high) / 2).floor
      end
      current = @arr[mid]
      return mid if current == n
    end
  end
end


=begin
Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
`matching_brackets_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/matching-brackets` directory.
=end
class Brackets
  @@open = {
    "[" => "]",
    "{" => "}",
    "(" => ")"
  }
  @@close = {
    "]" => "[",
    "}" => "{",
    ")" => "("
  }
  def self.paired?(str)
    arr = str.split("")
    memory = []
    arr.each do |char|
      if @@open[char]
        memory.push(char)
      elsif @@close[char]
        if memory[-1] == @@close[char]
          memory.pop
        else 
          return false
        end
      end
    end
    memory.length < 1
  end
end


=begin
Write your code for the 'Allergies' exercise in this file. Make the tests in
`allergies_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/allergies` directory.
=end
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


=begin
Write your code for the 'Beer Song' exercise in this file. Make the tests in
`beer_song_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/beer-song` directory.
=end
class BeerSong
  def self.recite(num, lines)
    str = ""
    num.downto(num-lines+1).each do |n|
      if n > 1
            str  += "\n#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{n-1} #{n-1 == 1 ? "bottle" : "bottles"} of beer on the wall.\n"
      elsif n == 1
        str += "\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
      elsif n == 0
        str += "\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      end   
    end
    str[1..-1]
  end
end



=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end
class InvalidCodonError < StandardError
end
class Translation
  @@table = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine",
    "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP"
  }
  def self.of_codon(codon)
    @@table[codon]
  end
  def self.of_rna(rna)
    raise InvalidCodonError.new() if rna.match(/[^UGAC]/)
    arr = []
    (0...rna.size).step(3).each do |n| 
      if of_codon(rna[n..n+2]) != "STOP"
        arr.push(of_codon(rna[n..n+2]))
      else
        return arr
      end
    end
    arr
  end
end


=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end
class Atbash
  @@down = (("a".."z").to_a).reverse
  def self.encode(text)
    code = ""
    count = 1
    text.split("").each do |char|
      if count % 6 == 0 && count != 0
        code += " " 
        count += 1
      end
      if char.match(/[a-z]/)
        code += @@down[char.ord - 97]
        count += 1
      elsif char.match(/[A-Z]/)
        code += @@down[char.ord - 65]
        count += 1
      elsif char.match(/[0-9]/)
        code += char
        count += 1
      end
    end
    code.strip
  end
  def self.decode(code)
    text = ""
    code.split("").each do |char|
      if char.match(/[a-z]/)
        text += @@down[char.ord - 97]
      elsif char.match(/[0-9]/)
        text += char
      end
    end
    text
  end
end


=begin
Write your code for the 'Crypto Square' exercise in this file. Make the tests in
`crypto_square_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/crypto-square` directory.
=end
class Crypto
  def initialize(text)
    @text = text
  end
  def ciphertext
    arr = @text.downcase.split("")
    normalize = ""
    arr.each {|char| normalize += char if char.match(/[a-z0-9]/)}
    l = normalize.length
    c = (l ** 0.5).ceil
    if c *  (c-1) > l
      r = c - 1
    else
      r = c
    end
    final = ""
    ((c * r) - l).times { |n| normalize += " "}
    (0...c).each do |m|
      (0...r).each do |n|
        final[n+(m*r)] = normalize[(c*n)+m]
      end
    end
    final.gsub(/(.{#{Regexp.escape(r.to_s)}})(?=.)/, '\1 ')
  end
    
end
  
list_ops.rb
=begin
Write your code for the 'List Ops' exercise in this file. Make the tests in
`list_ops_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/list-ops` directory.
=end
class ListOps
  def self.arrays(arr)
    count = 0
    arr.each { count += 1 }
    count
  end
  def self.reverser(arr)
    reversed = []
    len = arrays(arr)
    (1..len).each { |x| reversed.push(arr[-x]) }
    reversed
  end
  def self.concatter(arr1, arr2)
    len1 = arrays(arr1)
    len2 = arrays(arr2)
    (len1...(len1 + len2)).each { |x| arr1.push(arr2[x - len1]) }
    arr1
  end
  def self.mapper(arr)
    len = arrays(arr)
    (0...len).each { |x| arr[x] = yield arr[x]}
    arr
  end
  def self.filterer(arr)
    filtered = []
    len = arrays(arr)
    (0...len).each { |x| filtered.push(arr[x]) if yield arr[x]}
    filtered
  end
  def self.sum_reducer(arr)
      sum = 0
      len = arrays(arr)
      (0...len).each { |x| sum += arr[x]}
      sum
  end
  def self.factorial_reducer(arr)
      mult = 1
      len = arrays(arr)
      (0...len).each { |x| mult *= arr[x] }
      mult
  end
end



=begin
Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
`simple_linked_list_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/simple-linked-list` directory.
=end
class Element
  attr_accessor :datum, :next
  def initialize(datum)
    @datum = datum
    @next = nil
  end
end
class SimpleLinkedList
  def initialize(arr=[])
    @head = nil
    arr.each { |e| self.push(Element.new(e)) }
  end
  def push(e)
      temp = @head
      @head = e
      @head.next = temp
    self
  end
  def pop
    if @head then e = @head else return nil end
    @head = @head.next
    return e
  end
  def to_a
    arr = []
    return arr unless @head
    current = @head
    while current
      arr.push(current.datum)
      current = current.next
    end
    arr
  end
  def reverse!
    arr = []
    arr.push(pop) until !@head
    arr.each { |e| push(e) }
    self
  end
end

=begin
Write your code for the 'Pig Latin' exercise in this file. Make the tests in
`pig_latin_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/pig-latin` directory.
=end
class PigLatin
  def self.translate(word)
    words = word.split(" ")
    new_words = []
    words.each do |word|
      new_word = ""
      if word[0].match(/[aeiou]/) || word[0..1].match(/xr|yt/)
        new_word = word + "ay"
      elsif word.length == 2 && word[1] = "y"
        new_word = "y" + word[0] + "ay"
      elsif word[0..1].match(/rh/) and word[2] == "y"
        new_word = word[2..-1] + word[0..1] + "ay"
      elsif word[0..2].match(/thr|sch/)
        new_word = word[3..-1] + word[0..2] + "ay"
      elsif word[0..1].match(/ch|qu|th/)
        new_word = word[2..-1] + word[0..1] + "ay"
      elsif word[0].match(/[qwrtypsdfghjklzxcvbnm]/)
        if word[1..2] == "qu"
          new_word = word[3..-1] + word[0..2] + "ay"
        else
          new_word = word[1..-1] + word[0] + "ay"
        end
      end
      new_words.push(new_word)
    end
    new_words.join(" ")
  end
end
      
=begin
Write your code for the 'Roman Numerals' exercise in this file. Make the tests in
`roman_numerals_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/roman-numerals` directory.
=end
class Integer
  @@roman = {
    1 => "I", 4 => "IV", 5 => "V", 9 => "IX",
    10 => "X", 40 => "XL", 50 => "L", 90 => "XC",
    100 => "C", 400 => "CD", 500 => "D", 900 => "CM",
    1000 => "M"
  }
  def to_roman
    num = self
    roman = ""
    until num < 1
      r_num = @@roman.keys.select { |r| r<=num }
      roman += @@roman[r_num[-1]]
      num -= r_num[-1]
    end
    roman
  end
end


=begin
Write your code for the 'Rotational Cipher' exercise in this file. Make the tests in
`rotational_cipher_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/rotational-cipher` directory.
=end
class RotationalCipher
  def self.rotate(str, n)
    arr1 = str.split("")
    arr2 = []
    arr1.each do |char|
      
      if char.ord > 96 && char.ord < 123
        code = char.ord - 97
        shift = (code + n) % 26
        new_code = 97 + shift 
      elsif char.ord > 64 && char.ord < 91
        code = char.ord - 65
        shift = (code + n) % 26
        new_code = 65 + shift
      else
        new_code = char.ord
      end
      
      arr2.push(new_code.chr)
    end
    arr2.join()
  end
end

=begin
Write your code for the 'Kindergarten Garden' exercise in this file. Make the tests in
`kindergarten_garden_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/kindergarten-garden` directory.
=end
class Garden
  @@convention = {
    "V" => :violets,
    "C" => :clover,
    "R" => :radishes,
    "G" => :grass
  }
  def initialize(garden, students=["Alice", "Bob", "Charlie", "David", "Eve",
                                  "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
                                  "Kincaid", "Larry", "Patricia", "Roger", "Samantha", "Xander"])
    @garden = garden
    @index = garden.index("\n")
    @students = students.sort
  end
  def get_garden(i)
    garden = []
    (0..1).each { |n| garden.push(@@convention[@garden[n + (i*2)]])}
    (1..2).each { |n| garden.push(@@convention[@garden[@index + n + (i*2)]])}
    garden
  end
  def get_order(name)
    @students.find_index(name)
  end
  def alice
    get_garden(get_order("Alice"))
  end
  def bob
    get_garden(get_order("Bob"))
  end
  def charlie
    get_garden(get_order("Charlie"))
  end
  def david
    get_garden(get_order("David"))
  end
  def eve
    get_garden(get_order("Eve"))
  end
  def fred
    get_garden(get_order("Fred"))
  end
  def ginny
    get_garden(get_order("Ginny"))
  end
  def harriet
    get_garden(get_order("Harriet"))
  end
  def ileana
    get_garden(get_order("Ileana"))
  end
  def joseph
    get_garden(get_order("Joseph"))
  end
  def kincaid
    get_garden(get_order("Kincaid"))
  end
  def larry
    get_garden(get_order("Larry"))
  end
  def patricia
    get_garden(get_order("Patricia"))
  end
  def roger
    get_garden(get_order("Roger"))
  end
  def samantha
    get_garden(get_order("Samantha"))
  end
  def xander
    get_garden(get_order("Xander"))
  end
end
   

=begin
Write your code for the 'Prime Factors' exercise in this file. Make the tests in
`prime_factors_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/prime-factors` directory.
=end
class PrimeFactors
  def self.of(n)
    arr = []
    count = 1
    until n == 1
      count += 1
      if n % count == 0
        arr.push(count)
        n /= count
        count -=1
      end
    end
    arr
  end
end

=begin
Write your code for the 'Custom Set' exercise in this file. Make the tests in
`custom_set_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/custom-set` directory.
=end
class CustomSet
  attr_reader :set
  def initialize(arr)
    @set = arr
  end
  def member?(e)
    @set.each { |x| return true if x == e }
    false
  end
  def empty?
    @set.length == 0
  end
  def subset?(set2)
    @set.all? { |x| set2.member?(x) }
  end
  def disjoint?(set2)
    @set.all? { |x| !set2.member?(x) }
  end
  def ==(set2)
    subset?(set2) && set2.subset?(self)
  end
  def add(x)
    @set.push(x)
    self
  end
  def intersection(set2)
    arr = []
    @set.each { |x| arr.push(x) if set2.member?(x) }
    CustomSet.new(arr)
  end
  def difference(set2)
    arr = []
    @set.each { |x| arr.push(x) if !set2.member?(x) }
    CustomSet.new(arr)
  end
  def union(set2)
    arr = []
    @set.each { |x| arr. push(x) if !set2.member?(x) }
    arr.concat(set2.set)
    CustomSet.new(arr)
  end
end


=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end
class Node
  attr_accessor :data, :next, :prev
  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end
class Deque
  def initialize
    @head = nil
    @end = nil
    @length = 0
  end
  def push(e)
    @length += 1
    @head = Node.new(e) unless @head
    current = @head
    current = current.next until !current.next
    current.next = Node.new(e) if @length >1
    current.next.prev = current if current.next
    @end = current.next
    self
  end
  def pop
    @length -= 1
    if @end
      temp = @end
      @end = temp.prev if temp
      @end.next = nil if @end
      return temp.data
    else
      temp = @head
      @head = nil
      return temp.data
    end
  end
  def shift
    @length -= 1
    temp = @head ? @head : @end
    @head = temp.next if temp
    @head.prev = nil if @head
    temp.data
  end
  def unshift(e)
    @length += 1
    temp = @head
    @head = Node.new(e)
    temp.prev = @head if temp
    @head.next = temp
    @end = temp
    self
  end
end


=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end
class IsbnVerifier
  def self.valid?(str)
    arr = str.split("")
    clean = ""
    arr.each { |char| clean += char if char.match(/[0-9X]/)}
    return false if clean.length != 10 || (clean.match(/X/) && clean[-1] != "X")
    sum = 0
    (0...10).each { |n| sum += clean[n] == "X" ? 10 * (10 - n) : clean[n].to_i * (10 - n)}
    sum % 11 == 0
  end
end


=begin
Write your code for the 'Complex Numbers' exercise in this file. Make the tests in
`complex_numbers_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/complex-numbers` directory.
=end
class ComplexNumber
  attr_reader :real, :imaginary
  def initialize(real=0, imaginary=0)
    @real = real
    @imaginary = imaginary
  end
  def *(other_number)
    a = @real * other_number.real
    b = @real * other_number.imaginary
    c = @imaginary * other_number.real
    d = (-1)*(@imaginary * other_number.imaginary)
    @imaginary = b + c
    @real = a + d
    self
  end
  def +(other_number)
    @real += other_number.real 
    @imaginary += other_number.imaginary
    self
  end
  def -(other_number)
    @real -= other_number.real
    @imaginary -= other_number.imaginary
    self
  end
  def /(other_number)
    num1 = (@real * other_number.real) + (@imaginary * other_number.imaginary)
    num2 = (@imaginary * other_number.real) - (@real * other_number.imaginary)
    den = (other_number.real**2) + (other_number.imaginary**2)
    @real = num1 * (den**(-1))
    @imaginary = num2 * (den**(-1))
    self
  end
  def abs
    ((@real**2) + (@imaginary**2))**(0.5)
  end
  def conjugate
    @imaginary *= -1
    self
  end
  def exp
    @real = Math::E**@real * Math.cos(@imaginary) 
    @imaginary = Math::E**@real * Math.sin(@imaginary)
    self
  end
  def ==(other_number)
    delta = 0.000000001
    @real < other_number.real + delta && @real > other_number.real - delta && @imaginary < other_number.imaginary + delta && @imaginary > other_number.imaginary - delta
  end
end
    

=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end
require 'date'
class Meetup
  @@days = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }
  def initialize(month, year)
    @month = month
    @year = year
  end
  def day(name, date)
    day = @@days[name]
    case date
      when :teenth
        data = Date.new(@year, @month, 13)
        diff = data.wday - day
        d = diff > 0 ? 20 - diff : 13 + diff.abs
        return Date.new(@year, @month, d)  
      when :first
        data = Date.new(@year, @month, 1)
        diff = data.wday - day
        d = diff > 0 ? 8 - diff : 1 + diff.abs
        return Date.new(@year, @month, d)  
      when :second
        data = Date.new(@year, @month, 8)
        diff = data.wday - day
        d = diff > 0 ? 15 - diff : 8 + diff.abs
        return Date.new(@year, @month, d)
      when :third
        data = Date.new(@year, @month, 15)
        diff = data.wday - day
        d = diff > 0 ? 22 - diff : 15 + diff.abs
        return Date.new(@year, @month, d)
      when :fourth
        data = Date.new(@year, @month, 22)
        diff = data.wday - day
        d = diff > 0 ? 29 - diff : 22 + diff.abs
        return Date.new(@year, @month, d)
      when :last
        data = Date.new(@year, @month, -1)
        diff = data.wday - day
        d = diff >= 0 ? data.day - diff : (data.day - 7) + diff.abs
        return Date.new(@year, @month, d)
    end
  end
end


=begin
Write your code for the 'Pascals Triangle' exercise in this file. Make the tests in
`pascals_triangle_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/pascals-triangle` directory.
=end
class Triangle
  def initialize(r)
    @r = r
  end
  def factorial(n)
    if n == 0
      1
    else
      n * factorial(n-1)
    end
  end
  def n_choose_m(n, m)
    factorial(n) / ((factorial(n - m)) * (factorial(m)))
  end
  def row(n)
    arr = []
    (0..n).each {|m| arr.push(n_choose_m(n,m))}
    arr
  end
  def rows
    arr = []
    (0...@r).each do |n|
      arr.push(row(n))
    end
    arr
  end
end
    

=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end
class Microwave
  def initialize(time)
    @time = time
  end
  def timer
    time = @time.to_s
    case time.length
      when 1
        return "00:0#{time}"
      when 2
        tens = @time.to_s[-2]
        if tens.to_i < 6
          return "00:#{time}"
        else
          seconds = @time % 60 > 9 ? "#{@time % 60}" : "0#{@time % 60}"
          return "01:#{seconds}"
        end
      when 3
        tens = time[-2]
        if tens.to_i < 6
          return "0#{time[0]}:#{time[1..2]}"
        else 
          seconds = time[1..2].to_i % 60
          seconds = seconds > 9 ? seconds.to_s : "0#{seconds}"
          minutes = time[-3].to_i + 1
          minutes = minutes > 9 ? minutes.to_s : "0#{minutes}"
          return "#{minutes}:#{seconds}"
        end
      when 4
        return "#{time[0..1]}:#{time[2..3]}"
    end
  end
end


=begin
Write your code for the 'Darts' exercise in this file. Make the tests in
`darts_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/darts` directory.
=end
class Darts
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
  def score
    sum_squares = x**2 + y**2
    if sum_squares <= 1
      return 10
    elsif sum_squares <= 25
      return 5
    elsif sum_squares <= 100
      return 1
    else
      return 0
    end
  end
end


=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end
class Bst
  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
  def insert(e)
    if e > data
      if right
        @right.insert(e)
      else
        @right = Bst.new(e)
      end
    elsif e <= data
      if left
        @left.insert(e)
      else
        @left = Bst.new(e)
      end
    end
    self
  end
  def each(&block)
    return to_enum(:each) unless block_given?
    if !left && !right
      yield self.data
    elsif left && !right
      left.each &block
      yield self.data
    elsif !left && right
      yield self.data
      right.each &block   
    else
      left.each &block
      yield self.data
      right.each &block 
    end
  end
end

=begin
Write your code for the 'Grains' exercise in this file. Make the tests in
`grains_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/grains` directory.
=end
class Grains
  
  def self.square(n)
    raise ArgumentError.new() if n < 1 || n > 64
    if n == 1
      1
    else
      2 * self.square(n-1)
    end
  end
  def self.total
    (1..64).sum { |n| square(n)}
  end
end


=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end
class PerfectNumber
  def self.get_factors(n)
    arr = []
    (1...n).each { |m| arr.push m if n % m == 0}
    arr
  end
  def self.classify(n)
    raise RuntimeError if n < 1
    if get_factors(n).sum > n 
      return "abundant"
    elsif get_factors(n).sum < n
      return "deficient"
    else  
      return "perfect"
    end
  end
end

=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  attr_reader = :rows
  def initialize(str)
    @str = str
  end
  def rows
    @str.split("\n").map { |row| row.split(" ").map {|s| s.to_i} } 
  end
  def columns
    (0...rows.size).map { |i| rows.map { |row| row[i]}}
  end
end
  


=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  def initialize(str)
    @str = str.downcase.strip
    @arr = @str.split("")
    @hash = Hash.new(0)
    @arr.each { |char| @hash[char] = @hash[char] + 1 }
  end
  def match(words)
    arr = []
    words.each do |word| 
      clean_word = word.downcase.strip
      next if clean_word == @str
      new_hash = @hash.clone
      clean_word.split("").each do |char| 
        new_hash[char] = new_hash[char] - 1
        break if new_hash[char]  == -1
      end
      arr.push(word) if new_hash.values.sum == 0
    end
    arr
  end
end

=begin
Write your code for the 'Largest Series Product' exercise in this file. Make the tests in
`largest_series_product_test.rb` pass.
 
To get started with TDD, see the `README.md` file in your
`ruby/largest-series-product` directory.
=end
class Series
  def initialize(num)
    @num = num
    @arr = num.split("")
  end
  def largest_product(x)
    raise ArgumentError if @num.match(/[^0-9]/) || @num.size < x || x < 0
    product = 0
    (x..@arr.size).each do |n|
      mult = (n-x...n).inject(1) { |acc, m| acc * @arr[m].to_i }
        product = mult if mult > product
    end
    product
  end
end
