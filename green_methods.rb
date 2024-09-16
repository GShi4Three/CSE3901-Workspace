
# Category 1 Methods - 


def sin(n)

    # Assuming user-supplied parameter (n) is in degrees

    # Converting from degrees to radians to be passed into built in function

    radians_val = n * (Math::PI / 180)

    return Math.sin(radians_val)

end

def cos(n)

    # Assuming user-supplied parameter (n) is in degrees

    # Converting from degrees to radians to be passed into built in function

    radians_val = n * (Math::PI / 180)

    return Math.cos(radians_val)

end

def tan(n)

    # Assuming user-supplied parameter (n) is in degrees

    # Converting from degrees to radians to be passed into built in function

    radians_val = n * (Math::PI / 180)

    return Math.tan(radians_val)

end

# Category 2 Methods - 


def is_prime(n)


    # Edge Case: 0 and 1 are prime numbers
    return false if n <= 1

    # Edge Case: 2 is a prime number
    return true if n == 2

    
    # Iterate from 2 up to square root of n
    for i in 2..Math.sqrt(n)
        # if n is divisible by that number, it's not prime
        if n % i == 0
            return false
        end
    end
    
    # If made it to this point in execution, then that means n was only divisible by 1 and itself, meaning it is a prime number
    return true

end




def minimum(data)

# Method assumes that data variable belongs to an array


# Edge case - if no elements are in input array
return nil if data.empty?

# Set minimum value to the first element in input array
min_val = data.first

# Iterate through data array
data.each do |value|
    # If value is smaller than min_val, set min_val to that value
    if value < min_val
        min_val = value
    end
end

# return min_val
return min_val

end

def generate_odd_values(file_name, start_list, end_list)

    # Open file for writing
    File.open(file_name, 'w') do |file|

    # Iterate through the range: (start, end) inclusive
    while start_list <= end_list
        # If value is odd, then write that value to the file
        if start_list % 2 == 1
            file.puts(start_list)
        end
        start_list+=1
    end
end

end



def mode(data)

# Method assumes that data variable belongs to an array 

# Edge case - if no elements are in input array
return nil if data.empty?


# Initialize an empty hash map
hash_map = Hash.new(0)

# Get occurrence of values within input array
data.each do |value|
    hash_map[value] += 1
end

# Find the mode in hash map
highest_occuring_val = hash_map.max_by { |key, value| value }

# return mode
return highest_occuring_val[0]

end


# Testing validity of methods, will delete later
def main

    data = [1,2,2,2,3,4]

    val = mode(data)

    min = minimum(data)

    num = is_prime(49)

    sin_val = sin(60)

    cos_val = cos(60)

    tan_val = tan(60)

    puts "Mode Value: #{val}"

    puts "Min Value: #{min}"

    puts "Is it prime? #{num}"

    puts "Sin function: #{sin_val}"

    puts "Cos function: #{cos_val}"

    puts "Tan function: #{tan_val}"
end


main


