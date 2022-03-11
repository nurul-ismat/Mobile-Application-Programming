mixin Flyer{
  void fly()=>print('It flies');
}

mixin Walker{
  void walk()=>print('It walks');
}

class Fish{
  void swim()=>print('It swims');
  void whatIs()=>print('It is a fish');
}

class Shark extends Fish{
  @override
  void whatIs()=>print('It is a shark');
}

class FlyingFish extends Fish with Flyer{
  @override
  void whatIs()=>print('It is a flying fish');
}

class MutantFish extends Fish with Flyer, Walker{
  @override
  void fly()=>print('I believe I can fly');
}

class Bird with Flyer, Walker{
  String species;
  Bird(this.species);

  void showFact(){
    print('It is a bird from $species species ');
    fly();
    walk();
  }
}

void main(){

  var shark = Shark();
  shark.whatIs();
  shark.swim();

  print('');

  var fish = FlyingFish();
  fish.whatIs();
  fish.swim();
  fish.fly();
  // fish.walk(); //error,
  // FlyingFish has no walk() method
  print('');

  var mutant = MutantFish();
  mutant.whatIs();
  mutant.swim();
  mutant.fly();
  mutant.walk();

  print('');
  var bird = Bird('Bald Eagle');
  bird.showFact();
}


