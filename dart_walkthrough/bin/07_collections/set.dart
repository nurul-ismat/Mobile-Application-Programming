void main() {
  var a = {'milk','egg','bread'};
  var b = {'egg','rice'};
  var c = a.intersection(b);
  var d = a.union(b);

  print('Set C: $c \t count: ${c.length}');
  print('Set D: $d \t count: ${d.length}');

  c.add('milk');
  d.add('milk');
  print(c);
  print(d);
}

