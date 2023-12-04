void main() {
  late Iterable<String> iterable;
  iterable = ['a', 'b', 'c'];
  assert(iterable is List<String>);

  List<String> asList = iterable as List<String>;
  assert(asList.length == 3);
}
