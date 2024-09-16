# Amir Shaltami
# Category 1 Convert a decimal number to binary, octal, or hexadecimal.
def convert_to_binary(n)
  puts "The decimal number #{n} converted to binary is #{n.to_s(2)}."
end

def convert_to_octal(n)
  puts "The decimal number #{n} converted to octal is #{n.to_s(8)}."
end

def convert_to_hexadecimal(n)
  puts "The decimal number #{n} converted to hexadecimal is #{n.to_s(16)}."
end

# Category 2 Blue methods
def mean(data)
  sum = data.sum
  elements = data.length
  mean = sum / elements
  puts "The mean of the set is #{mean}."
end

def maximum(data)
  max = data[0]
  counter = 1
  while counter < data.length
    if data[counter] > max
      max = data[counter]
    end
    counter += 1
  end
  puts "The largest value in the set is #{max}."
end

def fibonacci_numbers(limit, file_name)
  sequence = []
  a = 0
  b = 1
  while a <= limit
    # Using the shovel operator to append to the array
    sequence << a
    previous_a = a
    a = b
    b = previous_a + b
  end
  File.open(file_name, 'w') do |file|
    sequence.each { |num| file.puts num }
  end
  puts "Fibonacci numbers up to #{limit} have been saved to #{file_name}."
end

def farenheit_to_celsius(farenheit)
  celsius = (farenheit - 32.0) * 5.0/9.0
  puts "The value #{farenheit} degrees farenheit in celsius is #{celsius.round(2)} degrees celsius"
end

convert_to_binary(50)
convert_to_octal(100)
convert_to_hexadecimal(200)

set = [13, 27, 45, 34, 506]

mean(set)
maximum(set)
fibonacci_numbers(1000, "fibonacci_numbers.txt")
farenheit_to_celsius(87.0)