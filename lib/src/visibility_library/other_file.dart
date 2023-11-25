// Other parts of the library are implicitly imported, and it seems that
// dart kind of builds one big file from all the parts of the library.
// So all all the private members of other parts are visible in this part file.
// It works differently from recommended way of defining a library in Dart3.
part of '../../visibility_library.dart';

void main() {
  final pub = PublicClass();
  print('pub.publicProperty: ${pub.publicProperty}');
  print('pub.publicStaticProperty: ${PublicClass.publicStaticProperty}');
  pub.publicMethod();
  PublicClass.publicStaticMethod();

  // Unlike in recommended way of defining a library, private members are
  // accessible from other parts files in "part of" style.
  print('pub._privateProperty: ${pub._privateProperty}');
  print('pub._privateStaticProperty: ${PublicClass._privateStaticProperty}');
  pub._privateMethod();
  PublicClass._privateStaticMethod();

  // also private classes from other files are visible
  final priv = _PrivateClass();
  print('priv.publicProperty: ${priv.publicProperty}');
  print('priv.publicStaticProperty: ${_PrivateClass.publicStaticProperty}');
  _PrivateClass.publicStaticMethod();
  priv.publicMethod();
  print('priv._privateProperty: ${priv._privateProperty}');
  priv._privateMethod();
}

// In different file private members are not accessible and thus do not conform
// public contract of the PublicClass
class ImplementsPublicClassInOtherFile implements PublicClass {
  @override
  void publicMethod() {
    // TODO: implement publicMethod
  }

  @override
  // TODO: implement publicProperty
  String get publicProperty => throw UnimplementedError();

  // in "part of" style we have to implement private members too as they
  // are visible
  @override
  void _privateMethod() {
    // TODO: implement _privateMethod
  }

  @override
  // TODO: implement _privateProperty
  String get _privateProperty => throw UnimplementedError();
}

// In different file private members are not accessible and thus do not conform
// public contract of the PublicInterface
class ImplementsPublicInterfaceInOtherFile implements PublicInterface {
  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }

  @override
  void publicMethodWithBody() {
    // TODO: implement publicMethodWithBody
  }

  // in "part of" style we have to implement private members too as they
  // are visible
  @override
  void _privateAbstractMethod() {
    // TODO: implement _privateAbstractMethod
  }

  @override
  void _privateMethodWithBody() {
    // TODO: implement _privateMethodWithBody
  }
}

// This case is different from recommended way of defining a library in Dart3.
// Since dart "merges" all parts in one virtual big file, it is possible to
// extend an interface outside of the original file. "publicMethodWithBody" and
// "_privateMethodWithBody" methods implementations are pulled
// from "PublicInterface".
class ExtendsPublicInterfaceInOtherFile extends PublicInterface {
  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }

  @override
  void _privateAbstractMethod() {
    // TODO: implement _privateAbstractMethod
  }
}
