void main() {
  var list1 = ['A', 'B'];
  var list2 = ['P', 'Q', 'R'];
  var list3 = [list1, 'D','E', list2];
  var list4 = [...list1, 'D','E', ...list2];

  print (list3);
  print (list4);
}

