
import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/home/data/models/task_details_data.dart';

part 'task_details.mapper.dart';

@MappableClass()
class TaskDetails with TaskDetailsMappable {

  @MappableField(key: 'success')
  final bool success;

  @MappableField(key: 'message')
  final String message;

  @MappableField(key: 'data')
  final TaskDetailsData data;


  TaskDetails({
    required this.success,
    required this.message,
    required this.data
  });
}