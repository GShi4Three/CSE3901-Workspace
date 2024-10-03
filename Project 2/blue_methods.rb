# Amir Shaltami
# Category 1 Convert a decimal number to binary, octal, or hexadecimal.
#convert a decimal base number to binary
def convert_to_binary(n)
  puts "The decimal number #{n} converted to binary is #{n.to_s(2)}."
end
#converts decimanl number to an octal number 
def convert_to_octal(n)
  puts "The decimal number #{n} converted to octal is #{n.to_s(8)}."
end
#converts a decimal number to a hexadecimal number
def convert_to_hexadecimal(n)
  puts "The decimal number #{n} converted to hexadecimal is #{n.to_s(16)}."
end

# Category 2 Blue methods
def mean(data)
  sum = data.sum # gets the sum of all the numbers 
  elements = data.length #gets the length of all the numbers in the set
  mean = sum / elements # calculates the mean by adding up the sum and dividing by the number of elements
  puts "The mean of the set is #{mean}."
end

def maximum(data)
  max = data[0] # Sets the max value at the 0 index
  counter = 1 #creates the counter
  while counter < data.length #insturcts the counter to keep iterating till it exceeds the max
    if data[counter] > max #compares the next index to see if it is greater than the previous index
      max = data[counter]# sets a new max vaue if found after incrementing
    end
    counter += 1 #increments the counter
  end
  puts "The largest value in the set is #{max}." #prints to the user that the max is thus
end

def fibonacci_numbers(limit, file_name)
  sequence = [] #intializes an empty array
  a = 0 # creates the number for the first part of the sequences
  b = 1 # creates the number for the second part of the sequences
  while a <= limit #loop to generate numbers until the limit is exceeded
    
    sequence << a # Append the current number 'a' to the sequence
    previous_a = a
    a = b #Updates A to the next number in the sequence
    b = previous_a + b # updates b as the sum of the previous 2
  end
  File.open(file_name, 'w') do |file|  # Open a file in write mode to save the Fibonacci sequence
    sequence.each { |num| file.puts num }
  end
  puts "Fibonacci numbers up to #{limit} have been saved to #{file_name}." # Output a message indicating where the Fibonacci numbers have been saved
end

def farenheit_to_celsius(farenheit)
  celsius = (farenheit - 32.0) * 5.0/9.0 #converts farenheit value to celsius
  puts "The value #{farenheit} degrees farenheit in celsius is #{celsius.round(2)} degrees celsius" #prints out the value to user
end

# Calling each method to test if they work properly
convert_to_binary(-52)
convert_to_binary(0)
convert_to_binary(50)

convert_to_octal(-111)
convert_to_octal(0)
convert_to_octal(100)

convert_to_hexadecimal(-220)
convert_to_hexadecimal(0)
convert_to_hexadecimal(200)


set1 = [13, 27, 45, 34, 506]
set2 = [-13, 10027, 245, 0, 1]

mean(set1)
mean(set2)
maximum(set1)
maximum(set2)

fibonacci_numbers(1000, "fibonacci_numbers.txt")

farenheit_to_celsius(-54.0)
farenheit_to_celsius(0)
farenheit_to_celsius(87.0)