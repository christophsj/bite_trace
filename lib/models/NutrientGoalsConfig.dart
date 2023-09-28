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


/** This is an auto generated class representing the NutrientGoalsConfig type in your schema. */
class NutrientGoalsConfig {
  final String? _name;
  final List<int>? _days;
  final NutrientGoals? _goals;

  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<int>? get days {
    return _days;
  }
  
  NutrientGoals get goals {
    try {
      return _goals!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const NutrientGoalsConfig._internal({required name, days, required goals}): _name = name, _days = days, _goals = goals;
  
  factory NutrientGoalsConfig({required String name, List<int>? days, required NutrientGoals goals}) {
    return NutrientGoalsConfig._internal(
      name: name,
      days: days != null ? List<int>.unmodifiable(days) : days,
      goals: goals);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutrientGoalsConfig &&
      _name == other._name &&
      DeepCollectionEquality().equals(_days, other._days) &&
      _goals == other._goals;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NutrientGoalsConfig {");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("days=" + (_days != null ? _days!.toString() : "null") + ", ");
    buffer.write("goals=" + (_goals != null ? _goals!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NutrientGoalsConfig copyWith({String? name, List<int>? days, NutrientGoals? goals}) {
    return NutrientGoalsConfig._internal(
      name: name ?? this.name,
      days: days ?? this.days,
      goals: goals ?? this.goals);
  }
  
  NutrientGoalsConfig copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<List<int>>? days,
    ModelFieldValue<NutrientGoals>? goals
  }) {
    return NutrientGoalsConfig._internal(
      name: name == null ? this.name : name.value,
      days: days == null ? this.days : days.value,
      goals: goals == null ? this.goals : goals.value
    );
  }
  
  NutrientGoalsConfig.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _days = (json['days'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _goals = json['goals']?['serializedData'] != null
        ? NutrientGoals.fromJson(new Map<String, dynamic>.from(json['goals']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'days': _days, 'goals': _goals?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'name': _name,
    'days': _days,
    'goals': _goals
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NutrientGoalsConfig";
    modelSchemaDefinition.pluralName = "NutrientGoalsConfigs";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'days',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.int.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'goals',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'NutrientGoals')
    ));
  });
}