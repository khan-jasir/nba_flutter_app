// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_material.dart';

class MaterialCompletionStatusMapper
    extends EnumMapper<MaterialCompletionStatus> {
  MaterialCompletionStatusMapper._();

  static MaterialCompletionStatusMapper? _instance;
  static MaterialCompletionStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MaterialCompletionStatusMapper._());
    }
    return _instance!;
  }

  static MaterialCompletionStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MaterialCompletionStatus decode(dynamic value) {
    switch (value) {
      case r'no':
        return MaterialCompletionStatus.no;
      case r'yes':
        return MaterialCompletionStatus.yes;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MaterialCompletionStatus self) {
    switch (self) {
      case MaterialCompletionStatus.no:
        return r'no';
      case MaterialCompletionStatus.yes:
        return r'yes';
    }
  }
}

extension MaterialCompletionStatusMapperExtension on MaterialCompletionStatus {
  String toValue() {
    MaterialCompletionStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MaterialCompletionStatus>(this)
        as String;
  }
}

class LearningMaterialMapper extends ClassMapperBase<LearningMaterial> {
  LearningMaterialMapper._();

  static LearningMaterialMapper? _instance;
  static LearningMaterialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningMaterialMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LearningMaterial';

  static String? _$materialId(LearningMaterial v) => v.materialId;
  static const Field<LearningMaterial, String> _f$materialId =
      Field('materialId', _$materialId, opt: true);
  static String? _$materialName(LearningMaterial v) => v.materialName;
  static const Field<LearningMaterial, String> _f$materialName =
      Field('materialName', _$materialName, opt: true);
  static String? _$isCompleted(LearningMaterial v) => v.isCompleted;
  static const Field<LearningMaterial, String> _f$isCompleted =
      Field('isCompleted', _$isCompleted, opt: true);
  static String? _$materialCompletion(LearningMaterial v) =>
      v.materialCompletion;
  static const Field<LearningMaterial, String> _f$materialCompletion =
      Field('materialCompletion', _$materialCompletion, opt: true);
  static String? _$totalTimeTaken(LearningMaterial v) => v.totalTimeTaken;
  static const Field<LearningMaterial, String> _f$totalTimeTaken =
      Field('totalTimeTaken', _$totalTimeTaken, opt: true);

  @override
  final MappableFields<LearningMaterial> fields = const {
    #materialId: _f$materialId,
    #materialName: _f$materialName,
    #isCompleted: _f$isCompleted,
    #materialCompletion: _f$materialCompletion,
    #totalTimeTaken: _f$totalTimeTaken,
  };

  static LearningMaterial _instantiate(DecodingData data) {
    return LearningMaterial(
        materialId: data.dec(_f$materialId),
        materialName: data.dec(_f$materialName),
        isCompleted: data.dec(_f$isCompleted),
        materialCompletion: data.dec(_f$materialCompletion),
        totalTimeTaken: data.dec(_f$totalTimeTaken));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningMaterial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningMaterial>(map);
  }

  static LearningMaterial fromJson(String json) {
    return ensureInitialized().decodeJson<LearningMaterial>(json);
  }
}

mixin LearningMaterialMappable {
  String toJson() {
    return LearningMaterialMapper.ensureInitialized()
        .encodeJson<LearningMaterial>(this as LearningMaterial);
  }

  Map<String, dynamic> toMap() {
    return LearningMaterialMapper.ensureInitialized()
        .encodeMap<LearningMaterial>(this as LearningMaterial);
  }

  LearningMaterialCopyWith<LearningMaterial, LearningMaterial, LearningMaterial>
      get copyWith =>
          _LearningMaterialCopyWithImpl<LearningMaterial, LearningMaterial>(
              this as LearningMaterial, $identity, $identity);
  @override
  String toString() {
    return LearningMaterialMapper.ensureInitialized()
        .stringifyValue(this as LearningMaterial);
  }

  @override
  bool operator ==(Object other) {
    return LearningMaterialMapper.ensureInitialized()
        .equalsValue(this as LearningMaterial, other);
  }

  @override
  int get hashCode {
    return LearningMaterialMapper.ensureInitialized()
        .hashValue(this as LearningMaterial);
  }
}

extension LearningMaterialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningMaterial, $Out> {
  LearningMaterialCopyWith<$R, LearningMaterial, $Out>
      get $asLearningMaterial => $base
          .as((v, t, t2) => _LearningMaterialCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningMaterialCopyWith<$R, $In extends LearningMaterial, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? materialId,
      String? materialName,
      String? isCompleted,
      String? materialCompletion,
      String? totalTimeTaken});
  LearningMaterialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningMaterialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningMaterial, $Out>
    implements LearningMaterialCopyWith<$R, LearningMaterial, $Out> {
  _LearningMaterialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningMaterial> $mapper =
      LearningMaterialMapper.ensureInitialized();
  @override
  $R call(
          {Object? materialId = $none,
          Object? materialName = $none,
          Object? isCompleted = $none,
          Object? materialCompletion = $none,
          Object? totalTimeTaken = $none}) =>
      $apply(FieldCopyWithData({
        if (materialId != $none) #materialId: materialId,
        if (materialName != $none) #materialName: materialName,
        if (isCompleted != $none) #isCompleted: isCompleted,
        if (materialCompletion != $none)
          #materialCompletion: materialCompletion,
        if (totalTimeTaken != $none) #totalTimeTaken: totalTimeTaken
      }));
  @override
  LearningMaterial $make(CopyWithData data) => LearningMaterial(
      materialId: data.get(#materialId, or: $value.materialId),
      materialName: data.get(#materialName, or: $value.materialName),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      materialCompletion:
          data.get(#materialCompletion, or: $value.materialCompletion),
      totalTimeTaken: data.get(#totalTimeTaken, or: $value.totalTimeTaken));

  @override
  LearningMaterialCopyWith<$R2, LearningMaterial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningMaterialCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
