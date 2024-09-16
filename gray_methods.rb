def log(base, a)
  Math.log(a) / Math.log(base)
end

def exponent(a, b)
  i = 0
  j = 1
  if b > 0
    while i < b
      j = j * a
      i = i + 1
    end
  elsif b == 0
  j = 0
  else 
    while i > b
    j = j / a
    i = i - 1
    end
  end 

end

def absolute(a)
  if a < 0
    a = a * -1
  end
  a
end

def generateEven(lower, higher)
  if lower % 2 == 0
    lower = lower + 2
  elsif lower % 2 == 1
    lower = lower + 1
  end
  while lower < higher
     puts lower
    lower = lower + 2
  end
end

def generateSquare(lower, higher)
  while lower < higher
    puts lower * lower
    lower = lower + 1
  end
end

def main
  a = 5
  b = 3
  lower = 10
  higher = 40
 
  ex =  exponent(a, b)
  ab = absolute(a)
  ev = generateEven(lower, higher)
  sq = generateSquare(lower, higher)

  puts "Exponent: #{ex}"
  puts "Absolute: #{ab}"
  puts "Even: #{ev}"
  puts "Square: #{sq}"
end 



main  # Call the main function
