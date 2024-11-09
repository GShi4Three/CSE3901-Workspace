const display = document.getElementById('display');

function appendCharacter(character) {
  if (display.innerText === '0') {
    display.innerText = character;
  } else {
    display.innerText += character;
  }
}

function clearDisplay() {
  display.innerText = '0';
}

function calculateResult() {
  try {
    display.innerText = eval(display.innerText.replace('÷', '/').replace('×', '*'));
  } catch (error) {
    display.innerText = 'Error';
  }
}

// Handle keyboard inputs
document.addEventListener('keydown', (event) => {
  const key = event.key;
  
  if (!isNaN(key)) {
    // If the key is a number (0-9)
    appendCharacter(key);
  } else if (key === '+') {
    appendCharacter('+');
  } else if (key === '-') {
    appendCharacter('-');
  } else if (key === '*') {
    appendCharacter('*');
  } else if (key === '/') {
    appendCharacter('/');
  } else if (key === '(') {
    appendCharacter('(');
  } else if (key === ')') {
    appendCharacter(')');
  } else if (key === '%') {
    appendCharacter('%');
  } else if (key === '.') {
    appendCharacter('.');
  } else if (key === 'Enter') {
    calculateResult();
  } else if (key === 'Backspace') {
    // Handle backspace (delete last character)
    display.innerText = display.innerText.slice(0, -1) || '0';
  } else if (key === 'Escape') {
    clearDisplay();
  }
});

function executeFunction(functionName) {
  const input = display.innerText;

  let result;
  try {
    // Call the appropriate function based on the selected option
    switch (functionName) {
      case 'squareRoot':
        result = squareRoot(parseFloat(input));
        break;
      case 'cubeRoot':
        result = cubeRoot(parseFloat(input));
        break;
      case 'logarithm':
        result = logarithm(parseFloat(input), 10);
        break;
      case 'sin':
        result = sin(parseFloat(input));
        break;
      case 'cos':
        result = cos(parseFloat(input));
        break;
      case 'tan':
        result = tan(parseFloat(input));
        break;
      case 'convertToBinary':
        result = convertToBinary(parseFloat(input)); 
        break;
      case 'exponent':
        result = exponent(parseFloat(input1), parseInt(input2));
        break;
      case 'absolute':
        result = absolute(parseFloat(input));
        break;
      case 'factorial':
        result = factorial(parseInt(input));
        break;
      case 'percentage':
        result = percentage(parseFloat(input), 100); // Example percentage of 100
        break;
      case 'median':
        result = median([1, 2, 3, 4, parseFloat(input)]); // Example array
        break;
      case 'isPrime':
        result = isPrime(parseInt(input)) ? 'Prime' : 'Not Prime';
        break;
      case 'minimum':
        result = minimum([1, 2, 3, 4, parseFloat(input)]); // Example array
        break;
      case 'mode':
        result = mode([1, 2, 3, 3, parseFloat(input)]); // Example array
        break;
      case 'mean':
        result = mean([1, 2, 3, parseFloat(input)]); // Example array
        break;
      case 'fibonacci':
        result = fibonacci(parseInt(input)); // Generates Fibonacci sequence
        downloadResult('fibonacci.txt', result);
        break;
      case 'fahrenheitToCelsius':
        result = fahrenheitToCelsius(parseFloat(input));
        break;
      default:
        result = 'Invalid function';
    }

    // Display result for non-file outputs
    display.innerText = result;
  } catch (error) {
    display.innerText = 'Error';
  }
}

// Function to download results that need to be saved to a file
function downloadResult(filename, data) {
  const blob = new Blob([data.join('\n')], { type: 'text/plain' });
  const link = document.createElement('a');
  link.href = URL.createObjectURL(blob);
  link.download = filename;
  link.click();
}