function removeChar(str){
 //You got this!
  var arr = str.split('');
  arr.pop();
  arr.shift();
  var string = arr.join('');
  console.log(string);
};

removeChar('eloquent');