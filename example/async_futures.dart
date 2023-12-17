import 'dart:async';
import 'dart:math';

import 'package:sandbox_dart/async_futures.dart';

void main() {
  // no callback hell
  print('--- futures sequential ---');
  futureLotterySequential(100, Duration(seconds: 3)).then((_) {
    print('--- futures parallel ---');
    return futureLotteryParallel(5, 100, Duration(seconds: 3));
  }).then((_) {
    print('--- futures parallel again ---');
    return futureLotteryParallel(5, 100, Duration(seconds: 3));
  }).then((_) {
    print('--- microtasks ---');
    // TODO: microtasks example
  }).then((_) {
    print('--- done ---');
  });
}

Future<void> futureLotterySequential(int maxNum, Duration maxTime) {
  var numBalls = 3;
  var rnd = Random();
  var balls = List.generate(numBalls, (i) => Ball("seq-${i + 1}", maxNum, maxTime, rnd));
  var res = <int>[];
  return balls[0].roll().then((b1) {
    res.add(b1);
    return balls[1].roll();
  }).then((b2) {
    res.add(b2);
    return balls[2].roll();
  }).then((b3) {
    res.add(b3);
    print('sequential result: $res');
  });
}

Future<void> futureLotteryParallel(int numBalls, int maxNum, Duration maxTime) {
  var rnd = Random();
  var balls = List.generate(numBalls, (i) => Ball("prl-${i + 1}", maxNum, maxTime, rnd));
  return Future.wait(balls.map((ball) => ball.roll())).then((values) {
    print('parallel result: $values');
  });
}
