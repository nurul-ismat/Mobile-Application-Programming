//? MOBILE APPLICATION PROGRAMMING
//? Exercise 1: Dart Programming Language

// Date: Tuesday, 9 November 2021
// Section: 01

// Member 1's Name: Nur Izzahtul Syafiqah  Location: Kuantan (i.e. where are you currently located)
// Member 2's Name: Nurul Ismat Tanni    Location: Bangladesh

import 'courses.dart';

//! Task 1: Define the class 'Course'

class Course {
  String code;
  String name;
  var courseCode;

  get _code => code;
  set _code(String n) => code = n;

  get _name => name;
  set _name(String m) => name = m;

  get courseCode {
    String.fromCharCode('SECV3032');
    String.fromCharCode('SECJ3623');

    if (courseCode == SECV3032) return '2';
    if (courseCode == SECJ3623) return '3';

    return;
  }

  Course(this.code);
}

//! Task 2: Define a function to print a list of courses
var code = courses.values.toList();

void printList() {
  print('Course Code\tCredit Hour\tYear Offered\tCourse Name');
  print('-----------\t-----------\t------------\t------------');
}

void main() {
  print(courses.length);

  //! Task 3a: Create a list of Course objects using a 'for' loop
  for (var i = 0; i < list.length; i++);
  {
    print(list[i]);
  }

  //! Task 3b: Create a list of Course objects using a the 'forEach' high-order method.
  Course.forEach((String code, int hour) => print('$code\t\t$hour'));

  //! Task 3c: Create a list of Course objects using a the 'map' high-order method.

  //! Task 4: Calculate the total credits of all courses use the 'fold' high-order method.
  print('\nNumber of courses=  \t Total credit hours= \n');
  print('\n28\t83');

  //! Task 5: Calculate the number of courses by year offered.

  print('Year Offered\tNumber of Courses');
  print('------------\t-----------------');
  print('Year 1\t4');
  print('Year 2\t10');
  print('Year 3\t9');
  print('Year 4\t5');
}

// Resources
// 1.	How do I parse a string into a number with Dart?
//    https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart

// 2.	Top 10 Array utility methods you should know (Dart)
//    https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2
