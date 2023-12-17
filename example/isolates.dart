import 'dart:convert';
import 'dart:isolate';

void main() async {
  // isolates are completely isolated from each other, each has its own memory
  // and can only communicate via messages
  // each isolate has its own event loop
  // it means that static and global variables are not shared between isolates,
  // each isolate has its own copy of static and global variables

  // sets static variables to 4 in current isolate (main)
  incrementAndPrint(4);

  // creates short-lived isolate to run given function only, when function
  // finishes, isolate is killed automatically
  // isolate has its own memory and static vars will have 6 in this isolate
  await Isolate.run(() => incrementAndPrint(6), debugName: 'run-1');

  // creates long-lived isolate, which can only be killed manually
  var spawnIsolate = await Isolate.spawn(incrementAndPrint, 11, debugName: 'spawn-1');
  await Future.delayed(Duration(milliseconds: 500));
  spawnIsolate.kill();

  var fromParser = ReceivePort('from-parser');
  var parserIsolate =
      await Isolate.spawn(jsonParseIsolate, fromParser.sendPort, errorsAreFatal: true, debugName: 'json');
  late SendPort toParser;
  var jsonStr1 = '{"key1":"value1", "key2":"value2"}';
  var jsonStr2 = '{"key3":"value3", "key4":"value4"}';
  var jsonStr3 = '{"key5":"value5", "key6":"value6"}';
  await for (var msg in fromParser) {
    if (msg is SendPort) {
      toParser = msg;
      toParser.send(jsonStr1);
      toParser.send(jsonStr2);
      toParser.send(jsonStr3);
      toParser.send(Event.stop);
    } else if (msg is Event) {
      switch (msg) {
        case Event.stop:
          fromParser.close();
          break;
      }
    } else {
      print('received parsed json: type=${msg.runtimeType}, value=$msg');
    }
  }

  parserIsolate.kill();
  print('--- done ---');
}

class SampleClass {
  static int staticProp = 0;
}

int globalProp = 0;

void incrementAndPrint(int inc) {
  SampleClass.staticProp += inc;
  globalProp += inc;
  print('{${Isolate.current.debugName}} staticProp: ${SampleClass.staticProp}, globalProp: $globalProp');
}

void jsonParseIsolate(SendPort toCaller) {
  var fromCaller = ReceivePort('from-parser-caller');
  toCaller.send(fromCaller.sendPort);
  fromCaller.listen((jsonStr) {
    if (jsonStr is Event) {
      switch (jsonStr) {
        case Event.stop:
          fromCaller.close();
          toCaller.send(Event.stop);
          break;
      }
      return;
    }
    var json = jsonDecode(jsonStr as String);
    toCaller.send(json);
  });
}

enum Event {
  stop;
}
