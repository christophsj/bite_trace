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


/** This is an auto generated class representing the NutrientGoal type in your schema. */
class NutrientGoal {
  final bool? _isDaily;
  final NutrientGoals? _daily;
  final List<NutrientGoalsConfig>? _weekly;
  final amplify_core.TemporalDate? _setAt;

  bool get isDaily {
    try {
      return _isDaily!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  NutrientGoals get daily {
    try {
      return _daily!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<NutrientGoalsConfig> get weekly {
    try {
      return _weekly!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate? get setAt {
    return _setAt;
  }
  
  const NutrientGoal._internal({required isDaily, required daily, required weekly, setAt}): _isDaily = isDaily, _daily = daily, _weekly = weekly, _setAt = setAt;
  
  factory NutrientGoal({required bool isDaily, required NutrientGoals daily, required List<NutrientGoalsConfig> weekly, amplify_core.TemporalDate? setAt}) {
    return NutrientGoal._internal(
      isDaily: isDaily,
      daily: daily,
      weekly: weekly != null ? List<NutrientGoalsConfig>.unmodifiable(weekly) : weekly,
      setAt: setAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutrientGoal &&
      _isDaily == other._isDaily &&
      _daily == other._daily &&
      DeepCollectionEquality().equals(_weekly, other._weekly) &&
      _setAt == other._setAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NutrientGoal {");
    buffer.write("isDaily=" + (_isDaily != null ? _isDaily!.toString() : "null") + ", ");
    buffer.write("daily=" + (_daily != null ? _daily!.toString() : "null") + ", ");
    buffer.write("weekly=" + (_weekly != null ? _weekly!.toString() : "null") + ", ");
    buffer.write("setAt=" + (_setAt != null ? _setAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NutrientGoal copyWith({bool? isDaily, NutrientGoals? daily, List<NutrientGoalsConfig>? weekly, amplify_core.TemporalDate? setAt}) {
    return NutrientGoal._internal(
      isDaily: isDaily ?? this.isDaily,
      daily: daily ?? this.daily,
      weekly: weekly ?? this.weekly,
      setAt: setAt ?? this.setAt);
  }
  
  NutrientGoal copyWithModelFieldValues({
    ModelFieldValue<bool>? isDaily,
    ModelFieldValue<NutrientGoals>? daily,
    ModelFieldValue<List<NutrientGoalsConfig>>? weekly,
    ModelFieldValue<amplify_core.TemporalDate?>? setAt
  }) {
    return NutrientGoal._internal(
      isDaily: isDaily == null ? this.isDaily : isDaily.value,
      daily: daily == null ? this.daily : daily.value,
      weekly: weekly == null ? this.weekly : weekly.value,
      setAt: setAt == null ? this.setAt : setAt.value
    );
  }
  
  NutrientGoal.fromJson(Map<String, dynamic> json)  
    : _isDaily = json['isDaily'],
      _daily = json['daily']?['serializedData'] != null
        ? NutrientGoals.fromJson(new Map<String, dynamic>.from(json['daily']['serializedData']))
        : null,
      _weekly = json['weekly'] is List
        ? (json['weekly'] as List)
          .where((e) => e != null)
          .map((e) => NutrientGoalsConfig.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _setAt = json['setAt'] != null ? amplify_core.TemporalDate.fromString(json['setAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'isDaily': _isDaily, 'daily': _daily?.toJson(), 'weekly': _weekly?.map((NutrientGoalsConfig? e) => e?.toJson()).toList(), 'setAt': _setAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'isDaily': _isDaily,
    'daily': _daily,
    'weekly': _weekly,
    'setAt': _setAt
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NutrientGoal";
    modelSchemaDefinition.pluralName = "NutrientGoals";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'isDaily',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'daily',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'NutrientGoals')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'weekly',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'NutrientGoalsConfig')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'setAt',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
  });
}