require 'tk'
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

# GUI created using TK library
# Khaled Saleh

# Initializes main application window, which sets the title of window to ruby calculator
root = TkRoot.new { title "Ruby Calculator" }
# Sets the window to 800 pixels wide and 200 pixels tall
root.geometry("800x200")

# Font definitions: label, button, and entry fields are all of size 24 points
label_font = TkFont.new('size' => 24)
button_font = TkFont.new('size' => 24)
entry_font = TkFont.new('size' => 24)

# Creates new label widget attached to the main window, which has text displayed in label, of the font specified above, 
# positions label within the window, padx, and pady add padding around label, and side left aligns it with left side of window
TkLabel.new(root) do
  text 'Enter expression:'
  font label_font
  pack { padx 15; pady 15; side 'left' }
end

# Creates entry widget for user input, which has set the entry field to accomodate 30 characters and positions the entry field in the same way as the label
input = TkEntry.new(root) do
  font entry_font
  width 30
  pack { padx 15; pady 15; side 'left' }
end

# Creates a label for displaying result of evaluation
result_label = TkLabel.new(root) do
  text 'Result:'
  font label_font
  pack { padx 15; pady 15; side 'left' }
end

# Initializes an instance of the ExpressionEvaluator class which is responsible for evaluating mathematical expressions
evaluator = ExpressionEvaluator.new

# Creates a button within main window, command proc defines what happens when button is clicked in which the text is received from the entry field and is evaluated by using the evaluator instance, and this is all enclosed within begin ... rescue .... block which is ruby's version of a try and catch block
# result label is updated with the evaluated result
TkButton.new(root) do
  text 'Evaluate'
  command proc {
    begin
      expression = input.get
      result_value = evaluator.evaluate_expression(expression)
      result_label.text = "Result: #{result_value}"
    rescue => e
      result_label.text = "Error: #{e.message}"
    end
  }
  pack { padx 15; pady 15; side 'left' } # positions the button
end

Tk.mainloop # Starts the Tk event loop, which keeps the application running and responsive to user actions like button clicks
