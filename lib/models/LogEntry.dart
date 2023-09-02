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


/** This is an auto generated class representing the LogEntry type in your schema. */
class LogEntry extends amplify_core.Model {
  static const classType = const _LogEntryModelType();
  final String id;
  final amplify_core.TemporalDate? _day;
  final List<Meal>? _meals;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LogEntryModelIdentifier get modelIdentifier {
    try {
      return LogEntryModelIdentifier(
        id: id,
        day: _day!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate get day {
    try {
      return _day!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Meal>? get meals {
    return _meals;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LogEntry._internal({required this.id, required day, meals, createdAt, updatedAt}): _day = day, _meals = meals, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LogEntry({String? id, required amplify_core.TemporalDate day, List<Meal>? meals}) {
    return LogEntry._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      day: day,
      meals: meals != null ? List<Meal>.unmodifiable(meals) : meals);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogEntry &&
      id == other.id &&
      _day == other._day &&
      DeepCollectionEquality().equals(_meals, other._meals);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LogEntry {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("day=" + (_day != null ? _day!.format() : "null") + ", ");
    buffer.write("meals=" + (_meals != null ? _meals!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LogEntry copyWith({List<Meal>? meals}) {
    return LogEntry._internal(
      id: id,
      day: day,
      meals: meals ?? this.meals);
  }
  
  LogEntry copyWithModelFieldValues({
    ModelFieldValue<List<Meal>>? meals
  }) {
    return LogEntry._internal(
      id: id,
      day: day,
      meals: meals == null ? this.meals : meals.value
    );
  }
  
  LogEntry.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _day = json['day'] != null ? amplify_core.TemporalDate.fromString(json['day']) : null,
      _meals = json['meals'] is List
        ? (json['meals'] as List)
          .where((e) => e != null)
          .map((e) => Meal.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'day': _day?.format(), 'meals': _meals?.map((Meal? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'day': _day,
    'meals': _meals,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LogEntryModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LogEntryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DAY = amplify_core.QueryField(fieldName: "day");
  static final MEALS = amplify_core.QueryField(fieldName: "meals");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LogEntry";
    modelSchemaDefinition.pluralName = "LogEntries";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id", "day"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LogEntry.DAY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'meals',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Meal')
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

class _LogEntryModelType extends amplify_core.ModelType<LogEntry> {
  const _LogEntryModelType();
  
  @override
  LogEntry fromJson(Map<String, dynamic> jsonData) {
    return LogEntry.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LogEntry';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LogEntry] in your schema.
 */
class LogEntryModelIdentifier implements amplify_core.ModelIdentifier<LogEntry> {
  final String id;
  final amplify_core.TemporalDate day;

  /**
   * Create an instance of LogEntryModelIdentifier using [id] the primary key.
   * And [day] the sort key.
   */
  const LogEntryModelIdentifier({
    required this.id,
    required this.day});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id,
    'day': day
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'LogEntryModelIdentifier(id: $id, day: $day)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LogEntryModelIdentifier &&
      id == other.id &&
      day == other.day;
  }
  
  @override
  int get hashCode =>
    id.hashCode ^
    day.hashCode;
}