part of '../../visibility_library.dart';

class PublicClass {
  final String publicProperty = 'publicProperty';
  final String _privateProperty = 'privateProperty';

  static final String publicStaticProperty = 'publicStaticProperty';
  static final String _privateStaticProperty = 'privateStaticProperty';

  void publicMethod() {
    print('Public method');
  }

  void _privateMethod() {
    print('Private method');
  }

  static void publicStaticMethod() {
    print('Public static method');
  }

  static void _privateStaticMethod() {
    print('Private static method');
  }
}

abstract interface class PublicInterface {
  void publicAbstractMethod();

  void publicMethodWithBody() {
    print('Public method with body');
  }

  void _privateAbstractMethod();

  void _privateMethodWithBody() {
    print('Private method with body');
  }
}

class _PrivateClass {
  final String publicProperty = 'publicProperty';
  final String _privateProperty = 'privateProperty';

  static final String publicStaticProperty = 'publicStaticProperty';
  static final String _privateStaticProperty = 'privateStaticProperty';

  void publicMethod() {
    print('Public method');
  }

  void _privateMethod() {
    print('Private method');
  }

  static void publicStaticMethod() {
    print('Public static method');
  }

  static void _privateStaticMethod() {
    print('Private static method');
  }

  void test() {
    var pub = PublicClass();
    print('pub.publicProperty: ${pub.publicProperty}');
    print('pub.publicStaticProperty: ${PublicClass.publicStaticProperty}');
    pub.publicMethod();
    PublicClass.publicStaticMethod();

    // private members are accessible from the same file (work like "friend classes")
    print('pub._privateProperty: ${pub._privateProperty}');
    print('pub._privateStaticProperty: ${PublicClass._privateStaticProperty}');
    pub._privateMethod();
    PublicClass._privateStaticMethod();
  }
}

// inside the same file private members are accessible and thus conform
// public contract of the PublicClass
class ImplementsPublicClassInSameFile implements PublicClass {

  @override
  void _privateMethod() {
    // TODO: implement _privateMethod
  }

  @override
  // TODO: implement _privateProperty
  String get _privateProperty => throw UnimplementedError();

  @override
  void publicMethod() {
    // TODO: implement publicMethod
  }

  @override
  // TODO: implement publicProperty
  String get publicProperty => throw UnimplementedError();
}

// inside the same file private members are accessible and thus conform
// public contract of the PublicInterface
class ImplementsPublicInterfaceInSameFile implements PublicInterface {

  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }

  @override
  void publicMethodWithBody() {
    // TODO: implement publicMethodWithBody
  }

  @override
  void _privateAbstractMethod() {
    // TODO: implement _privateAbstractMethod
  }

  @override
  void _privateMethodWithBody() {
    // TODO: implement _privateMethodWithBody
  }
}

// -----------------------------------------------------
abstract base class PublicAbstractClass implements PublicInterface {
  void publicAbstractMethod();

  void publicMethodWithBody() {
    print('Public method with body');
  }

  void _privateAbstractMethod();

  void _privateMethodWithBody() {
    print('Private method with body');
  }
}

final class PublicFinalClass extends PublicAbstractClass {
  @override
  void _privateAbstractMethod() {
    // TODO: implement _privateAbstractMethod
  }

  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }
}
