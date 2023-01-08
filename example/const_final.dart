// const - compile time constant VALUE, means that its contents can't be changed
//   AND value must be known at compile time; so this can't work as a proper
//   immutability implementation mechanism unfortunately

// final - non-modifiable REFERENCE, though referenced object contents can be changed

main() {
  final mutablePerson = MutablePerson('Mutable', 42);
  print('mutablePerson before adding friends: $mutablePerson');
  mutablePerson.friends.add('friend1');
  mutablePerson.friends.add('friend2');
  print('mutablePerson after adding friends: $mutablePerson');

  // immutable with "const []"
  var immutablePerson = ImmutablePerson('Immutable.const', 42);
  print('immutablePerson before adding friends: $immutablePerson');
  // immutablePerson.friends.add('friend1');
  // Unhandled exception:
  // Unsupported operation: Cannot add to an unmodifiable list

  // immutable with List.unmodifiable(...)
  immutablePerson =
      ImmutablePerson('Immutable.unmodifiable', 42, ['friend1', 'friend2']);
  print('immutablePerson before adding friends: $immutablePerson');
  // immutablePerson.friends.add('friend3');
  // Unhandled exception:
  // Unsupported operation: Cannot add to an unmodifiable list
}

class MutablePerson {
  final String name;
  final int age;
  final List<String> friends;

  MutablePerson(this.name, this.age, [List<String>? friends])
      : friends = friends ?? [];

  @override
  String toString() =>
      'MutablePerson{name: $name, age: $age, friends: $friends}';
}

class ImmutablePerson {
  final String name;
  final int age;
  final List<String> friends;

  ImmutablePerson(this.name, this.age, [List<String>? friends])
      : friends = friends != null ? List.unmodifiable(friends) : const [];

  @override
  String toString() =>
      'ImmutablePerson{name: $name, age: $age, friends: $friends}';
}
