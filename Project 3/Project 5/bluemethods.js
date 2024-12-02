function convertToBinary(n){
console.log("The decimal number" + n +"is" + n.toString(2) + "");
}
function convertToOctal(n){
    console.log("The decimal number" + n + "is" + n.toString(8) + ".");
    }
    function convertToBinary(n){
        console.log("The decimal number" + n + "is" + n.toString(16) + ".");
        }
function mean(data){
    let total = 0;
 for(let i =0; i < data.length; i++){
    total += data[i];
 }
    let x = data.length;
    let mean = total / x;
    console.log("The mean of the set is " + mean);
}
function maximum(data) {
    let max = data[0];
    let counter = 1;
    while (counter < data.length) {
        if (data[counter] > max) {
            max = data[counter];
        }
        counter += 1;
    }
        console.log("The largest value in the set is " + max +);
}
function fibonacciNumbers(limit, fileName) {
    const fs = require('fs');
    let sequence = [];
    let a = 0;
    let b = 1;

    while (a <= limit) {
        sequence.push(a);
        let previous = a;
        a = b;
        b = previous + b;
    }

    fs.writeFileSync(fileName, sequence.join('\n'));
    console.log(`Fibonacci numbers up to ${limit} have been saved to ${fileName}.`);
}
function fahrenheitToCelsius(fahrenheit) {
    let celsius = (fahrenheit - 32) * 5 / 9;
    console.log(`The value ${fahrenheit} degrees Fahrenheit in Celsius is ${celsius.toFixed(2)} degrees Celsius.`);
}
console.log(fahrenheitToCelsius(-76.0));
console.log(fahrenheitToCelsius(0));
console.log(fahrenheitToCelsius(98.0));
console.log(fibonacciNumbers(1000, "fibonacci_numbers.txt"));
const set1 = [13, 27, 45, 34, 506];
const set2 = [-13, 10027, 245, 0, 1]

console.log(convertToBinary(-52));
console.log(convertToBinary(0));
console.log(convertToBinary(50));

console.log(convertToOctal(-111));
console.log(convertToOctal(0));
console.log(convertToOctal(100));

console.log(convertToHexadecimal(-220));
console.log(convertToHexadecimal(0));
console.log(convertToHexadecimal(200));
console.log(mean(set1));
console.log(mean(set2));
console.log(maximum(set1));
console.log(maximum(set2));
