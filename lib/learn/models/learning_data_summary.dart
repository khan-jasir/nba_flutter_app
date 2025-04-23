import 'package:dart_mappable/dart_mappable.dart';

part 'learning_data_summary.mapper.dart';

@MappableClass()
class LearningDataSummary with LearningDataSummaryMappable {
  @MappableField(key: 'totalCourses')
  final int? totalCourses;
  @MappableField(key: 'completedCourses')
  final int? completedCourses;
  @MappableField(key: 'notStartedCourses')
  final int? notStartedCourses;
  @MappableField(key: 'inProgressCourses')
  final int? inProgressCourses;
  @MappableField(key: 'totalMaterials')
  final int? totalMaterials;
  @MappableField(key: 'completedMaterials')
  final int? completedMaterials;
  @MappableField(key: 'incompleteMaterials')
  final int? incompleteMaterials;
  @MappableField(key: 'inProgressMaterials')
  final int? inProgressMaterials;

  LearningDataSummary({
    this.totalCourses,
    this.completedCourses,
    this.notStartedCourses,
    this.inProgressCourses,
    this.totalMaterials,
    this.completedMaterials,
    this.incompleteMaterials,
    this.inProgressMaterials,
  });
} 