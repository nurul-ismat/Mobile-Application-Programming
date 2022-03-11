class Fish{
  void swim(){print('It swims');}
}

class Shark extends Fish{
}

class Flyable extends Fish{
  void fly(){print('It flies');}
}

class FlyingFish extends Flyable{
}

class MutantFish extends Flyable{
  void walk(){print('It walks');}
}

void main(){
}