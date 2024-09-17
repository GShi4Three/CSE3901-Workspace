# Completing #1 in Category 1 using built-in methods
def squareRoot(n)
  puts "The square root of #{n} is: #{Math.sqrt(n)}"
end

def cubeRoot(n)
  puts "The cube root of #{n} is: #{Math.cbrt(n)}"
end
# Testing category 1 methods
squareRoot(16)

cubeRoot(27)

# Completing the yellow block in Category 2 using personalized methods
def factorial(n)
  # Factorial of !0 is undefined
  if (n == 0)
    puts "Can not find the factorial of zero."
  else
    counter = 1
    factorial = 1
    # Multiple each number by the last
    while(counter <= n)
      factorial = factorial * counter 
      counter += 1
    end
  end
    puts "The factorial of #{n} is #{factorial}"
end
# Multiple the number by 100 and divide to find the percentage of a value
def percentage(a,b)
  puts "The percentage #{a} is of #{b} is #{(a*100)/b}%"
end

def median(data)
  # Finds the median if the dataset is even in length
  if data.length % 2 == 0
    # Median is the average between the two values in the middle of the dataset
    median = (data[data.length / 2] + data[data.length / 2 - 1]) / 2
  # Finds the median if the dataset is odd in length
  else
    # Median is the middle value
    median = data[data.length / 2]  
  end
  puts "The median of the dataset #{data} is #{median}"
end

def prime_numbers(limit, file_name)
  # Defining a function that tests if a number is prime
  def is_prime(n)
    counter = 2
    while counter < n
      if n % counter == 0
        return false
      end
      counter += 1
    end
    return true
  end

  primes = []
  
  counter = 2
  # Using previously defined function to find each prime within a range and add it to an array
  while counter <= limit
    if is_prime(counter)
      primes << counter
    end
    counter += 1
  end
  # Write to the file
  File.open(file_name, 'w') do |file|
    primes.each { |prime| file.puts prime }
  end

  puts "Prime numbers less than #{limit} have been saved to #{file_name}."
end

# Testing functions
data = [1,2,4,6,8,9,10]

factorial(10)
percentage(1,100)
median(data)
prime_numbers(100, "prime_numbers.txt")