main() {
  final fn1Ref = fn1;
  final fn2Ref = fn2;
  final fn3Ref = print;
  print('fn1Ref: ref=$fn1Ref');
  print('fn2Ref: isObject=${fn2Ref is Object}');
  print('fn3Ref: isFunction=${fn3Ref is Function}');
  print('print function: ref=$print');
  print(map(['one', 'two', 'three'], (it) => '$it - ${it.length}'));

  // classic usage of anonymous functions
  print(['one', 'two', 'three'].map((it) => '$it - ${it.length}'));
  print(mapMany(['one', 'two', 'three'], [
    (String it) => '$it - ${it.length}',
    (String it) => '$it - ***',
    (String it) => '$it - xxx',
    (String it) => '$it - |||',
  ]));
}

void fn1() {}

void fn2(String msg) {
  print(msg);
}

List<String> map(List<String> list, String Function(String) mapFn) {
  final result = <String>[];
  for (final item in list) {
    result.add(mapFn(item));
  }
  return result;
}

Function getModifier(int x) {
  inc(it) => it + 1;
  dec(it) => it - 1;
  return x % 2 == 0 ? inc : dec;
}

Function getRecursiveModifier(int x) {
  inc(it) => it + 1;
  dec(it) => it - 1;
  return x % 2 == 0 ? inc : getRecursiveModifier(dec(x));
}

Iterable<int> incAllAnonymous(List<int> list) {
  // anonymous function has no name so it can NOT recursively call itself
  final inc = (int it) => it + 1;
  return list.map(inc);
}

Iterable<String> mapMany(
    List<String> list, List<String Function(String)> mapFns) {
  Iterable<String> result = list;
  for (final mapFn in mapFns) {
    result = result.map(mapFn);
  }
  return result;
}

Iterable<String> mangle(List<String> list) {
  String mangleLocal(String it) {
    return '$it - ${it.length}';
  }
  final mangler = mangleLocal;
  return list.map(mangler);
}
