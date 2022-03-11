void main(){
  final oddNumbers  = [1,3,5];
  final evenNumbers = const [2,4];

  oddNumbers.add(7);
  // evenNumbers.add(6);
  print('\noddNumbers:');  print(oddNumbers);
  print('\nevenNumbers:');  print(evenNumbers);
}


void main_final_constant_vars(){
  var oddNumbers = [1,3,5,7];
  var evenNumbers = [2,4,6,8,10,12];
  final numbers = oddNumbers;

  numbers.add(11);
  print('\nnumbers:');  print(numbers);
  print('\noddNumbers:');  print(oddNumbers);

  // numbers = evenNumbers;

  print('\nevenNumbers:');  print(evenNumbers);
}

class Person {
  final String name;
  int age;

  Person(String name, int age)
      : this.name = name,
        this.age = age;

  void show() {
    print(name);
    print(age);
  }
}

void main_final_instance_var() {
  var p = Person('Ahmad', 20);
  p.show();

  // p.name = 'Abu';
  p.age = 21;
  p.show();
}

