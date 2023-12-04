import 'int_extension.dart';
import 'list_extensions.dart';
import 'string_extension.dart';

main() {
  5.times(print);
  5.times((i) => print('Hello $i'));
  5.times((i) {
    print('one $i');
    print('two $i');
  });
  5.times((_) {
    print('one');
    print('two');
  });

  print('  42   '.toInt());
  print('  42.42  '.toDouble());

  print('true'.toBool());
  print('TRUE'.toBool());
  print(('t' 'r' 'u' 'e').toBool());
  var trueStr = 't';
  if (1 > 0) {
    trueStr += 'r';
  }
  trueStr += 'ue';
  print(trueStr.toBool());

  print('sum: ${[1, 2, 3, 4, 5].sum()}');
  print('sum: ${[1.1, 2.1, 3.1, 4.1, 5.1].sum()}');
  print('avg: ${[1, 2, 3, 4, 5].avg()}');
  print('avg: ${[1.1, 2.1, 3.1, 4.1, 5.1].avg()}');
  print('min: ${[1, 2, 3, 4, 5].min()}');
  print('min: ${[1.1, 2.1, 3.1, 4.1, 5.1].min()}');
  print('max: ${[1, 2, 3, 4, 5].max()}');
  print('max: ${[1.1, 2.1, 3.1, 4.1, 5.1].max()}');

  print('join: ${['1', '2', '3', '4', '5'].join('||')}');

  print(StringExtension('42').toInt());

  // using operators from list extension
  var list = [1, 2, 3, 4, 5];
  print('list: $list');
  print('list + [6, 7, 8]: ${list + [6, 7, 8]}');
  print('list - [2, 4, 6]: ${list - [2, 4, 6]}');
  print('list * 3: ${list * 3}');
  list << 6;
  list << 7;
  list << 8;
  print('list << 6 << 7 << 8: $list');
}
