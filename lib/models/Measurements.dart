/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Measurements type in your schema. */
class Measurements extends amplify_core.Model {
  static const classType = const _MeasurementsModelType();
  final String id;
  final List<MeasurementEntry>? _weight;
  final List<MeasurementEntry>? _waist;
  final List<MeasurementEntry>? _chest;
  final List<MeasurementEntry>? _thighs;
  final List<CustomMeasurementEntry>? _custom;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MeasurementsModelIdentifier get modelIdentifier {
      return MeasurementsModelIdentifier(
        id: id
      );
  }
  
  List<MeasurementEntry>? get weight {
    return _weight;
  }
  
  List<MeasurementEntry>? get waist {
    return _waist;
  }
  
  List<MeasurementEntry>? get chest {
    return _chest;
  }
  
  List<MeasurementEntry>? get thighs {
    return _thighs;
  }
  
  List<CustomMeasurementEntry>? get custom {
    return _custom;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Measurements._internal({required this.id, weight, waist, chest, thighs, custom, createdAt, updatedAt}): _weight = weight, _waist = waist, _chest = chest, _thighs = thighs, _custom = custom, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Measurements({String? id, List<MeasurementEntry>? weight, List<MeasurementEntry>? waist, List<MeasurementEntry>? chest, List<MeasurementEntry>? thighs, List<CustomMeasurementEntry>? custom}) {
    return Measurements._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      weight: weight != null ? List<MeasurementEntry>.unmodifiable(weight) : weight,
      waist: waist != null ? List<MeasurementEntry>.unmodifiable(waist) : waist,
      chest: chest != null ? List<MeasurementEntry>.unmodifiable(chest) : chest,
      thighs: thighs != null ? List<MeasurementEntry>.unmodifiable(thighs) : thighs,
      custom: custom != null ? List<CustomMeasurementEntry>.unmodifiable(custom) : custom);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Measurements &&
      id == other.id &&
      DeepCollectionEquality().equals(_weight, other._weight) &&
      DeepCollectionEquality().equals(_waist, other._waist) &&
      DeepCollectionEquality().equals(_chest, other._chest) &&
      DeepCollectionEquality().equals(_thighs, other._thighs) &&
      DeepCollectionEquality().equals(_custom, other._custom);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Measurements {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("waist=" + (_waist != null ? _waist!.toString() : "null") + ", ");
    buffer.write("chest=" + (_chest != null ? _chest!.toString() : "null") + ", ");
    buffer.write("thighs=" + (_thighs != null ? _thighs!.toString() : "null") + ", ");
    buffer.write("custom=" + (_custom != null ? _custom!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Measurements copyWith({List<MeasurementEntry>? weight, List<MeasurementEntry>? waist, List<MeasurementEntry>? chest, List<MeasurementEntry>? thighs, List<CustomMeasurementEntry>? custom}) {
    return Measurements._internal(
      id: id,
      weight: weight ?? this.weight,
      waist: waist ?? this.waist,
      chest: chest ?? this.chest,
      thighs: thighs ?? this.thighs,
      custom: custom ?? this.custom);
  }
  
  Measurements copyWithModelFieldValues({
    ModelFieldValue<List<MeasurementEntry>>? weight,
    ModelFieldValue<List<MeasurementEntry>>? waist,
    ModelFieldValue<List<MeasurementEntry>>? chest,
    ModelFieldValue<List<MeasurementEntry>>? thighs,
    ModelFieldValue<List<CustomMeasurementEntry>>? custom
  }) {
    return Measurements._internal(
      id: id,
      weight: weight == null ? this.weight : weight.value,
      waist: waist == null ? this.waist : waist.value,
      chest: chest == null ? this.chest : chest.value,
      thighs: thighs == null ? this.thighs : thighs.value,
      custom: custom == null ? this.custom : custom.value
    );
  }
  
  Measurements.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _weight = json['weight'] is List
        ? (json['weight'] as List)
          .where((e) => e != null)
          .map((e) => MeasurementEntry.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _waist = json['waist'] is List
        ? (json['waist'] as List)
          .where((e) => e != null)
          .map((e) => MeasurementEntry.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _chest = json['chest'] is List
        ? (json['chest'] as List)
          .where((e) => e != null)
          .map((e) => MeasurementEntry.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _thighs = json['thighs'] is List
        ? (json['thighs'] as List)
          .where((e) => e != null)
          .map((e) => MeasurementEntry.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _custom = json['custom'] is List
        ? (json['custom'] as List)
          .where((e) => e != null)
          .map((e) => CustomMeasurementEntry.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'weight': _weight?.map((MeasurementEntry? e) => e?.toJson()).toList(), 'waist': _waist?.map((MeasurementEntry? e) => e?.toJson()).toList(), 'chest': _chest?.map((MeasurementEntry? e) => e?.toJson()).toList(), 'thighs': _thighs?.map((MeasurementEntry? e) => e?.toJson()).toList(), 'custom': _custom?.map((CustomMeasurementEntry? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'weight': _weight,
    'waist': _waist,
    'chest': _chest,
    'thighs': _thighs,
    'custom': _custom,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MeasurementsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MeasurementsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static final WAIST = amplify_core.QueryField(fieldName: "waist");
  static final CHEST = amplify_core.QueryField(fieldName: "chest");
  static final THIGHS = amplify_core.QueryField(fieldName: "thighs");
  static final CUSTOM = amplify_core.QueryField(fieldName: "custom");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Measurements";
    modelSchemaDefinition.pluralName = "Measurements";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'weight',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'MeasurementEntry')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'waist',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'MeasurementEntry')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'chest',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'MeasurementEntry')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'thighs',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'MeasurementEntry')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'custom',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'CustomMeasurementEntry')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MeasurementsModelType extends amplify_core.ModelType<Measurements> {
  const _MeasurementsModelType();
  
  @override
  Measurements fromJson(Map<String, dynamic> jsonData) {
    return Measurements.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Measurements';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Measurements] in your schema.
 */
class MeasurementsModelIdentifier implements amplify_core.ModelIdentifier<Measurements> {
  final String id;

  /** Create an instance of MeasurementsModelIdentifier using [id] the primary key. */
  const MeasurementsModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'MeasurementsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MeasurementsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}