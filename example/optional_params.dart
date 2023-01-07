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
}

void printSeveral(String msg1, [String? msg2, String? msg3]) {
  print(msg1);
  print(msg2 ?? 'no msg2 provided');
  print(msg3 ?? 'no msg3 provided');
}

void printSeveralDefault(String msg1,
    [String msg2 = 'no msg2 provided', String msg3 = 'no msg3 provided']) {
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

// TODO: optional named parameters
