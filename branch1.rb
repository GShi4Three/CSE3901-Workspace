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

def factorial(a)
  i = 1
  j = 1
  while i < a
    i = i + 1
    j = j * i
  end
  j
end

def is_prime(a)
  i = 2
  while i < a
    if a % i == 0
      return false
    end
    i = i + 1
  end
  true
end