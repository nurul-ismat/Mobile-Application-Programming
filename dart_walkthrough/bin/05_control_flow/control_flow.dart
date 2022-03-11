void main() {}

void main_if() {
  var score, grade;

  if (score >=80) {
    grade = 'A';
  }
  else if (score >=70) {
    grade = 'B';
  }
  else if (score >=60) {
    grade = 'C';
  }
  else if (score >=50) {
    grade = 'D';
  }
  else{
    grade = 'E';
  }
}


void main_for(){

  var sum = 0;
  for (var n=10; n<100; n += 10 ){
    sum += n;
  }
  print (sum);


}

void main_break(){

  for (var i=0; i<100; i++){
    if (i>=50) break; // stop printing at i=50
    print(i);
  }

}

void main_continue(){

  // Iterate all numbers but print only the odd numbers
  for (var i=1; i<100; i++){
    if ((i % 2)==1) continue;
    print(i);
  }

}

void main_switch_case(){

  // Iterate all numbers but print only the odd numbers
  for (var i=1; i<100; i++){
    if ((i % 2)==1) continue;
    print(i);
  }

}