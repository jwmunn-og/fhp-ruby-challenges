function removeChar(str){
  var arr = str.split('');
  arr.pop();
  arr.shift();
  var string = arr.join('');
  console.log(string);
};

removeChar('eloquent');

function mineColor(line, number) {
  var lines = ["a", "b", "c", "d", "e", "f", "g"];
  
  if (lines.indexOf(line) % 2 === 0) {

  }
}

mineColor("a", 8);
mineColor("b", 1);
mineColor("a", 1);

// Spin Words
function toWeirdCase(string){
  var lowerCase = string.toLowerCase();
  var words = lowerCase.split(' ');
  for (var i = 0; i < words.length; i++) {
    var chars = words[i].split('');
    for (var j = 0; j < chars.length; j++) {
      if (j % 2 === 0 )
      chars[j] = chars[j].toUpperCase();
    }
    words[i] = chars.join('');
    // chars[i] = chars[i].toUpperCase();
  }
  var weirdCase = words.join(' ');
  return weirdCase;
}

toWeirdCase('This');
toWeirdCase('This is a test');

function spinWords(string){
  return string.split(' ').map(function (word){
    return (word.length >= 5) ? word.split('').reverse().join('') : word;
  }).join(' ');
}

console.log(spinWords("Hey fellow warriors"));

// Find the longest Palindrome in a string
longestPalindrome=function(s){
  //your code here
  function checkPalendrone(string){
    if (string === string.split('').reverse().join('')) {
      return true;
    } else {
      return false;
    }
  }

  var arr = s.split('');
  var longest = 0;

  for (var i = 0; i <= arr.length; i++) {
    for (var j = 0; j <= arr.length; j++) {
      var substring = s.substring(i, j);
      if (checkPalendrone(substring) && substring.length > longest) {
        console.log(substring);
        longest = substring.length;
      }
    } 
  }

  return longest;
}

console.log(longestPalindrome("aa"));