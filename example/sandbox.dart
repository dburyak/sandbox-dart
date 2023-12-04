// TODO: page 95 after finishing operators, control flow, exceptions sections in the docs:
// https://dart.dev/guides/language/language-tour#assignment-operators

main() {
  print('Hello, world!');
  var person = Person('Bob', 42);
  person.name = 'Bob';
  person.age = 42;
  print(person);
  // assert(person.age == 0, 'should be ${person.age}');

  print('Hello' ' world!' ' I am' ' Dart!');
  print(someFn(1.1, 2.2));

  var dynRes = someFn(1.0, 2.0);
  // compiler infers dynRes type as "dynamic" because of the absence of
  // return type in someFn declaration
}

/// Person class.
class Person {
  late String _name;
  late int age;

  /// Person constructor.
  /// * [name] the name of the person
  /// * [param] age the age of the person
  Person(String name, this.age) {
    print('Person constructor');
    _name = name;
  }

  set name(var name) {
    print('Setting name to $name');
    _name = name;
  }

  @override
  toString() => 'Person($_name, $age)';
}

someFn(one, two) {
  return one.round() + two.round();
}
