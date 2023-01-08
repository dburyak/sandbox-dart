extension IntExtension on int {
  void times(void Function(int) action) {
    for (var i = 0; i < this; i++) {
      action(i);
    }
  }
}
