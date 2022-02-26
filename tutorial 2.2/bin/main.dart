// SCSJ3623 Mobile Application Programming
// Tutorial 2.2


// Task 1a: Define class Person
class Person{
  String _name;

  //Person({String name}) : _name = name;

   //String get name{
     //return _name;
   //}

   get

   void set name(String value){
     _name = value;
   }
   Person({String name}) : _name = name;

  void display(){
    print("Person's name: $_name");
  }
}
  

//  Task 1b: Define class Result as a mixin

//  Task 1c: Define class Student

  void main(){

  var p = Person(name:'Dart');
  p.display();

  p.name = 'flutter';
  p.dispaly();

  print('my name is ${p.name}');
  // Task 2: Store the input data in a multi-line string variable

  // Task 3: Split the text into a list of single line string

  // Task 4: create a list of Student objects from the strings

  // Task 5: Print the list of students with their scores, grades and other info
  print('Name\t\tYear\t\tMatric\t\tScore\tGrade');
  print('----\t\t----\t\t------\t\t------\t----');

  print('Average score: ');
  print('Average grade: ');
}

// Resources
// 1.	How do I call a super constructor in Dart?
//    https://stackoverflow.com/questions/13272035/how-do-i-call-a-super-constructor-in-dart

// 2.	substring method
//    https://api.flutter.dev/flutter/dart-core/String/substring.html

// 3.	How do I parse a string into a number with Dart?
//    https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart

// 4.	Multi-lines string in Dart
//    https://stackoverflow.com/questions/13104729/multi-lines-string-in-darttext

// 5.	split method
//    https://api.flutter.dev/flutter/dart-core/String/split.htmltext

// 6.	Top 10 Array utility methods you should know (Dart)
//    https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2

// 7.	round method
//    https://api.dart.dev/stable/2.7.1/dart-core/num/round.html
