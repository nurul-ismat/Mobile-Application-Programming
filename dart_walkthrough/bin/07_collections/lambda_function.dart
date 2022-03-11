void doCalculation(int x, int y, Function callback){
  int result = callback(x,y);

  print('Result: $result');
}

void main() {
  doCalculation(1,2,  (a,b){return a+b;}  );

  // using shorthand notation using arrow function
  doCalculation(10,20,  (a,b)=>a+b  );
}

