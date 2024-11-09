/* Category 1 Methods - 
 Khaled Saleh
 */
function sin(n){

    // Assuming user-supplied parameter (n) is in degrees

    // Converting from degrees to radians to be passed into built in function

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

function is_prime(n){


    // Edge Case: 0 and 1 are prime numbers
    if (n <= 1){
        return false;
    }

    // Edge Case: 2 is a prime number
    if (n == 2){
        return true;
    }

    
    // Iterate from 2 up to square root of n
    for(let i = 2; i < Math.sqrt(n);i++){
        // if n is divisible by that number, it's not prime
        if (n % i == 0){
            return false
        }
        
    }
    
    // If made it to this point in execution, then that means n was only divisible by 1 and itself, meaning it is a prime number
    return true

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
    return min_val

}

const fs = require('fs');

function generate_odd_values(file_name, start_list, end_list){

    // Open file for writing
    const file = fs.createWriteStream(file_name);

        // Iterate through the range: (start, end) inclusive
        while(start_list <= end_list){
            // If value is odd, then write that value to the file
            if (start_list % 2 == 1){
                file.write(start_list + "\n");
            }
            start_list+=1
        }

        file.end();

    console.log(`Odd values between ${start_list} and ${end_list} have been saved to ${file_name}.`)


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
