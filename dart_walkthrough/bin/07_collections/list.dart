void main() {
  var list = [10, 20, 30]; // List literals
  print(list);

  // Iterating the list
  var sum =0;
  for (var i=0; i<list.length; i++){
    sum += list[i];
  }

  print ('The sum is $sum');

  list.add(40);      // list = [10,20,30,40]
  list.insert(0, 9); // list = [9,10,20,30,40]
  list.removeAt(2);  // list = [9,10,30,40]
  print(list);
}

