// Constant constructor
class NumberConstant {
  final String name;
  final double value;
  const NumberConstant(this.name, this.value);
}

// Factory constructor
// Named consructor
const List<Day> days = [Day('Mon', 1), Day('Tue', 2)];

class Day {
  final String name;
  final int number;

  const Day(this.name, this.number);
  factory Day.existing(int n) => (n <= days.length) ? days[n - 1] : Day('unknown', n);
  void display() => print('name:$name\tnumber:$number');
}

// Static attribute (shared among objects from the same class )
// Static methods, to be accessed from class (not an object).
// getters and setters

class Graphic{
  static int _n=0;

  int get count => _n;
  set count(int value) => _n=value;

  Graphic(){_n++;}

  static void circle(int x, int y, int r)=>print('Draw a circle at ($x, $y) with radius of $r');
  static void rectangle(int x1, int y1, int x2, int y2)=>print('Draw a rectangle with corners ($x1, $y1, $x2, $y2)');
}

void main() {
  var PI = NumberConstant('PI', 3.141);
  print(PI.value);

  PI = NumberConstant('PIE', 23.141);
  print(PI.value);

  Day('Friday', 5).display();
  Day.existing(3).display();

  var g1 = Graphic();
  print (g1.count);

  var g2 = Graphic();
  print (g1.count);
  print(Graphic().count);

  Graphic.circle(1,2,3);

}
