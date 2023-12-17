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
    // EL has 2 queues: microtasks and regular tasks
    // all microtasks are executed before the next regular event-loop cycle
    // microtasks are useful for scheduling small portions of async work that
    // either:
    //  - need to be done as continuation of the current EL cycle
    //  - multiple microtasks need to be executed as a single undivisible unit,
    //    as an operation which is atomic from the standpoint of the regular
    //    event-loop tasks (f.e. multiple state changes in a single UI update)
    var f1 = Future(() => print('f1'));
    var m1 = Future.microtask(() => print('m1'));
    var f2 = Future(() => print('f2'));
    var m2 = Future.microtask(() => print('m2'));
    var f3 = Future(() => print('f3'));
    var m3 = Future.microtask(() => print('m3'));
    // m1, m2, m3, f1, f2, f3
    // microtasks are executed before the next regular event-loop cycle
    return Future.wait([f1, m1, f2, m2, f3, m3]);
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
