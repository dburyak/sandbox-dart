// https://dart.dev/guides/language/language-tour#numbers
// https://dart.dev/guides/language/numbers

// two types: int and double
// int: platform dependent on native, and on web is 64-bit floating without fractional part
// double: always 64-bit floating point

import 'dart:math';
import 'int_extension.dart';

main() {
  var x = 11;
  var y = 3;
  var xDivY = x / y;
  print('abs: ${xDivY.abs()}');
  print('ceil: ${xDivY.ceil()}');
  print('floor: ${xDivY.floor()}');
  print('round: ${xDivY.round()}');
  print('truncate: ${xDivY.truncate()}');
  print('toInt: ${xDivY.toInt()}');
  print('formatted double: ${xDivY.toStringAsFixed(2)}');
  print('pi: $pi');
  print('formatted pi: ${pi.toStringAsFixed(2)}');

  var hex = 0xDEADBEEF;
  var exp = 1.42e5;
  var parsedInt = int.parse('24');
  var parsedDouble = double.parse('24.42');

  print('1 > nan: ${1 > double.nan}');
  print('1 < infinity: ${1 < -double.infinity}');
}
