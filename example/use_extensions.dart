import 'int_extension.dart';
import 'string_extension.dart';
import 'list_extensions.dart';

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
  print('sum: ${['1', '2', '3', '4', '5'].sum()}');
  print('join: ${['1', '2', '3', '4', '5'].join('||')}');

  print(StringExtension('42').toInt());
}
