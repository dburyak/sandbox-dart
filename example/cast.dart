void main() {
  late Iterable<String> iterable;
  iterable = ['a', 'b', 'c'];
  assert(iterable is List<String>);

  List<String> asList = iterable as List<String>;
  assert(asList.length == 3);

  var animal = Animal("abstract animal");
  print("animal: $animal");

  Animal alligatorAsAnimal = Alligator("alligator-as-animal");
  print("alligator: $alligatorAsAnimal");
  print("alligator.runtimeType: ${alligatorAsAnimal.runtimeType}");
  print("alligator: ${alligatorAsAnimal.name}");

  Alligator alligator = Alligator("alligator");
  handleAnimalGood(alligator);
}

void handleAnimalGood(Animal animal) {
  print("animal.name: ${animal.name}");
  print("animal.parent: ${animal.parent}");
  var rabbit = Rabbit("prey");
  animal.chase(rabbit);
  var alligator = Alligator("predator");
  animal.chase(alligator);
}

void handleAnimalBad(Animal animal) {
  // never do such downcasts within "if-else" blocks, it's a bad practice
  // this "handleAnimalBad" method becomes tightly coupled to all the subclasses of Animal
  // and if you add a new subclass, you have to modify this method (+any other similar methods)
  if (animal is Alligator) {
    var alligator = animal as Alligator;
    print("alligator.skin: ${alligator.skin}");
  } else if (animal is Rabbit) {
    var rabbit = animal as Rabbit;
    print("rabbit.fur: ${rabbit.fur}");
  }

  // animal.skin; // error: The getter 'skin' isn't defined for the type 'Animal'.
  if (animal is Alligator) {
    // Dart compiler is smart, and inside this block it knows that animal is Alligator
    // so you can call Alligator specific members directly on "animal" object without
    // any downcasts
    print("animal.skin: ${animal.skin}"); // no compiler error
  }
}

class NamedCreature {
  String name;

  NamedCreature(this.name);
}

class Animal extends NamedCreature {

  void chase(Animal other) {}

  Animal get parent => Animal("blah");

  Animal(super.name);

  @override
  String toString() {
    return "Animal(name:$name)";
  }
}

class Alligator extends Animal {
  String skin = "alligator skin";

  // ERROR: you can't change receiving parameter type to more specialized one, only
  // to more generic
  // 'Alligator.chase' ('void Function(Rabbit)') isn't a valid override of 'Animal.chase' ('void Function(Animal)')
  /*@override
  void chase(Rabbit rabbit) {
    print("alligator chases rabbit: $rabbit");
  }*/

  // you can only "widen" the type of the receiving parameter, make it more generic
  // here we changed "Animal" to more generic "NamedCreature"
  @override
  void chase(NamedCreature other) {
    if (other is! Rabbit) {
      throw ArgumentError("alligator can only chase rabbits");
    }
    print("alligator chases only rabbits: ${other.fur}");
  }

  @override
  Animal get parent => Alligator("parent alligator");

  Alligator(super.name);

  void eatMeat() {
    print("arrrr, meat");
  }

  @override
  String toString() {
    return "Alligator(super:${super.toString()},skin:$skin)";
  }
}

class HoneyBadger extends Animal {
  @override
  void chase(Animal other) {
    print("alligator chase everything: $other");
  }

  // you can "narrow" (use more specialized type) in return type
  // here we changed "Animal" to more specialized "HoneyBadger"
  @override
  HoneyBadger get parent => HoneyBadger("parent honey badger");

  HoneyBadger(super.name);

  void eatHoney() {
    print("honey yummy");
  }
}

class Rabbit extends Animal {
  String fur = "rabbit fur";

  @override
  void chase(Animal other) {
    print("rabbit doesn't chase other animals");
  }

  @override
  Animal get parent => Rabbit("parent rabbit");

  Rabbit(super.name);

  void eatGrass() {
    print("grass is boring, but I'm a rabbit, so ...");
  }
}
