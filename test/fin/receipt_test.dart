import 'package:sandbox_dart/fin.dart';
import 'package:test/test.dart';

main() {
  group('Receipt', () {
    test('total calculates the total price of all entries', () {
      // given: a receipt with several entries
      final priceMilk = 1.5;
      final priceBread = 2.0;
      final priceButter = 3.0;
      final receipt = Receipt([
        ReceiptEntry('Milk', priceMilk),
        ReceiptEntry('Bread', priceBread),
        ReceiptEntry('Butter', priceButter),
      ]);

      // when: calculating the total price
      final total = receipt.total;

      // then: the total price is the sum of all entry prices
      expect(total, priceMilk + priceBread + priceButter);
    });
  });
}
