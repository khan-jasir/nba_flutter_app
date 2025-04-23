import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/models/learning_data_summary.dart';

part 'learning_data.mapper.dart';

@MappableClass()
class LearningData with LearningDataMappable {
  @MappableField(key: 'courses')
  final List<LearningCourse>? courses;
  @MappableField(key: 'summary')
  final LearningDataSummary? summary;

  LearningData({
    this.courses,
    this.summary,
  });
} 