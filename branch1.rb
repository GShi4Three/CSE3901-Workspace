def log(base, a)
  puts "Log base #{base} of #{a} is #{Math.log(a, base)}"
end

def exponent(a, b)
  if b == 0
    result = 1
  else
    result = a
    counter = 1
    while counter < b
      result = result * a
      counter += 1
    end
  end
puts "#{a} raised to the power of #{b} equals #{result}"
end

def generateEven(lower, higher, fileName)
  if lower % 2 == 0
    lower = lower + 2
  elsif lower % 2 == 1
    lower = lower + 1
  end
  evenNumbers = [lower]
  while lower < higher
    lower = lower + 2
    evenNumbers << lower
  end

  File.open(fileName, 'w') do |file|
    evenNumbers.each { |num| file.puts num }
  end
  puts "Even numbers between #{lower} and #{higher} have been saved to #{fileName}."
end

def absolute(a)
  if a < 0
    absolute = a * -1
  else
    absolute = a
  end
  puts "The absolute value of #{a} is #{absolute}"
end


def generateSquare(lower, higher, fileName)
  squares = []
  while lower < higher
    puts lower * lower
    lower = lower + 1
  end
  File.open(fileName, 'w') do |file|
    evenNumbers.each { |num| file.puts num }
  end
end

log(2, 8)
exponent(3, 4)
absolute(-190)
absolute(190)
generateEven(15, 30, "even_numbers.txt")