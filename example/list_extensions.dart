extension ListExtension<T> on List<T> {
  num sum() {
    if (T == int) {
      return fold(0, (dynamic sum, dynamic it) => sum + it);
    } else if (T == double) {
      return fold(0.0, (dynamic sum, dynamic element) => sum + element);
    } else {
      return fold(0.0, (dynamic sum, dynamic it) {
        return double.parse(sum.toString()) + double.parse(it.toString());
      });
    }
  }

  num avg() {
    return sum() / length;
  }

  String join([String separator = '']) {
    return fold('', (dynamic sum, dynamic it) {
      if (sum.isEmpty) {
        return it.toString();
      } else {
        return '$sum$separator$it';
      }
    });
  }
}
