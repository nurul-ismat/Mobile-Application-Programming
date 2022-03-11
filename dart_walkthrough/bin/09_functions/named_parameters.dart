import 'package:meta/meta.dart';

double area( {@required double width, double height=2} ) => width * height;

void main(){
  print ("Rectangle #1's area is ${area(width:2, height: 3)}");
  print ("Rectangle #2's area is ${area(height:5, width: 3)}");
  print ("Rectangle #3's area is ${area(width:5)}");

  // print ("Rectangle #4's area is ${area(height:1)}"); // error: width is required
}



