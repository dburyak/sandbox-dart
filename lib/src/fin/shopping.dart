import 'purchase.dart';

class Shopping {
  final List<Purchase> purchases;

  Shopping(this.purchases) {
    if (purchases.isEmpty) {
      throw ArgumentError('purchases must not be empty');
    }
  }
}
