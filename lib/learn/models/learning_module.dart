import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_material.dart';

part 'learning_module.mapper.dart';

@MappableClass()
class LearningModule with LearningModuleMappable {
  @MappableField(key: 'moduleId')
  final String? moduleId;
  @MappableField(key: 'moduleName')
  final String? moduleName;
  @MappableField(key: 'materials')
  final List<LearningMaterial>? materials;

  LearningModule({
    this.moduleId,
    this.moduleName,
    this.materials,
  });
} 