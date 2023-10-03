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


/** This is an auto generated class representing the NutrientGoals type in your schema. */
class NutrientGoals {
  final int? _calories;
  final int? _carbPerc;
  final int? _fatPerc;
  final int? _proteinPerc;
  final Nutrients? _otherNutrients;
  final amplify_core.TemporalDate? _setAt;

  int get calories {
    try {
      return _calories!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get carbPerc {
    try {
      return _carbPerc!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get fatPerc {
    try {
      return _fatPerc!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get proteinPerc {
    try {
      return _proteinPerc!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Nutrients? get otherNutrients {
    return _otherNutrients;
  }
  
  amplify_core.TemporalDate? get setAt {
    return _setAt;
  }
  
  const NutrientGoals._internal({required calories, required carbPerc, required fatPerc, required proteinPerc, otherNutrients, setAt}): _calories = calories, _carbPerc = carbPerc, _fatPerc = fatPerc, _proteinPerc = proteinPerc, _otherNutrients = otherNutrients, _setAt = setAt;
  
  factory NutrientGoals({required int calories, required int carbPerc, required int fatPerc, required int proteinPerc, Nutrients? otherNutrients, amplify_core.TemporalDate? setAt}) {
    return NutrientGoals._internal(
      calories: calories,
      carbPerc: carbPerc,
      fatPerc: fatPerc,
      proteinPerc: proteinPerc,
      otherNutrients: otherNutrients,
      setAt: setAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutrientGoals &&
      _calories == other._calories &&
      _carbPerc == other._carbPerc &&
      _fatPerc == other._fatPerc &&
      _proteinPerc == other._proteinPerc &&
      _otherNutrients == other._otherNutrients &&
      _setAt == other._setAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NutrientGoals {");
    buffer.write("calories=" + (_calories != null ? _calories!.toString() : "null") + ", ");
    buffer.write("carbPerc=" + (_carbPerc != null ? _carbPerc!.toString() : "null") + ", ");
    buffer.write("fatPerc=" + (_fatPerc != null ? _fatPerc!.toString() : "null") + ", ");
    buffer.write("proteinPerc=" + (_proteinPerc != null ? _proteinPerc!.toString() : "null") + ", ");
    buffer.write("otherNutrients=" + (_otherNutrients != null ? _otherNutrients!.toString() : "null") + ", ");
    buffer.write("setAt=" + (_setAt != null ? _setAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NutrientGoals copyWith({int? calories, int? carbPerc, int? fatPerc, int? proteinPerc, Nutrients? otherNutrients, amplify_core.TemporalDate? setAt}) {
    return NutrientGoals._internal(
      calories: calories ?? this.calories,
      carbPerc: carbPerc ?? this.carbPerc,
      fatPerc: fatPerc ?? this.fatPerc,
      proteinPerc: proteinPerc ?? this.proteinPerc,
      otherNutrients: otherNutrients ?? this.otherNutrients,
      setAt: setAt ?? this.setAt);
  }
  
  NutrientGoals copyWithModelFieldValues({
    ModelFieldValue<int>? calories,
    ModelFieldValue<int>? carbPerc,
    ModelFieldValue<int>? fatPerc,
    ModelFieldValue<int>? proteinPerc,
    ModelFieldValue<Nutrients?>? otherNutrients,
    ModelFieldValue<amplify_core.TemporalDate?>? setAt
  }) {
    return NutrientGoals._internal(
      calories: calories == null ? this.calories : calories.value,
      carbPerc: carbPerc == null ? this.carbPerc : carbPerc.value,
      fatPerc: fatPerc == null ? this.fatPerc : fatPerc.value,
      proteinPerc: proteinPerc == null ? this.proteinPerc : proteinPerc.value,
      otherNutrients: otherNutrients == null ? this.otherNutrients : otherNutrients.value,
      setAt: setAt == null ? this.setAt : setAt.value
    );
  }
  
  NutrientGoals.fromJson(Map<String, dynamic> json)  
    : _calories = (json['calories'] as num?)?.toInt(),
      _carbPerc = (json['carbPerc'] as num?)?.toInt(),
      _fatPerc = (json['fatPerc'] as num?)?.toInt(),
      _proteinPerc = (json['proteinPerc'] as num?)?.toInt(),
      _otherNutrients = json['otherNutrients']?['serializedData'] != null
        ? Nutrients.fromJson(new Map<String, dynamic>.from(json['otherNutrients']['serializedData']))
        : null,
      _setAt = json['setAt'] != null ? amplify_core.TemporalDate.fromString(json['setAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'calories': _calories, 'carbPerc': _carbPerc, 'fatPerc': _fatPerc, 'proteinPerc': _proteinPerc, 'otherNutrients': _otherNutrients?.toJson(), 'setAt': _setAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'calories': _calories,
    'carbPerc': _carbPerc,
    'fatPerc': _fatPerc,
    'proteinPerc': _proteinPerc,
    'otherNutrients': _otherNutrients,
    'setAt': _setAt
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NutrientGoals";
    modelSchemaDefinition.pluralName = "NutrientGoals";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'calories',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'carbPerc',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'fatPerc',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'proteinPerc',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'otherNutrients',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Nutrients')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'setAt',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
  });
}