void main() {
  var strCache = Cache<String>();
  strCache.putToCache('key', 'value');

  // using named constructor
  strCache = Cache<String>.fromMap({'key': 'value'});

  // error: The argument type 'int' can't be assigned to the parameter type 'String'.
  // strCache.putToCache('some-int', 123);

  //
  var honeyBadger = HoneyBadger("honey badger");
  var alligator = Alligator("alligator");
  var honeyBadgerCage = AnimalCage<HoneyBadger>();

  // ERROR: you can't put any other type than HoneyBadger into HoneyBadgerCage
  // The argument type 'Alligator' can't be assigned to the parameter type 'HoneyBadger'.
  // honeyBadgerCage.put(Alligator("alligator"));

  // if you want to put any animal into cage, you should use AnimalCage
  var animalCage = AnimalCage<Animal>();
  animalCage.put(honeyBadger);
  animalCage.put(alligator);

  // to put only Alligators, you create new cage specialized for Alligators
  var alligatorCage = AnimalCage<Alligator>();
  alligatorCage.put(alligator);

  // you can't put HoneyBadger into Alligator cage, because alligatorCage is
  // specialized with "Alligator" type
  // alligatorCage.put(honeyBadger);

  // though you can put more specialized alligator into alligator cage
  var nileAlligator = NileAlligator("nile alligator");
  alligatorCage.put(nileAlligator);

  // That's not what we want, we should forbid putting any other types other
  // than subtype of Animal
  // var cageOfStrings = AnimalCage<String>();

  _untypedCollections();
  _genericFunctions();
}

// --------------------------------
class Cache<T> {
  final Map<String, T> _storage = {};

  Cache();

  Cache.fromMap(Map<String, T> map) {
    _storage.addAll(map);
  }

  T? getFromCache(String key) {
    return _storage[key];
  }

  T getFromCacheOrDefault(String key, T defaultValue) {
    return _storage[key] ?? defaultValue;
  }

  void putToCache(String key, T value) {
    _storage[key] = value;
  }
}

abstract interface class AnimalCodec<T extends Animal> {
  String encode(T input);

  T decode(String output);
}

class AlligatorCodec implements AnimalCodec<Alligator> {
  @override
  Alligator decode(String output) {
    // TODO: implement decode
    throw UnimplementedError();
  }

  @override
  String encode(Alligator input) {
    // TODO: implement encode
    throw UnimplementedError();
  }
}

class Codec<In, Out> {
  Out encode(In input) {
    throw UnimplementedError();
  }

  In decode(Out output) {
    throw UnimplementedError();
  }
}

// --------------------------------
class AnimalCage<T extends Animal> {
  T? animalProp;

  void put(T animal) {
    this.animalProp = animal;
  }

  void chase(Animal other) {
    animalProp?.chase(other);
  }

  T? get() {
    return animalProp;
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

class NileAlligator extends Alligator {
  NileAlligator(super.name);
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

_untypedCollections() {
  // untyped list is a list of "dynamic" objects
  var untypedSet = Set();
  print("type           : ${untypedSet.runtimeType}"); // _Set<dynamic>
  print("is Set<dynamic>: ${untypedSet is Set<dynamic>}"); // true
  print("is Set<Object> : ${untypedSet is Set<Object>}"); // false

  // any list is a list of "dynamic" objects
  var someList = [1, 2, 3, 4];
  print("type=${someList.runtimeType}, isListOfDynamic=${someList is List<dynamic>}");
}

_genericFunctions() {
  // type parameter can be used in return type, in params, and local variables
  // generic function
  T? first<T>(List<T> list) {
    if (list.isEmpty) {
      return null;
    }
    return list.first;
  }

  // generic function with type constraint
  T? firstWhere<T extends NamedCreature>(List<T> list, bool Function(T) predicate) {
    for (var item in list) {
      if (predicate(item)) {
        return item;
      }
    }
    return null;
  }

  // generic functions can be members of non-generic class too, their type
  // parameter value is determined by the caller
  var someClass = SomeClass();
  var strRes = someClass.instanceMethod("some string");
  var intRes = someClass.instanceMethod(123);
  var staticStrRes = SomeClass.staticMethod("string");
  var staticIntRes = SomeClass.staticMethod(123);

  // also you can specify type parameter explicitly
  var staticStrRes2 = SomeClass.staticMethod<String>("string");
  var staticIntRes2 = SomeClass.staticMethod<int>(123);
  var strRes2 = someClass.instanceMethod<String>("string");
  var intRes2 = someClass.instanceMethod<int>(123);
}

class SomeClass {
  static T staticMethod<T>(T input) {
    return input;
  }

  T instanceMethod<T>(T input) {
    return input;
  }
}
