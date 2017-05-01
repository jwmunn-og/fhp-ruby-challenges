"use strict";

const numbers = [1,2,3,4,5,6,7,8,9]
const newNumbers = [
  0,
  // include all the items inside the numbers array
  // without the enclosing array.
  ...numbers
]

console.log(newNumbers);