import 'receipt.dart';
import 'payment.dart';

class Purchase {
  final Receipt? receipt;
  final Payment? payment;

  Purchase(this.receipt, this.payment) {
    if (receipt == null && payment == null) {
      throw ArgumentError('receipt and payment must not both be null');
    }
  }
}
