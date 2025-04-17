import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/hooks/course_completion_hook.dart';

part 'learning_material.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum MaterialCompletionStatus { no, yes }

@MappableClass()
class LearningMaterial with LearningMaterialMappable {

  @MappableField(key: 'material_id')
  final String materialId;
  @MappableField(key: 'material_name')
  final String materialName;
  @MappableField(key: 'is_completed', hook: CourseCompletionHook())
  final MaterialCompletionStatus isCompleted;
  @MappableField(key: 'material_completion')
  final String? materialCompletion;
  @MappableField(key: 'total_time_taken')
  final String? totalTimeTaken;

  LearningMaterial({
    required this.materialId,
    required this.materialName,
    required this.isCompleted,
    this.materialCompletion,
    this.totalTimeTaken,
  });
}
