extension StringExtension on String {
  int toInt() {
    return int.parse(this);
  }

  double toDouble() {
    return double.parse(this);
  }

  bool toBool() {
    return toLowerCase() == 'true';
  }
}
