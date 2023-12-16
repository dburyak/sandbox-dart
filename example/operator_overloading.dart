void main() {
  var int1 = IntContainer(1);
  var int2 = IntContainer(2);
  var int3 = int1 + int2;
  print('int3: $int3');
  print('int1 < int2: ${int1 < int2}');
  print('int1 > int2: ${int1 > int2}');

  print('----------------------------------------');

}

class IntContainer {
  final int value;

  IntContainer(this.value);

  @override
  String toString() {
    return value.toString();
  }

  operator +(IntContainer other) {
    return IntContainer(value + other.value);
  }

  operator <(IntContainer other) {
    return value < other.value;
  }

  operator >(IntContainer other) {
    return value > other.value;
  }
}

class User {
  final String name;
  final String email;
  final int age;

  User(this.name, this.email, this.age);

  @override
  String toString() {
    return 'User{name: $name, email: $email, age: $age}';
  }

  operator [](String key) {
    switch (key) {
      case 'name':
        return name;
      case 'email':
        return email;
      case 'age':
        return age;
      default:
        throw ArgumentError('Unknown key: $key');
    }
  }
}
