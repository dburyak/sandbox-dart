main() {
  final withUnderscores = 'some test string'.replaceAll(RegExp(r'\s'), '_');
  print(withUnderscores);

  // iterate over matches
  final regex = RegExp(r'\b\w+\b');
  final text = 'some test string';
  for (final match in regex.allMatches(text)) {
    print(match.group(0));
  }

  // groups
  final regex2 = RegExp(r'(?<key>\w+):(?<value>\w+)');
  final text2 = 'key1:value1 key2:value2';
  for (final match in regex2.allMatches(text2)) {
    print('whole match: ${match.group(0)}');
    print('by named groups: ${match.namedGroup('key')} = ${match.namedGroup('value')}');
    print('by index: ${match.group(1)} = ${match.group(2)}');
  }

  // first match
  final regex3 = RegExp(r'\b\w+\b');
  final text3 = 'some test string';
  final match = regex3.firstMatch(text3);
  print(match?.group(0) ?? 'no match');
}
