import 'dart:math';

abstract class Shape {
  String color;

  Shape([this.color]);
  void draw() => print('Painted in $color');
  double get area; // This method is not defined yet here
}

class Circle extends Shape {
  double _radius;

  Circle(this._radius, String color) : super(color);
  double get radius => _radius;
  set radius(double value) => _radius = value;

  @override
  double get area => pi * _radius * _radius;
}

class Rectangle extends Shape {
  double width, height;

  Rectangle({this.width, this.height, String color}) : super(color);
  Rectangle.square(double size)
      : this(width: size, height: size, color: 'White');

  @override
  double get area => width * height;

  @override
  void draw() {
    print('It is a rectangle');
    super.draw();
  }
}

void main() {
  var c = Circle(20, 'Yellow');
  var r = Rectangle(height: 2, color: 'Green', width: 5);
  var s = Rectangle.square(3);

  print("Circle's area is ${c.area} ");
  c.draw();

  print("\nRectangle's area is ${r.area} ");
  r.draw();

  print("\nSquare's area is ${s.area} ");
  s.draw();

  print('');

  Rectangle.square(20)
    ..color = 'Yellow'
    ..draw();

  print('');

  var square = Rectangle.square(20);
  square.color='Yellow';
  square.draw();

}

