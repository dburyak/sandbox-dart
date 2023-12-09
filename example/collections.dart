import 'dart:collection';

main() {
  _lists();
  _sets();
  _maps();
  _iterable();
  _queues();
}

_lists() {
  // lists - there are no arrays, only lists
  // lists can be growable and fixed-length
  var listFixed = List.of([1, 2, 3], growable: false); // fixed-length
  // listFixed.add(4); // throws UnsupportedError
  // Unsupported operation: Cannot add to a fixed-length list
  listFixed[0] = 0; // it's still modifiable though, fixed-length != immutable
  // listFixed[3] = 4; // throws RangeError
  // RangeError (index): Invalid value: Not in inclusive range 0..2: 3

  var list = [1, 2, 3]; // mutable, growable
  list.add(4);
  list[0] = 100;
  print("list = $list"); // 100, 2, 3, 4
  // list[4] = 5; // RangeError (index): Invalid value: Not in inclusive range 0..3: 4

  var immutableConstList = const [1, 2, 3];
  var immutableList = List.unmodifiable(list);
  // trailing comma is allowed
  var list2 = [
    1,
    2,
    3,
  ];

  // spread operator
  var list3 = ['one', 'two', 'three'];
  var list4 = [0, ...list3, 4, 5];
  print(list4);

  // ... null aware spread - ignores list if list is null, does NOT filter items
  var list5 = [0, ...?null, 4, 5];
  print(list5);
  var listWithNulls = [1, 2, 3, null, 4, null, 5];
  var list6 = [0, ...?listWithNulls, 6];
  print(list6); // [0, 1, 2, 3, null, 4, null, 5, 6]

  // collection-if
  const wantSalt = true;
  const isVegetarian = false;
  const list7 = [
    'onion',
    'garlic',
    if (wantSalt) 'salt',
    if (isVegetarian) 'vegetable stock' else 'chicken stock',
  ];

  // collection-for - does similar thing to spread but is more flexible, it
  //  can filter and/or map items
  const ingredients = {'tofu': false, 'ham': true, 'chicken': true};
  var list8 = [
    'onion',
    'garlic',
    for (var ingredient in ingredients.entries)
      if (ingredient.value) ingredient.key,
  ];
}

_sets() {
  // sets - unordered collection of unique items
  var set = {1, 2, 3};
  var set2 = {1, 2, 3, 1, 2, 3};
  print(set2); // {1, 2, 3}
  var set3 = Set.from([1, 2, 3, 1, 2, 3]);
  print(set3); // {1, 2, 3}
  var set4 = Set.of([1, 2, 3, 1, 2, 3]);
  print(set4); // {1, 2, 3}
  var set5 = Set<int>.from([1, 2, 3, 1, 2, 3]);
  print(set5); // {1, 2, 3}
  var set6 = Set<int>.of([1, 2, 3, 1, 2, 3]);
  print(set6); // {1, 2, 3}
  var set7 = Set<int>.identity();
  set7.add(1);
  set7.add(2);
  set7.add(3);
  set7.add(1);
  set7.add(2);
  set7.add(3);
  print(set7); // {1, 2, 3}
}

_maps() {
  // maps - key-value pairs
  var map = {'one': 1, 'two': 2, 'three': 3};
  var map2 = Map.from({'one': 1, 'two': 2, 'three': 3});
  var map3 = Map.of({'one': 1, 'two': 2, 'three': 3});
  var map4 = Map<String, int>.from({'one': 1, 'two': 2, 'three': 3});
  var map5 = Map<String, int>.of({'one': 1, 'two': 2, 'three': 3});
  var map6 = Map<String, int>.identity();
  map6['one'] = 1;
  map6['two'] = 2;
  map6['three'] = 3;
  var map7 = Map<String, int>.fromIterables(['one', 'two', 'three'], [1, 2, 3]);
  var map8 = Map<String, int>.fromEntries([
    MapEntry('one', 1),
    MapEntry('two', 2),
    MapEntry('three', 3),
  ]);
  var map9 = Map<String, int>.from({'one': 1, 'two': 2, 'three': 3});
  var map10 = Map<String, int>.of({'one': 1, 'two': 2, 'three': 3});
  var map11 = Map<String, int>.identity();
  map11['one'] = 1;
  map11['two'] = 2;
  map11['three'] = 3;
  var map12 = Map<String, int>.fromIterables(['one', 'two', 'three'], [1, 2, 3]);
  var map13 = Map<String, int>.fromEntries([
    MapEntry('one', 1),
    MapEntry('two', 2),
    MapEntry('three', 3),
  ]);
  var map14 = Map<String, int>.from({'one': 1, 'two': 2, 'three': 3});
  var map15 = Map<String, int>.of({'one': 1, 'two': 2, 'three': 3});
  var map16 = Map<String, int>.identity();
}

int _someFn(int param) {
  // param is non-null by default
  return param;
}

_iterable() {
  print('--------------------- iterable ------------------------');
  Iterable iterable = [1, 2, 3];
  var it = iterable.iterator;
  while (it.moveNext()) {
    print(it.current);
  }

  print('iterator - 2');
  var it2 = iterable.iterator;
  for (var i = 0; i < 5; i++) {
    // get "current" from not yet moved iterator
    // behavior for first iteration is undefined (depends on the iterable impl)
    print(it2.current);
    it2.moveNext();
    print(it2.current);
    // get "current" from iterator beyond the last element
    // behavior in this case is undefined (depends on the iterable impl)

    // no exception is thrown for literal list, "current" returns null
  }
}

_queues() {
  print('--------------------- queues ------------------------');
  // FIFO (ListQueue impl)
  var queue = Queue.of([1, 2, 3]);
  print("queue: $queue");
  queue.add(4);
  queue.add(5);
  queue.add(6);
  print("queue: $queue");
  print(queue.removeFirst());
  print("queue: $queue");
  print(queue.removeLast());
  print("queue: $queue");
  print(queue.removeFirst());
  print("queue: $queue");
  print(queue.removeLast());
  print("queue: $queue");
  print(queue.removeFirst());
  print("queue: $queue");
  print(queue.removeLast());
  print("queue: $queue");
  try {
    print(queue.removeFirst()); // throws StateError
  } on StateError catch (e) {
    print("exception: type=${e.runtimeType}, msg=$e");
    // exception: type=StateError, msg=Bad state: No element
  }
}
