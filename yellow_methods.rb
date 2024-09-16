# Completing #1 in Category 1 using built-in methods
def squareRoot(n)
  puts "The square root of #{n} is: #{Math.sqrt(n)}"
end

def cubeRoot(n)
  puts "The cube root of #{n} is: #{Math.cbrt(n)}"
end

squareRoot(16)

cubeRoot(27)

# Completing the yellow block in Category 2 using personalized methods
def factorial(n)
  if (n == 0)
    puts "Can not find the factorial of zero."
  else
    counter = 1
    while(counter <= n)
      factorial = factorial * counter 
      counter += 1
    end
  end
    puts "The factorial of #{n} is #{factorial}"
end

factorial(5)