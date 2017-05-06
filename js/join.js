"use strict";

var _ = {
  // Implements:
  // https://lodash.com/docs#join
  join: (array, separator=',') => {
    // return 'FAIL :(';
    return array.join(separator);
  }
}


const value = _.join(["hello", "goodbye"], ", ")

console.log(value);