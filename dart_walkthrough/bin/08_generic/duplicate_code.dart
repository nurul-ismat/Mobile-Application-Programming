class IntegerAddition{
  int first,second;

  IntegerAddition(int f, int s)
  { first = f;
    second = s;
  }

  int get add =>first + second;
}

class StringAddition{
  String first,second;

  StringAddition(String f, String s)
  { first = f;
    second = s;
  }

  String get add =>first + second;
}

void main() {
  var i=IntegerAddition(1,2);
  var s=StringAddition('Hello', 'World');
  print (i.add);
  print (s.add);
}
