import 'dart:math';

void main() {
  _callbackSequential(() {
    _callbackParallel(() {
      print('--- done ---');
    });
  });
}

_callbackSequential(Function next) {
  print('--- callback sequential ---');
  callbackLotterySequential(100, Duration(seconds: 3), (res) {
    print('callback sequential result: $res');
    next();
  });
}

_callbackParallel(Function next) {
  print('--- callback parallel ---');
  callbackLotteryParallel(5, 100, Duration(seconds: 3), (res) {
    print('callback parallel result: $res');
    next();
  });
}

class Ball {
  int _num = 0;
  final Random _rnd;
  final String name;
  final int max;
  final Duration maxTime;

  Ball(this.name, this.max, this.maxTime, this._rnd);

  void roll(Function(int) resHandler) {
    if (_num != 0) {
      resHandler(_num);
      return;
    }
    print('rolling $name ...');
    var delayMs = _rnd.nextInt(maxTime.inMilliseconds);
    Future.delayed(Duration(milliseconds: delayMs), () {
      _num = _rnd.nextInt(max) + 1;
      print('ball $name result: $_num');
      resHandler(_num);
    });
  }
}

// -- callback style --
void callbackLotterySequential(int maxNum, Duration maxTime, Function(List<int>) resHandler) {
  var numBalls = 3;
  var rnd = Random();
  var balls = List.generate(numBalls, (i) => Ball("seq-${i + 1}", maxNum, maxTime, rnd));
  var res = <int>[];
  balls[0].roll((b1) {
    res.add(b1);
    balls[1].roll((b2) {
      res.add(b2);
      balls[2].roll((b3) {
        res.add(b3);
        resHandler(res);
      });
    });
  });
}

void callbackLotteryParallel(int numBalls, int maxNum, Duration maxTime, Function(List<int>) resHandler) {
  var rnd = Random();
  var balls = List.generate(numBalls, (i) => Ball("prl-${i + 1}", maxNum, maxTime, rnd));
  var res = <int>[];
  for (var ball in balls) {
    ball.roll((b) {
      res.add(b);
      if (res.length == numBalls) {
        resHandler(res);
      }
    });
  }
}
