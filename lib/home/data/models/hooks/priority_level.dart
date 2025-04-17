


import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';

class PriorityLevelHook extends MappingHook {
  const PriorityLevelHook();


  @override
  Object? beforeDecode(Object? value) {
    if(value is String) {
      return value.toLowerCase();
    }
    return value;
  }

}