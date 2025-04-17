import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_material.dart';

part 'learning_module.mapper.dart';

@MappableClass()
class LearningModule with LearningModuleMappable {

  @MappableField(key: 'module_id')
  final String moduleId;
  @MappableField(key: 'module_name')
  final String moduleName;
  @MappableField(key: 'materials')
  final List<LearningMaterial> materials;

  LearningModule({
    required this.moduleId,
    required this.moduleName,
    required this.materials,
  });
}
