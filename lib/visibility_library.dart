/// Legacy way of defining a library. Recommended way is to do it as in
/// "visibility.dart" + "src/visibility".
library visibility_library;


// Seems that dart treats "parts" as pieces of one big file that comprise a
// library. Hence, private methods and properties are accessible from other
// parts files of the same library.
part 'src/visibility_library/visibility.dart';
part 'src/visibility_library/other_file.dart';
