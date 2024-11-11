// Completing #1 in Category 1 using built-in methods - Gavin Shi

// Calculate the square root of a number
function squareRoot(n) {
    return Math.sqrt(n);
}

function cubeRoot(n) {
    return Math.cbrt(n);
}
  
  // Completing the yellow block in Category 2 using personalized methods
  
  // Calculate factorial of a number
  function factorial(n) {
    if (n === 0) {
      return;
    }
    let factorial = 1;
    for (let counter = 1; counter <= n; counter++) {
      factorial *= counter;
    }
    return factorial;
  }
  
  // Calculate the percentage of `a` as a part of `b`
  function percentage(a, b) {
    if (b <= 0) {
      console.log("Cannot divide by zero or find the percentage of a negative number.");
    } else {
      return (a * 100) / b;
    }
  }
  
  // Find the median of an array
  function median(data) {
    data.sort((a, b) => a - b); // Sort the array to calculate median
    let medianValue;
    if (data.length % 2 === 0) {
      // Even length: average of two middle numbers
      medianValue = (data[data.length / 2] + data[data.length / 2 - 1]) / 2;
    } else {
      // Odd length: middle value
      medianValue = data[Math.floor(data.length / 2)];
    }
    return medianValue;
  }
  
  // Generate prime numbers up to a limit and save to a file
  const fs = require('fs'); // Node.js file system module for file operations
  
  function isPrime(n) {
    if (n <= 1) return false;
    for (let counter = 2; counter < n; counter++) {
      if (n % counter === 0) {
        return false;
      }
    }
    return true;
  }
  
  function generatePrimes(n) {
    let primes = [];
    for (let i = 2; i < n; i++) {
        if (isPrime(i)) {
            primes.push(i);
        }
    }
    return primes;
}

// Helper function to download prime numbers to a file
function downloadPrimes(n) {
    const primes = generatePrimesLessThan(n);
    const blob = new Blob([primes.join('\n')], { type: 'text/plain' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'primes_less_than_' + n + '.txt';
    link.click();
}