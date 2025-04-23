import 'package:dart_mappable/dart_mappable.dart';

part 'learning_material.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum MaterialCompletionStatus { no, yes }

@MappableClass()
class LearningMaterial with LearningMaterialMappable {
  @MappableField(key: 'materialId')
  final String? materialId;
  @MappableField(key: 'materialName')
  final String? materialName;
  @MappableField(key: 'isCompleted')
  final String? isCompleted;
  @MappableField(key: 'materialCompletion')
  final String? materialCompletion;
  @MappableField(key: 'totalTimeTaken')
  final String? totalTimeTaken;

  LearningMaterial({
    this.materialId,
    this.materialName,
    this.isCompleted,
    this.materialCompletion,
    this.totalTimeTaken,
  });


  bool get isMaterialCompleted {
    return isCompleted?.toLowerCase() == 'yes';
  }
} 