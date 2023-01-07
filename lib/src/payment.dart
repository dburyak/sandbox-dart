class Payment {
  final double amount;
  final String? currency;

  Payment(this.amount, {this.currency}) {
    if (amount < 0) {
      throw ArgumentError('amount must be positive');
    }
    if (currency != null && currency!.isEmpty) {
      throw ArgumentError('currency must not be empty');
    }
  }
}
