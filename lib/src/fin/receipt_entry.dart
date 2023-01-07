class ReceiptEntry {
  final String name;
  final double price;

  ReceiptEntry(this.name, this.price) {
    if (name.isEmpty) {
      throw ArgumentError('Name must not be empty');
    }
    if (price < 0) {
      throw ArgumentError('Price must be positive');
    }
  }
}
