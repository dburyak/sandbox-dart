extension ListExtension<T> on List<T> {
  num sum() {
    if (T == int) {
      return fold(0, (dynamic sum, dynamic it) => sum + it);
    } else if (T == double) {
      return fold(0.0, (dynamic sum, dynamic element) => sum + element);
    } else {
      throw ArgumentError('List must be of type int or double');
    }
  }

  num avg() {
    return sum() / length;
  }

  num max() {
    if (T == int || T == double) {
      return fold(double.negativeInfinity,
          (dynamic max, dynamic it) => max > it ? max : it);
    } else {
      throw ArgumentError('List must be of type int or double');
    }
  }

  num min() {
    if (T == int || T == double) {
      return fold(
          double.infinity, (dynamic min, dynamic it) => min < it ? min : it);
    } else {
      throw ArgumentError('List must be of type int or double');
    }
  }
}
