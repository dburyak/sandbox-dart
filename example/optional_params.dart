main() {
  print('------------------');
  printSeveral('msg1');
  print('------------------');
  printSeveral('msg1', 'msg2');
  print('------------------');
  printSeveral('msg1', 'msg2', 'msg3');
  print('****************************************************************');
  printSeveralDefault('msg1');
  print('------------------');
  printSeveralDefault('msg1', 'msg2');
  print('------------------');
  printSeveralDefault('msg1', 'msg2', 'msg3');
  print('****************************************************************');
  printSeveralDefaultDyn('msg1');
  print('------------------');
  printSeveralDefaultDyn('msg1', 'msg2');
  print('------------------');
  printSeveralDefaultDyn('msg1', 'msg2', 'msg3');
  print('****************************************************************');
  printSeveralNamed('msg1');
  print('------------------');
  printSeveralNamed('msg1', msg2: 'msg2');
  print('------------------');
  printSeveralNamed('msg1', msg3: 'msg3');
  print('------------------');
  printSeveralNamed('msg1', msg2: 'msg2', msg3: 'msg3');
}

void printSeveral(String msg1, [String? msg2, String? msg3]) {
  print(msg1);
  print(msg2 ?? 'no msg2 provided');
  print(msg3 ?? 'no msg3 provided');
}

void printSeveralDefault(String msg1,
    [String msg2 = 'no msg2 provided', String msg3 = 'no msg3 provided']) {
  // NOTE: default values should be compile-time constants
  print(msg1);
  print(msg2);
  print(msg3);
}

void printSeveralDefaultDyn(msg1,
    [msg2 = 'no msg2 provided', msg3 = 'no msg3 provided']) {
  print(msg1);
  print(msg2);
  print(msg3);
}

void printSeveralNamed(String msg1, {String? msg2, String? msg3}) {
  print(msg1);
  print(msg2 ?? 'no msg2 provided');
  print(msg3 ?? 'no msg3 provided');
}

void printSeveralNamedDefault(String msg1,
    {String msg2 = 'no msg2 provided', String msg3 = 'no msg3 provided'}) {
  print(msg1);
  print(msg2);
  print(msg3);
}

void printSeveralNamedDyn(msg1, {msg2, msg3}) {
  print(msg1);
  print(msg2 ?? 'no msg2 provided');
  print(msg3 ?? 'no msg3 provided');
}

void printSeveralNamedDefaultDyn(msg1,
    {msg2 = 'no msg2 provided', msg3 = 'no msg3 provided'}) {
  print(msg1);
  print(msg2);
  print(msg3);
}

// required
void namedRequired({String msg1 = 'not provided', required String msg2}) {
  print(msg1);
  print(msg2);
}

void namedRequiredNullable({String? msg1, required String? msg2}) {
  print(msg1 ?? 'no msg1 provided');
  print(msg2 ?? 'no msg2 provided');
}
