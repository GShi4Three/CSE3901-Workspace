// Amir Shaltami
// Category 1 Convert a decimal number to binary, octal, or hexadecimal.

// Convert a decimal base number to binary
function convertToBinary(n) {
    return n.toString(2);
  }
  
  // Convert a decimal number to an octal number
  function convertToOctal(n) {
    return n.toString(8);
  }
  
  // Convert a decimal number to a hexadecimal number
  function convertToHexadecimal(n) {
    return n.toString(16);
  }
  
  // Category 2 Blue methods
  
  // Calculate the mean of an array of numbers
  function mean(data) {
    const sum = data.reduce((acc, num) => acc + num, 0); // Calculate the sum of the numbers
    const elements = data.length; // Get the number of elements
    const meanValue = sum / elements; // Calculate the mean
    return meanValue;
  }
  
  // Find the maximum value in an array of numbers
  function maximum(data) {
    let max = data[0]; // Initialize the max value with the first element
    for (let i = 1; i < data.length; i++) { // Loop through the array
      if (data[i] > max) { // If a larger number is found, update max
        max = data[i];
      }
    }
    return max;
  }
  
  // Generate Fibonacci numbers up to a limit and save to a file
  const fs = require('fs'); // Node.js file system module for file operations
  
  function fibonacciNumbers(limit, fileName) {
    const sequence = []; // Initialize an empty array
    let a = 0;
    let b = 1;
    while (a <= limit) { // Generate numbers until the limit is exceeded
      sequence.push(a); // Add the current number to the sequence
      [a, b] = [b, a + b]; // Update 'a' and 'b' for the next Fibonacci number
    }
    fs.writeFileSync(fileName, sequence.join('\n')); // Save the sequence to a file
  }
  
  // Convert Fahrenheit to Celsius
  function fahrenheitToCelsius(fahrenheit) {
    const celsius = ((fahrenheit - 32) * 5) / 9;
    return celsius.toFixed(2);
  }
  
  