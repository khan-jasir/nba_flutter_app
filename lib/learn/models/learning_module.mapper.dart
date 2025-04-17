// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_module.dart';

class LearningModuleMapper extends ClassMapperBase<LearningModule> {
  LearningModuleMapper._();

  static LearningModuleMapper? _instance;
  static LearningModuleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningModuleMapper._());
      LearningMaterialMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LearningModule';

  static String _$moduleId(LearningModule v) => v.moduleId;
  static const Field<LearningModule, String> _f$moduleId =
      Field('moduleId', _$moduleId, key: r'module_id');
  static String _$moduleName(LearningModule v) => v.moduleName;
  static const Field<LearningModule, String> _f$moduleName =
      Field('moduleName', _$moduleName, key: r'module_name');
  static List<LearningMaterial> _$materials(LearningModule v) => v.materials;
  static const Field<LearningModule, List<LearningMaterial>> _f$materials =
      Field('materials', _$materials);

  @override
  final MappableFields<LearningModule> fields = const {
    #moduleId: _f$moduleId,
    #moduleName: _f$moduleName,
    #materials: _f$materials,
  };

  static LearningModule _instantiate(DecodingData data) {
    return LearningModule(
        moduleId: data.dec(_f$moduleId),
        moduleName: data.dec(_f$moduleName),
        materials: data.dec(_f$materials));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningModule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningModule>(map);
  }

  static LearningModule fromJson(String json) {
    return ensureInitialized().decodeJson<LearningModule>(json);
  }
}

mixin LearningModuleMappable {
  String toJson() {
    return LearningModuleMapper.ensureInitialized()
        .encodeJson<LearningModule>(this as LearningModule);
  }

  Map<String, dynamic> toMap() {
    return LearningModuleMapper.ensureInitialized()
        .encodeMap<LearningModule>(this as LearningModule);
  }

  LearningModuleCopyWith<LearningModule, LearningModule, LearningModule>
      get copyWith =>
          _LearningModuleCopyWithImpl<LearningModule, LearningModule>(
              this as LearningModule, $identity, $identity);
  @override
  String toString() {
    return LearningModuleMapper.ensureInitialized()
        .stringifyValue(this as LearningModule);
  }

  @override
  bool operator ==(Object other) {
    return LearningModuleMapper.ensureInitialized()
        .equalsValue(this as LearningModule, other);
  }

  @override
  int get hashCode {
    return LearningModuleMapper.ensureInitialized()
        .hashValue(this as LearningModule);
  }
}

extension LearningModuleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningModule, $Out> {
  LearningModuleCopyWith<$R, LearningModule, $Out> get $asLearningModule =>
      $base.as((v, t, t2) => _LearningModuleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningModuleCopyWith<$R, $In extends LearningModule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, LearningMaterial,
          LearningMaterialCopyWith<$R, LearningMaterial, LearningMaterial>>
      get materials;
  $R call(
      {String? moduleId,
      String? moduleName,
      List<LearningMaterial>? materials});
  LearningModuleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningModuleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningModule, $Out>
    implements LearningModuleCopyWith<$R, LearningModule, $Out> {
  _LearningModuleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningModule> $mapper =
      LearningModuleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, LearningMaterial,
          LearningMaterialCopyWith<$R, LearningMaterial, LearningMaterial>>
      get materials => ListCopyWith($value.materials,
          (v, t) => v.copyWith.$chain(t), (v) => call(materials: v));
  @override
  $R call(
          {String? moduleId,
          String? moduleName,
          List<LearningMaterial>? materials}) =>
      $apply(FieldCopyWithData({
        if (moduleId != null) #moduleId: moduleId,
        if (moduleName != null) #moduleName: moduleName,
        if (materials != null) #materials: materials
      }));
  @override
  LearningModule $make(CopyWithData data) => LearningModule(
      moduleId: data.get(#moduleId, or: $value.moduleId),
      moduleName: data.get(#moduleName, or: $value.moduleName),
      materials: data.get(#materials, or: $value.materials));

  @override
  LearningModuleCopyWith<$R2, LearningModule, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningModuleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
