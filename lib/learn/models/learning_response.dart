import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_data.dart';

part 'learning_response.mapper.dart';

@MappableClass()
class LearningResponse with LearningResponseMappable {
  @MappableField(key: 'success')
  final bool? success;
  @MappableField(key: 'message')
  final String? message;
  @MappableField(key: 'data')
  final LearningData? data;

  LearningResponse({
    this.success,
    this.message,
    this.data,
  });
} 