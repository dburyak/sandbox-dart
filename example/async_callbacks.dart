import 'dart:math';

import 'package:sandbox_dart/async_callbacks.dart';

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

// -- callback style --
void callbackLotterySequential(int maxNum, Duration maxTime, Function(List<int>) resHandler) {
  var numBalls = 5;
  var rnd = Random();
  var balls = List.generate(numBalls, (i) => Ball("seq-${i + 1}", maxNum, maxTime, rnd));
  var res = <int>[];
  balls[0].roll((b1) {
    res.add(b1);
    balls[1].roll((b2) {
      res.add(b2);
      balls[2].roll((b3) {
        res.add(b3);
        balls[3].roll((b4) {
          res.add(b4);
          balls[4].roll((b5) {
            res.add(b5);
            print('sequential result: $res');
            resHandler(res);
          });
        });
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
