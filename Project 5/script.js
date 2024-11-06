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
