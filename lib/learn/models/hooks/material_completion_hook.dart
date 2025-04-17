import 'package:dart_mappable/dart_mappable.dart';

class MaterialCompletionHook extends MappingHook {
  const MaterialCompletionHook();


  @override
  Object? beforeDecode(Object? value) {
    if(value is String) {
      return value.toLowerCase();
    }
    return value;
  }
}