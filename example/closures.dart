main() {
  print('closures');
  print(['one', 'two', 'three'].map(concatSuffixFn('SUFFIX')));
}

typedef StrSumFn = String Function(String x, String y);
typedef StrMapFn = String Function(String x);

StrMapFn concatSuffixFn(String capturedParam_Suffix) {
  // following closure captures the value of the parameter ^^^
  // but vvv "newFnParam" is a new parameter of the closure caller will specify
  return (String dynParam_Str) => '$dynParam_Str - $capturedParam_Suffix';
}
