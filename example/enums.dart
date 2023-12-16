void main() {
  // iterate over ALL enum values:
  for (var value in HttpStatus.values) {
    print('value: $value');
  }

  // error - can't call enum constructor directly
  // const HttpStatus(200, "OK");
}

enum HttpStatus {
  ok(200, 'OK'),
  notFound(404, 'Not Found'),
  internalServerError(500, 'Internal Server Error'),
  badGateway(502, 'Bad Gateway');

  final int _code;
  final String _description;

  const HttpStatus(this._code, this._description);

  int get code => _code;
  String get description => _description;

  @override
  String toString() {
    return 'HttpStatus{code: $code, description: $description}';
  }

  static HttpStatus? fromCode(int code) {
    for (var value in HttpStatus.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}
