import 'dart:math';

class Ball {
  int _num = 0;
  final Random _rnd;
  final String name;
  final int max;
  final Duration maxTime;

  Ball(this.name, this.max, this.maxTime, this._rnd);

  Future<int> roll() {
    if (_num != 0) {
      return Future.value(_num);
    }
    print('rolling $name ...');
    var delayMs = _rnd.nextInt(maxTime.inMilliseconds);
    return Future.delayed(Duration(milliseconds: delayMs), () {
      _num = _rnd.nextInt(max) + 1;
      print('ball $name result: $_num');
      return _num;
    });
  }
}
