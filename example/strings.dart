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

  print('concat' + ' with' + ' plus' + ' operator');

  const list = ['one', 'two', 'three'];
  // const str = 'one, two, three $list}'; // ERROR: not a constant expression
  // In constant expressions, operands of this operator must be of type 'bool', 'num', 'String' or 'null'.

  // OPERATIONS
  var str = 'one, two, three';
  var chAt5 = str[5];
  print('str[5] = $chAt5');
  print('str[5].type = ${chAt5.runtimeType}');
  List<String> parts = str.split(', ');
  print('parts = $parts');
  // to iterate over chars - use ".split('')"
  for (var ch in 'word'.split('')) {
    print('ch = $ch');
  }
  // to get utf-16 code units - use ".codeUnits"
  for (var codeUnit in 'word'.codeUnits) {
    print('codeUnit = $codeUnit [${codeUnit.runtimeType}]');
  }

  // StringBuffer - building string from pieces
  var sb = StringBuffer();
  sb..write('one')
    ..write(', ')
    ..write('two')
    ..write(', ')
    ..write('three');
  var sbStr = sb.toString(); // this builds the string
  print('sb = $sbStr');
}
