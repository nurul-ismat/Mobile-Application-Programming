void main(){
  var name ='Ali';
  var yearOfBirth = 1999;
  var score = 85.0;

  print ("Student's name: $name \t age: ${2020-yearOfBirth}");
  print ('Test score: $score \t Result: ${ testResult(score)} ');
}

String testResult(double s){
  if (s>50) return 'Pass';
  return 'Fail';
}

