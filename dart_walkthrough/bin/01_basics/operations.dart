// String interpolation
// Conditional expression
// condition ? expr1 : expr2
// If condition is true, evaluates expr1 (and returns its value); otherwise, evaluates and returns the value of expr2.
// expr1 ?? expr2
// If expr1 is non-null, returns its value; otherwise, evaluates and returns the value of expr2.

// cascade notations
class Circle {
  int x, y;
  int radius;
  String color;
  void position(x, y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    print('Circle info: location=($x, $y)\tsize=$radius\tcolor=$color');
  }
}

void main() {
  var c = Circle()
    ..position(10, 20)
    ..radius = 20
    ..color = 'black';

  c.display();

  var name='hello';
  print( name ?? 'guest' );
}

// Not covered in the lecture, thus students need to walkthrough on their own
// operators:
//  arithmetics
//  bitwise
//  logical operators