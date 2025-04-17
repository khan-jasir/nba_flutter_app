import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_data.dart';

part 'learning_record.mapper.dart';

@MappableClass()
class LearningRecord with LearningRecordMappable {
  @MappableField(key: 'createdDate')
  final String createdDate;
  @MappableField(key: 'modifiedDate')
  final String modifiedDate;
  @MappableField(key: 'user_id')
  final String userId;
  @MappableField(key: 'employee_id')
  final String employeeId;
  @MappableField(key: 'firstname')
  final String firstname;
  @MappableField(key: 'learning_data')
  final LearningData learningData;

  LearningRecord({
    required this.createdDate,
    required this.modifiedDate,
    required this.userId,
    required this.employeeId,
    required this.firstname,
    required this.learningData,
  });
}
