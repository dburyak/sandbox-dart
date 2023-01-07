main() {
  print('Hello, world!');
  var person = new Person('Bob', 42);
  person.name = 'Bob';
  person.age = 42;
  print(person);
  // assert(person.age == 0, 'should be ${person.age}');

  print('Hello' ' world!' ' I am' ' Dart!');
}

/// Person class.
class Person {
  late String _name;
  late int age;

  /// Person constructor.
  /// * [name] the name of the person
  /// * [param] age the age of the person
  Person(String name, int age) {
    print('Person constructor');
    this._name = name;
    this.age = age;
  }

  set name(var name) {
    print('Setting name to $name');
    this._name = name;
  }

  toString() => 'Person($_name, $age)';
}
