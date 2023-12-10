import 'package:sandbox_dart/json.dart' as json;

void main() {
  // https://dart.dev/guides/json
  // https://github.com/google/json_serializable.dart/tree/master/example/lib
  json.entry();

  // NOTE: seems that code inside "example" directory is not processed by
  // "build_runner", so we can't use json_serializable here as it relies on
  // annotation processing and code generation
}
