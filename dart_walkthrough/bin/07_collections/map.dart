void main() {
  var wordNumbers = {
    'one' : 1, 'three' : 3, 'seven' : 7, 'ten' : 10
  };

  var numberWords = {
    1: 'one', 3: 'three', 7: 'seven', 10: 'ten'
  };

  var firstWord  = 'three', secondWord = 'seven';
  var firstNumber = wordNumbers[firstWord];
  var secondNumber = wordNumbers[secondWord];
  var result = firstNumber + secondNumber;

  print('$firstWord plus $secondWord is ${numberWords[result]}');
}

