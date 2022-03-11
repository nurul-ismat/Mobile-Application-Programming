void main() {
  var list1 = <int>[1, 2, 0];
  var list2 = List<String>();
  list2.add('Generics');
  // list2.add(10);

  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };

  var errors = Map<int, String>();
  errors.addAll({200: 'Success', 404: 'Server unreachable'});
  // errors.addAll({'Error#404' : 'Server error'});

  print(list1);
  print(list2);
  print(pages);
  print(errors);
}
