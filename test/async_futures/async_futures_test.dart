import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:sandbox_dart/async_futures.dart';

@GenerateNiceMocks([MockSpec<Random>()])
import 'async_futures_test.mocks.dart';

main() {
  group('group', () {
    test('description', () async {
      // given
      final maxDelayMs = 100;
      final delayMs = 1;
      final maxBallNum = 10;
      final ballNum = 5;
      final _rnd = MockRandom();
      when(_rnd.nextInt(maxDelayMs)).thenReturn(delayMs);
      when(_rnd.nextInt(maxBallNum)).thenReturn(ballNum - 1);
      final ball = Ball('test-ball', 10, Duration(milliseconds: 50), _rnd);

      // when
      final rollRes = await ball.roll();

      // then
      expect(rollRes, ballNum);
    });
  });
}
