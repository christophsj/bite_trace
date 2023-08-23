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


/** This is an auto generated class representing the Meal type in your schema. */
class Meal {
  final String? _name;
  final int? _index;
  final List<Food>? _foods;

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
  
  List<Food> get foods {
    try {
      return _foods!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Meal._internal({required name, required index, required foods}): _name = name, _index = index, _foods = foods;
  
  factory Meal({required String name, required int index, required List<Food> foods}) {
    return Meal._internal(
      name: name,
      index: index,
      foods: foods != null ? List<Food>.unmodifiable(foods) : foods);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meal &&
      _name == other._name &&
      _index == other._index &&
      DeepCollectionEquality().equals(_foods, other._foods);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Meal {");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("foods=" + (_foods != null ? _foods!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Meal copyWith({String? name, int? index, List<Food>? foods}) {
    return Meal._internal(
      name: name ?? this.name,
      index: index ?? this.index,
      foods: foods ?? this.foods);
  }
  
  Meal copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<int>? index,
    ModelFieldValue<List<Food>>? foods
  }) {
    return Meal._internal(
      name: name == null ? this.name : name.value,
      index: index == null ? this.index : index.value,
      foods: foods == null ? this.foods : foods.value
    );
  }
  
  Meal.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _index = (json['index'] as num?)?.toInt(),
      _foods = json['foods'] is List
        ? (json['foods'] as List)
          .where((e) => e != null)
          .map((e) => Food.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'index': _index, 'foods': _foods?.map((Food? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'name': _name,
    'index': _index,
    'foods': _foods
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Meal";
    modelSchemaDefinition.pluralName = "Meals";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'index',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'foods',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Food')
    ));
  });
}