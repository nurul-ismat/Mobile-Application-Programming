void main() {
  var list = [1, 3, 6, 7];

  // sum all the numbers in the list
  var sum = list.reduce((total, item)=>total+item );

  // how many odd numbers in the list?
  var odd = list.reduce((count, item)=> (item % 2==1) ? count + 1 : count );

  print('Sum = $sum');
  print('Number odds = $odd');
}

