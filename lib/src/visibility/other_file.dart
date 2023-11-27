import 'visibility.dart';

void main() {
  final pub = PublicClass();
  print('pub.publicProperty: ${pub.publicProperty}');
  print('pub.publicStaticProperty: ${PublicClass.publicStaticProperty}');
  pub.publicMethod();
  PublicClass.publicStaticMethod();
  handlePublicClass(pub);

  /* private members are not accessible from other files
  print('pub._privateProperty: ${pub._privateProperty}');
  print('pub._privateStaticProperty: ${PublicClass._privateStaticProperty}');
  pub._privateMethod();
  PublicClass._privateStaticMethod();
   */

  /* Edge case: PublicClass has private members and in the same file there is
  a code (handlePublicClass) that relies on them. In this file we "implement"
  PublicClass as interface and only specify visible public members (not private)
  and then pass it to handlePublicClass. This will fail at runtime. Compiler
  does not complain as it does not know about private members of PublicClass.

  Practically, feature of "use any class as interface" is broken. Or at least
  is not reliable.

  final pubImpl = ImplementsPublicClassInOtherFile();
  handlePublicClass(pubImpl);

  throws:
  NoSuchMethodError: Class 'ImplementsPublicClassInOtherFile' has no instance getter '_privateProperty'.
  Receiver: Instance of 'ImplementsPublicClassInOtherFile'
  Tried calling: _privateProperty
  #0      ImplementsPublicClassInOtherFile._privateProperty (package:sandbox_dart/src/visibility/other_file.dart:28:7)
  #1      handlePublicClass (package:sandbox_dart/src/visibility/visibility.dart:7:38)
   */



  /* Same here. Interface defines private members that are used in the same
  file. And we provide an implementation that does not have private members.
  Compiler doesn't detect this error.

  final pubInterfaceImpl = ImplementsPublicInterfaceInOtherFile();
  handlePublicInterface(pubInterfaceImpl);

  throws:
  NoSuchMethodError: Class 'ImplementsPublicInterfaceInOtherFile' has no instance method '_privateAbstractMethod'.
  Receiver: Instance of 'ImplementsPublicInterfaceInOtherFile'
  Tried calling: _privateAbstractMethod()
  #0      ImplementsPublicInterfaceInOtherFile._privateAbstractMethod (package:sandbox_dart/src/visibility/other_file.dart:58:7)
  #1      handlePublicInterface (package:sandbox_dart/src/visibility/visibility.dart:17:7)
  */
}

// In different file private members are not accessible and thus do not conform
// public contract of the PublicClass
class ImplementsPublicClassInOtherFile implements PublicClass {
  @override
  void publicMethod() {
    print("$runtimeType.publicMethod");
  }

  @override
  String get publicProperty => "$runtimeType.publicProperty";
}

// In different file private members are not accessible and thus do not conform
// public contract of the PublicInterface
class ImplementsPublicInterfaceInOtherFile implements PublicInterface {
  @override
  void publicAbstractMethod() {
    print("$runtimeType.publicAbstractMethod");
  }

  @override
  void publicMethodWithBody() {
    print("$runtimeType.publicMethodWithBody");
  }
}

// Can not extend interface outside of ... original file??? This is true for
// libraries defined without "library" + "part" keywords.
/*class ExtendsPublicInterfaceInOtherFile extends PublicInterface {
  @override
  void publicAbstractMethod() {
    // TODO: implement publicAbstractMethod
  }
}*/
