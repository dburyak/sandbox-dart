import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sandbox_dart/async_callbacks.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<Random>()])
import 'async_callbacks_test.mocks.dart';

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
      ball.roll(expectAsync1((rollRes) {

        // then
        expect(rollRes, ballNum);
      }));

    });
  });
}
