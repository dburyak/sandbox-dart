import 'package:sandbox_dart/visibility.dart';

void main() {
  final pub = PublicClass();
  print('pub.publicProperty: ${pub.publicProperty}');
  print('pub.publicStaticProperty: ${PublicClass.publicStaticProperty}');
  pub.publicMethod();
  PublicClass.publicStaticMethod();

  /* private members are not accessible from outside the library
  print('pub._privateProperty: ${pub._privateProperty}');
  print('pub._privateStaticProperty: ${PublicClass._privateStaticProperty}');
  pub._privateMethod();
  PublicClass._privateStaticMethod();
   */

}

class ExtendsPublicClassOutsideLibrary extends PublicClass {
}

// Outside library, private members are not accessible and thus do not conform
// public contract of the PublicClass
class ImplementsPublicClassOutsideLibrary implements PublicClass {

  @override
  void publicMethod() {
    // TODO: implement publicMethod
  }

  @override
  // TODO: implement publicProperty
  String get publicProperty => throw UnimplementedError();

}

// Outside library, private members are not accessible and thus do not conform
// public contract of the PublicInterface
class ImplementsPublicInterfaceOutsideLibrary implements PublicInterface {
  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }

  @override
  void publicMethodWithBody() {
    // TODO: implement publicMethodWithBody
  }
}

// Can not extend interface outside library
// Error: The class 'PublicInterface' can't be extended outside of its library because it's an interface class.
// class ExtendsPublicInterfaceOutsideLibrary extends PublicInterface {
//
//   @override
//   void publicAbstractMethod() {
//     // TODO: implement publicAbstractMethod
//   }
// }
