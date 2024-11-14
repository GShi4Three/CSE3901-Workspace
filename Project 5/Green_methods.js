/* Category 1 Methods - 
 Khaled Saleh
 */
function sin(n){
    radians_val = n * (Math.PI / 180);

    return Math.sin(radians_val);
}


function cos(n){

    // Assuming user-supplied parameter (n) is in degrees

    // Converting from degrees to radians to be passed into built in function

    radians_val = n * (Math.PI / 180);

    return Math.cos(radians_val);

}

function tan(n){

    // Assuming user-supplied parameter (n) is in degrees

    // Converting from degrees to radians to be passed into built in function

    radians_val = n * (Math.PI / 180);

    return Math.tan(radians_val);

}

// Category 2 Methods - 

function isPrime(n) {
    if (n <= 1) return false;
    for (let counter = 2; counter < n; counter++) {
      if (n % counter === 0) {
        return false;
      }
    }
    return true;
  }

function minimum(data){

    //  Method assumes that data variable belongs to an array


    // Edge case - if no elements are in input array
    if (data.empty){
        return null;
    }

    // Set minimum value to the first element in input array
    min_val = data.first

    // Iterate through data array
    for(const value of data){
        // If value is smaller than min_val, set min_val to that value
        if (value < min_val){
            min_val = value
        }
    }

    // return min_val
    return min_val;
}

const fs = require('fs');

function generateOdds(start, end) {
    let oddNumbers = [];
    for (let i = start; i <= end; i++) {
        if (i % 2 !== 0) {
            oddNumbers.push(i);
        }
    }
    return oddNumbers;
}

// Helper function to download odd numbers to a file
function downloadOdds(start, end) {
    const oddNumbers = generateOddNumbers(start, end);
    const blob = new Blob([oddNumbers.join('\n')], { type: 'text/plain' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'odd_numbers.txt';
    link.click();
}


// Find the mode of an array
function mode(data) {
if (data.length === 0) return null; // Edge case: empty array

const hashMap = {}; // Initialize an empty object to count occurrences
data.forEach((value) => {
    hashMap[value] = (hashMap[value] || 0) + 1; // Count occurrences
});

const highestOccurringVal = Object.entries(hashMap).reduce((a, b) => (a[1] > b[1] ? a : b));
return Number(highestOccurringVal[0]); // Return the mode as a number
}
