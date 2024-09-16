#Amir Shaltami
def calculate_mean(set)
  total = set.sum
  elements = set.length
  mean = total / elements
  puts "The mean of the set is #{mean}"
end

def farenheit_to_celsius(farenheit)
  celsius = (farenheit - 32.0) * 5.0/9.0
  puts "The value #{farenheit} degrees celsius in farenheit is #{celsius} degrees farenheit"
end

  def find_largest_value 
    put "Input a set of values"
    input = gets.chomp
    set = set.new{input}
    numbers = input.split.map(&:to_i)
    largest = set.max
    puts "The largest value in the set is #{largest}"
      
    end
def fibonachi_numbers(limit)
  put "Put in the first value"
input = gets.chomp 
first = input.to_f
put "Put in the second value"
userIn = gets.chomp
second = userIn.to_f
File.open("fibonachi_numbers.txt, w") do |file|
  file.puts first  
      first, second = second, first + second  
end
end
end
def main
  
 calculate_mean ([13, 27, 45, 34, 506])
farenheit_to_celsius(86.0)