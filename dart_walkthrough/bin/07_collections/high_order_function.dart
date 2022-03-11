int add(int a, int b){return a + b;}
int times(int a, int b){return a * b;}
int substract(int a, int b){return a - b;}

void doCalculation(int x, int y, Function callback){
  int result = callback(x,y);

  print('Result: $result');
}

void main() {
  doCalculation(1,2, add);
  doCalculation(5,4, times);
  doCalculation(6,9, substract);
}

