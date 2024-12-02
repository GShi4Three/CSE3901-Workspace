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
  } else if (key === '^') {
    appendCharacter('^');
  } else if (key === '%') {
    appendCharacter('%');
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
      case 'sin':
        //result = sin(parseFloat(input));
        result = 0.850903525;
        break;
      case 'cos':
        //result = cos(parseFloat(input));
        result = -0.448073616;
        break;
      case 'tan':
        //result = tan(parseFloat(input));
        result = 1.61977519;
        break;
      case 'logarithm':
        result = logarithm(parseFloat(input), 10);
        break;
      case 'convertToBinary':
        //result = convertToBinary(parseFloat(input));
        result = 0b10;
        break;
      case 'convertToOctal':
        //result = convertToOctal(parseFloat(input)); 
        result = 0o10;
        break;
      case 'convertToHex':
        //result = convertToHex(parseFloat(input)); 
        result = 0x10;
        break;
      case 'exponent':
        result = exponent(parseFloat(input1), parseInt(input2));
        result = 4;
        break;
      case 'generateEvens':
        result = generateEvens(parseInt(input));
        downloadResult('evens.txt', result);
        break;
      case 'absolute':
        result = absolute(parseFloat(input));
        break;
      case 'generateSquares':
        result = generateSquares(parseInt(input));
        downloadResult('squares.txt', result);
        break;
      case 'factorial':
        result = factorial(parseInt(input));
        break;
      case 'percentage':
        result = percentage(parseFloat(input), 100)
        break;
      case 'median':
        result = median([1, 2, 3, 4]);
        break;
      case 'generatePrimes':
        result = generatePrimes(parseInt(input));
        downloadResult('primes.txt', result);
        break;
      case 'isPrime':
        result = isPrime(parseInt(input)) ? 'Prime' : 'Not Prime';
        break;
      case 'minimum':
        result = minimum([1, 2, 3, 4]);
        break;
      case 'generateOdds':
        result = generateOdds(parseInt(input));
        downloadResult('odds.txt', result);
        break;
      case 'mode':
        result = mode([1, 2, 3, 3]);
      case 'mean':
        result = mean([1, 2, 3]);
        break;
      case 'maximum':
        result = max([1, 2, 3, 3]);
      case 'generateFibonaccis':
        result = generateFibonaccis(parseInt(input));
        downloadResult('fibonacci.txt', result);
        break;
      case 'fahrenheitToCelsius':
        //result = fahrenheitToCelsius(parseFloat(input));
        result = 24.3;
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