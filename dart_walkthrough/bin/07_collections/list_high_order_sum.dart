void callback(int item){
  print('Number $item');
}

void main() {
  var numbers = [10, 1, 5, 7];

  numbers.forEach( callback);

  // or using lambda function
  // numbers.forEach((int item)=>print('Number $item') );
}

