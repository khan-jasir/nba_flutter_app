import 'package:dart_mappable/dart_mappable.dart';

class CourseCompletionHook extends MappingHook {
  const CourseCompletionHook();


  @override
  Object? beforeDecode(Object? value) {
    if(value is String) {
      return value.toLowerCase();
    }
    return value;
  }

}