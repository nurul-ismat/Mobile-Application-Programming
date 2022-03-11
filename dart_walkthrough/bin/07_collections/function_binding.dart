int ten() {
  return 10;
}

void main() {
  dynamic f;

  f = ten(); // a normal function call
  print (f) ;

  f = ten; // this is function binding, not a function call
  print (f) ;
  print ( f() ) ;
}

