class ExpressionEvaluator
  # JT Vendetti
  # Method for addition
  def add(a, b)
    a + b
  end

  # Method for subtraction
  def subtract(a, b)
    a - b
  end

  # Method for multiplication
  def multiply(a, b)
    a * b
  end

  # Method for division
  def divide(a, b)
    if b == 0
      raise "Error: Undefined, cannot divide by zero."
    else
      a / b
    end
  end

  # Method for modulus
  def modulus(a, b)
    a % b
  end

  # Operator precedence
  # Amir Shaltami
  def evaluate_expression(expression)
    # Parenthesis first
    while expression.include?('(')
      # Make a recursive call on expressions inside of parenthesis to calculate them first
      expression = expression.gsub(/\(([^()]+)\)/) { evaluate_expression($1) }
    end

   # Multiplication, division, and modulus next
   # Gavin Shi
   # Split the expression up based on multiplication,division or modulus operators and store into an array
    tokens = expression.split(/(\*|\/|%)/).map(&:strip)
    i = 0
    while i < tokens.size
      # Calculate each operation in the expression and convert from a string to an integer
      if tokens[i] == '*'
        result = multiply(tokens[i-1].to_f, tokens[i+1].to_f)
        tokens[i-1..i+1] = result
      elsif tokens[i] == '/'
        result = divide(tokens[i-1].to_f, tokens[i+1].to_f)
        tokens[i-1..i+1] = result
      elsif tokens[i] == '%'
        result = modulus(tokens[i-1].to_i, tokens[i+1].to_i)
        tokens[i-1..i+1] = result
      else
        i += 1
      end
    end

    # Addition and subtraction last
    # Khaled Saleh
    # Split the expression up based on addition or subtraction operators and store into an array
    tokens = tokens.join.split(/(\+|\-)/).map(&:strip)
    result = tokens[0].to_f
    i = 1
    while i < tokens.size
      if tokens[i] == '+'
        result = add(result, tokens[i+1].to_f)
      elsif tokens[i] == '-'
        result = subtract(result, tokens[i+1].to_f)
      end
      i += 2
    end

    result
  end
end
# Testing the functions
def main
  puts "Please enter an expression: "
  expression = gets.chomp
  evaluator = ExpressionEvaluator.new
  result = evaluator.evaluate_expression(expression)

  puts "The result of the expression '#{expression}' is: #{result}"
end

main