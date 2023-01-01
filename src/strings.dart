main() {
  print('single quoted string');
  print('single quoted string with "double quotes"');
  print("double quoted string");
  print("double quoted string with 'single quotes'");
  print('single quoted string with \'escaped single quotes\'');
  print("double quoted string with \"escaped double quotes\"");
  print('single quoted string with interpolated ${1 + 2}');
  print("double quoted string with interpolated ${1 + 2}");
  print('concatenated string: ' 'one ' 'two ' 'three');
  print('--------------------------');
  print("""
multi-line string
second line ...
...
last line""");
  print('--------------------------');
  print('''
  multi-line string
  with single
  quotes
  ''');
  print('--------------------------');
  print(r'raw string with \backslashes\ and ${no interpolation}');
}
