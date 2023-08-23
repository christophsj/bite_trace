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


/** This is an auto generated class representing the ServingSize type in your schema. */
class ServingSize {
  final int? _index;
  final double? _nutritionMultiplier;
  final String? _unit;
  final double? _value;

  int get index {
    try {
      return _index!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get nutritionMultiplier {
    try {
      return _nutritionMultiplier!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get unit {
    try {
      return _unit!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get value {
    try {
      return _value!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const ServingSize._internal({required index, required nutritionMultiplier, required unit, required value}): _index = index, _nutritionMultiplier = nutritionMultiplier, _unit = unit, _value = value;
  
  factory ServingSize({required int index, required double nutritionMultiplier, required String unit, required double value}) {
    return ServingSize._internal(
      index: index,
      nutritionMultiplier: nutritionMultiplier,
      unit: unit,
      value: value);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServingSize &&
      _index == other._index &&
      _nutritionMultiplier == other._nutritionMultiplier &&
      _unit == other._unit &&
      _value == other._value;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServingSize {");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("nutritionMultiplier=" + (_nutritionMultiplier != null ? _nutritionMultiplier!.toString() : "null") + ", ");
    buffer.write("unit=" + "$_unit" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServingSize copyWith({int? index, double? nutritionMultiplier, String? unit, double? value}) {
    return ServingSize._internal(
      index: index ?? this.index,
      nutritionMultiplier: nutritionMultiplier ?? this.nutritionMultiplier,
      unit: unit ?? this.unit,
      value: value ?? this.value);
  }
  
  ServingSize copyWithModelFieldValues({
    ModelFieldValue<int>? index,
    ModelFieldValue<double>? nutritionMultiplier,
    ModelFieldValue<String>? unit,
    ModelFieldValue<double>? value
  }) {
    return ServingSize._internal(
      index: index == null ? this.index : index.value,
      nutritionMultiplier: nutritionMultiplier == null ? this.nutritionMultiplier : nutritionMultiplier.value,
      unit: unit == null ? this.unit : unit.value,
      value: value == null ? this.value : value.value
    );
  }
  
  ServingSize.fromJson(Map<String, dynamic> json)  
    : _index = (json['index'] as num?)?.toInt(),
      _nutritionMultiplier = (json['nutritionMultiplier'] as num?)?.toDouble(),
      _unit = json['unit'],
      _value = (json['value'] as num?)?.toDouble();
  
  Map<String, dynamic> toJson() => {
    'index': _index, 'nutritionMultiplier': _nutritionMultiplier, 'unit': _unit, 'value': _value
  };
  
  Map<String, Object?> toMap() => {
    'index': _index,
    'nutritionMultiplier': _nutritionMultiplier,
    'unit': _unit,
    'value': _value
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServingSize";
    modelSchemaDefinition.pluralName = "ServingSizes";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'index',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'nutritionMultiplier',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'unit',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'value',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
  });
}