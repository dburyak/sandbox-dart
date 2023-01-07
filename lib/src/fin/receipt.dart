import 'receipt_entry.dart';

class Receipt {
  final List<ReceiptEntry> entries;
  final String? currency;

  Receipt(this.entries, {this.currency}) {
    if (entries.isEmpty) {
      throw ArgumentError('entries must not be empty');
    }
    if (currency != null && currency!.isEmpty) {
      throw ArgumentError('currency must not be empty');
    }
  }

  double get total => entries.fold(0, (sum, entry) => sum + entry.price);
}
