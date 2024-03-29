import 'dart:convert' as dart_convert;

import 'package:json_annotation/json_annotation.dart' as json_annotation;

// must include part 'json.g.dart' here, it will be generated by json_serializable
// to trigger generation run either of:
//  - flutter pub run build_runner build
//  - dart pub run build_runner build

part 'json.g.dart';

void entry() {
  // https://dart.dev/guides/json
  // https://dart.dev/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more
  // 'dart:convert' - converts to maps and lists, doesn't have object mapping
  _jsonAsMapsOrLists();
  _toJsonHook();

  // https://pub.dev/packages/json_serializable
  // json_serializable - converts to DTOs, has object mapping
  _jsonAnnotated();

  // https://pub.dev/packages/built_value
  // doesn't look really good, too much overcomplication for very little benefit
}

_jsonAsMapsOrLists() {
  print('--- _jsonAsMapsOrLists ---');
  var userMap = {'name': 'John Smith', 'email': 'john@example.com', 'age': 27};
  var jsonStr = dart_convert.json.encode(userMap);
  // alternative way:
  // var jsonStr = jsonEncode(jsonStr);
  print('map=>jsonStr: $jsonStr');

  var userMap2 = dart_convert.json.decode(jsonStr);
  // alternative way:
  // var userMap2 = jsonDecode(jsonStr);
  print('jsonStr=>map: $userMap2');
  print('decoded map type: ${userMap2.runtimeType}');

  var usersList = [
    {'name': 'John Smith', 'email': 'john.smith@example.com', 'age': 27},
    {'name': 'Jane Doe', 'email': 'jane.doe@example.com', 'age': 28},
  ];
  var jsonStr2 = dart_convert.json.encode(usersList);
  print('list=>jsonStr: $jsonStr2');

  var usersList2 = dart_convert.json.decode(jsonStr2);
  print('jsonStr=>list: $usersList2');
  print('decoded list type: ${usersList2.runtimeType}');
}

_toJsonHook() {
  print('--- _toJsonHook ---');
  var user = UserPlainDto('John Smith', 'john.smith@example.com', 23);
  var jsonStr = dart_convert.json.encode(user);
  print('user=>jsonStr: $jsonStr');
}

class UserPlainDto {
  final String name;
  final String email;
  final int age;

  UserPlainDto(this.name, this.email, this.age);

  // define this method to make any object (besides Map, List, int, String, bool, null)
  // be serializable to JSON with "dart:convert" library
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
    };
  }
}

_jsonAnnotated() {
  print('--- _jsonAnnotated ---');
  var user = UserAnnotatedDto('John Smith', 'john.smith@example.com', 23, 'optional');
  var jsonStr = dart_convert.json.encode(user);
  print('user=>jsonStr: $jsonStr');

  var user2 = UserAnnotatedDto.fromJson(dart_convert.json.decode(jsonStr));
  print('jsonStr=>user: $user2');
  print('decoded user type: ${user2.runtimeType}');

  // without optional field
  var user3 = UserAnnotatedDto('John Smith', 'john.smith@example.com', 23, null);
  var jsonStr3 = dart_convert.json.encode(user3);
  print('user3=>jsonStr: $jsonStr3');

  var user4 = UserAnnotatedDto.fromJson(dart_convert.json.decode(jsonStr3));
  print('jsonStr=>user4: $user4');
  print('decoded user4 type: ${user4.runtimeType}');
}

@json_annotation.JsonSerializable()
class UserAnnotatedDto {
  // required values in json
  final String name;
  final String email;
  final int age;

  // optional value in json
  final String? optionalProp;

  UserAnnotatedDto(this.name, this.email, this.age, this.optionalProp);

  // json_serializable generates methods:
  //  _$<CLASS_NAME>FromJson(Map<String, dynamic> json)
  //  Map<String, dynamic> _$<CLASS_NAME>ToJson(<CLASS_NAME> instance)

  // factory constructor to deserialize from json
  factory UserAnnotatedDto.fromJson(Map<String, dynamic> json) => _$UserAnnotatedDtoFromJson(json);

  // method to serialize to json
  Map<String, dynamic> toJson() => _$UserAnnotatedDtoToJson(this);
}
