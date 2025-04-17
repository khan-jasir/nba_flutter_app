import 'package:dart_mappable/dart_mappable.dart';

part 'learning_data_summary.mapper.dart';

@MappableClass()
class LearningDataSummary with LearningDataSummaryMappable {
  @MappableField(key: 'total_courses')
  final int totalCourses;
  @MappableField(key: 'completed_courses')
  final int completedCourses;
  @MappableField(key: 'not_started_courses')
  final int notStartedCourses;
  @MappableField(key: 'in_progress_courses')
  final int inProgressCourses;
  @MappableField(key: 'total_materials')
  final int totalMaterials;
  @MappableField(key: 'completed_materials')
  final int completedMaterials;
  @MappableField(key: 'incomplete_materials')
  final int incompleteMaterials;
  @MappableField(key: 'in_progress_materials')
  final int inProgressMaterials;

  LearningDataSummary({
    required this.totalCourses,
    required this.completedCourses,
    required this.notStartedCourses,
    required this.inProgressCourses,
    required this.totalMaterials,
    required this.completedMaterials,
    required this.incompleteMaterials,
    required this.inProgressMaterials,
  });
}
