// NOTE: seems that typedefs hit some limitation and were modernized to
// "generic function type alias", it's recommended to use them instead:
// typedef IntToIntFn = int Function(int x);

// typedefs work for function definitions - basically just an alias to
// a function signature with specific parameters and return type

// typedefs can be global only (global in library), can't be local inside other
// functions or classes

main() {
  IntToIntFnDeprecated plus10 = (x) => x + 10;
  print(mapIntWithFn([1, 2, 3], plus10));
  print(mapIntWithFn([1, 2, 3], (x) => x + 10)); // in-place anonymous fn
  print(mapStrWithFn(['one', 'three'], (it) => '$it - ${it.length}'));
  print(mapStrWithFn2(['one', 'three'], (it) => '$it - ${it.length}'));
  print(mapStrWithFn3(['one', 'three'], (it) => '$it - ${it.length}'));
}

// DEPRECATED:
typedef int IntToIntFnDeprecated(int x);

Iterable<int> mapIntWithFn(Iterable<int> intList, IntToIntFnDeprecated mapper) {
  return intList.map(mapper);
}

// CORRECT:
typedef StrToStrFn = String Function(String x);

Iterable<String> mapStrWithFn(Iterable<String> strList, StrToStrFn mapper) {
  return strList.map(mapper);
}

// OR just declare it in-place:
Iterable<String> mapStrWithFn2(
    Iterable<String> strList, String mapper(String)) {
  return strList.map(mapper);
}

// OR using "Function" type:
Iterable<String> mapStrWithFn3(
    Iterable<String> strList, String Function(String) mapper) {
  return strList.map(mapper);
}
