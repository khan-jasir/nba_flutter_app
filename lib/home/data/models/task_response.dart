import 'package:dart_mappable/dart_mappable.dart';
import 'task_data.dart';

part 'task_response.mapper.dart';

@MappableClass()
class TaskResponse with TaskResponseMappable {

  @MappableField(key: 'success')
  final bool success;
  @MappableField(key: 'message')
  final String message;
  @MappableField(key: 'data')
  final TaskData data;

  const TaskResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}
