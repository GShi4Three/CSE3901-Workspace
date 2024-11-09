function logarithm(a, base) {
    return Math.log(a) / Math.log(base);
}
function exponent(a, b){
    if (b == 0){
        return 1;
    }
    else{
        result = a;
        counter = 1;
        while (counter < b){
            result = result * a;
            counter = counter + 1;
        }
    }
    return result;
}
function absolute(a){
    if (a < 0){
        return -a;
    }
    else{
        return a;
    }
}
function generateEvenNumbers(start, end) {
    let evenNumbers = [];
    for (let i = start; i <= end; i++) {
        if (i % 2 === 0) {
            evenNumbers.push(i);
        }
    }
    return evenNumbers;
}

function downloadEvenNumbers(start, end) {
    const evenNumbers = generateEvenNumbers(start, end);
    const blob = new Blob([evenNumbers.join('\n')], { type: 'text/plain' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'even_numbers.txt';
    link.click();
}

function generateSquareNumbers(start, end) {
    let squares = [];
    for (let i = start; i <= end; i++) {
        squares.push(i * i);
    }
    return squares;
}

function downloadSquareNumbers(start, end) {
    const squares = generateSquareNumbers(start, end);
    const blob = new Blob([squares.join('\n')], { type: 'text/plain' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'square_numbers.txt';
    link.click();
}