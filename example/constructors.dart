import 'dart:convert';

void main() {
  // default no-arg constructor
  var somethingMutable = SomethingMutable();
  somethingMutable.str = 'Hello';
  somethingMutable.num = 42;

  // named constructors
  // case 1: simple
  var person1 = Person('John', 'Doe', 30);
  var person2 = Person.fromJson({'firstName': 'John', 'lastName': 'Doe', 'age': 30});
  var person3 = Person.fromJsonString('{"firstName": "John", "lastName": "Doe", "age": 30}');

  // case 2: complex
  var dbClient1 = DbClient(host: 'localhost', port: 3306, user: 'user', password: 'password', database: 'database');
  var dbClient2 = DbClient.fromUri('mysql://user:password@host:3306/database');
  // private helper constructor won't be visible outside of this file
  // DbClient._((host: 'localhost', port: 3306, user: 'user', password: 'password', database: 'database'));

  // factory constructors
  // case 1: caching - factory constructor can return an existing instance
  var dbClient3 = DbClient.cachedFromUri('mysql://user:password@host:3306/database');

  // case 2: default impl - factory constructor can be used to provide default implementation of interface
  var someObj = SomeInterface();
  print("someObj: $someObj"); // Instance of 'SomeClass'

  // const constructor
  const authError1 = AuthError(1, 'message');
  const authError2 = AuthError(1, 'message');
  print('authError1 == authError2: ${authError1 == authError2}'); // true
  print('authError1.hashCode == authError2.hashCode: ${authError1.hashCode == authError2.hashCode}'); // true
  print('identical(authError1, authError2): ${identical(authError1, authError2)}'); // true

  // const constructor may be accidentally used without const keyword
  var authError3 = AuthError(1, 'message');
  var authError4 = AuthError(1, 'message');
  print('authError3 == authError4: ${authError3 == authError4}'); // false
  print('authError3.hashCode == authError4.hashCode: ${authError3.hashCode == authError4.hashCode}'); // false
  print('identical(authError3, authError4): ${identical(authError3, authError4)}'); // false
  // == and hashCode checks would be "true" if we implemented them in AuthError class
}

class SomethingMutable {
  String str = '';
  int num = 0;

// no-arg constructor is generated automatically if no other constructors
// are defined
}

class Person {
  String firstName;
  String lastName;
  int age;

  Person(this.firstName, this.lastName, this.age);

  Person.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        age = json['age'];

  Person.fromJsonString(String json) : this.fromJson(jsonDecode(json));

  // factory constructor
  factory Person.fromJsonFactory(String json) {
    return Person.fromJson(jsonDecode(json));
  }
}

// named args example with complex logic needed in constructor, when you need a shared object to calculate
// field values. In this case we need regex pattern and match (stateful) object to calculate the fields.

typedef _DbClientParams = ({String host, int port, String user, String password, String database});

class DbClient {
  static final Map<String, DbClient> _cache = {};
  final String _host;
  final int _port;
  final String _user;
  final String _password;
  final String _database;

  // regular named args constructor, just for example
  DbClient(
      {required String host,
      required int port,
      required String user,
      required String password,
      required String database})
      : _host = host,
        _port = port,
        _user = user,
        _password = password,
        _database = database;

  // private helper constructor - allows other constructors to perform complex init logic and then
  // delegate to this constructor
  DbClient._(_DbClientParams params)
      : _host = params.host,
        _port = params.port,
        _user = params.user,
        _password = params.password,
        _database = params.database;

  DbClient.fromUri(String uri) : this._(_fromUri(uri));

  factory DbClient.fromUriFactory(String uri) {
    // All helper static logic can be placed right here, no need for separate static method with factory constructor.
    // This is a simpler approach compared to private helper constructor but factory constructor can't be
    // called (chained) from other constructors, neither from subclasses. Hence, such approach can't be used for
    // classes intended to be subclassed.
    if (!uri.startsWith('mysql://')) {
      throw ArgumentError('uri must start with mysql://');
    }
    var params = _fromUri(uri);
    return DbClient(
        host: params.host, port: params.port, user: params.user, password: params.password, database: params.database);
  }

  factory DbClient.cachedFromUri(String uri) {
    // factory constructor can return an existing instance
    if (_cache.containsKey(uri)) {
      return _cache[uri]!;
    }
    var dbClient = DbClient.fromUri(uri);
    _cache[uri] = dbClient;
    return dbClient;
  }

  static _DbClientParams _fromUri(String uri) {
    var pattern = RegExp(r"mysql://([a-zA-Z0-9]+):([a-zA-Z0-9]+)@([a-zA-Z0-9]+):([0-9]+)/([a-zA-Z0-9]+)");
    var match = pattern.firstMatch(uri);
    if (match == null) {
      throw ArgumentError('Could not parse uri');
    }
    var user = match.group(1)!;
    var password = match.group(2)!;
    var host = match.group(3)!;
    var port = int.parse(match.group(4)!);
    var database = match.group(5)!;
    return (
      host: host,
      port: port,
      user: user,
      password: password,
      database: database,
    );
  }
}

// factory constructor can be used to provide default implementation
abstract interface class SomeInterface {
  void doSomething();

  factory SomeInterface() {
    return SomeClass('hello');
  }
}

class SomeClass implements SomeInterface {
  final String someProperty;

  SomeClass(this.someProperty);

  @override
  void doSomething() {
    print('doSomething');
  }
}

class AuthError {
  final int code;
  final String message;

  const AuthError(this.code, this.message);
}
