import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:sandbox_dart/pack_list.dart';

main() {
  group('PackItem', () => {
    test('name is initialized with constructor param', () {
      // when: create new PackItem with name
      var packItem = new PackItem('name');

      // then: name property is set to constructor param
      expect(packItem.name, 'name');
    })
  });
}
