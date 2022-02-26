//? MOBILE APPLICATION PROGRAMMING
//? Exercise 1: Dart Programming Language

// Date: Tuesday, 9 November 2021
// Section: 01

// Member 1's Name: Nur Izzahtul Syafiqah  Location: Kuantan (i.e. where are you currently located)
// Member 2's Name: Nurul Ismat Tanni    Location: Bangladesh

import 'courses.dart';

//! Task 1: Define the class 'Course'

class Course{
  String _name;
  String _code;

  Course(String code, String name){
    _code = code;
    _name = name;
  }

  String get code => _code;
  set code(String c) => _code = c;

  String get name => _name;
  //int name(String n) => _name = n;

  int get hour => int.parse(_code.substring(7,8));
  String get year{
    var count = int.parse(_code.substring(4,5));
    const year = ['Year 1', 'Year 2', 'Year 3', 'Year 4'];
    return year[count - 1];
  }
    }

    //SECJ3624
    //String get year => 'Year ${_code[4]}';

    //String get getYear{
      //String temp = _code[4];
      //if(temp =="1")
        //return "Year 1";

        //else if (temp =="2")
        //return "Year 2";

        //else if (temp == "3")
        //return "Year 3";
        
        //else 

      //return "Year 4";
            //}



//! Task 2: Define a function to print a list of courses

void printList(List<Course> list){
  print('\n');
  print('COURSE CODE\tcredit hour\tYearoffered\tcourse name');
  print('...........\t...........\t...........\t...........');

  list.forEach((c) => print('${c._code} \t ${c.code} \t\t ${c.year} \t ${c._name}'));

}
void main() {
  print(courses.length);
 
  //! Task 3a: Create a list of Course objects using a 'for' loop
  
  var list1 = [];
  for (var code in courses.keys){
    list1.add(Course(code, courses[code]));
  }
 // printList(list1);
  //! Task 3b: Create a list of Course objects using a the 'forEach' high-order method.
 
var list2 = [];
courses.forEach((code, name) => list2.add(Course(code, name)));
//printList(list2);
  //! Task 3c: Create a list of Course objects using a the 'map' high-order method.
  var courses3 = courses.entries.map((c) => Course(c.key, c.value));
  var list3 = courses3.toList();
  printList(list3);
  //! Task 4: Calculate the total credits of all courses use the 'fold' high-order method.
 //var credHours = list1.fold(0, (int total, course) => total + course.hour);
 //print{'\nNumber of courses = ${list1.length'} \t Total credit hour = $creditHours\n'};

  //! Task 5: Calculate the number of courses by year offered.

 var yearFreqs = {'Year 1' : 0, 'Year 2': 0, 'Year 3' : 0, 'Year 4': 0};

 list1.forEach((code) => yearFreqs[code.year]++);
 print('Year offered\tNumber of Courses');
 print('.............\t.......');
 yearFreqs.forEach((year,number) => print('${year}\t\t\t${number}'));

 }

// Resources
// 1.	How do I parse a string into a number with Dart?
//    https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart

// 2.	Top 10 Array utility methods you should know (Dart)
//    https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2