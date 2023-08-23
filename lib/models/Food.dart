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


/** This is an auto generated class representing the Food type in your schema. */
class Food {
  final String? _countryCode;
  final String? _description;
  final String? _foodId;
  final int? _chosenServingSize;
  final bool? _verified;
  final String? _brandName;
  final Nutrients? _nutritionalContents;
  final List<ServingSize>? _servingSizes;

  String? get countryCode {
    return _countryCode;
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get foodId {
    try {
      return _foodId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get chosenServingSize {
    try {
      return _chosenServingSize!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get verified {
    try {
      return _verified!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get brandName {
    return _brandName;
  }
  
  Nutrients get nutritionalContents {
    try {
      return _nutritionalContents!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<ServingSize> get servingSizes {
    try {
      return _servingSizes!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Food._internal({countryCode, required description, required foodId, required chosenServingSize, required verified, brandName, required nutritionalContents, required servingSizes}): _countryCode = countryCode, _description = description, _foodId = foodId, _chosenServingSize = chosenServingSize, _verified = verified, _brandName = brandName, _nutritionalContents = nutritionalContents, _servingSizes = servingSizes;
  
  factory Food({String? countryCode, required String description, required String foodId, required int chosenServingSize, required bool verified, String? brandName, required Nutrients nutritionalContents, required List<ServingSize> servingSizes}) {
    return Food._internal(
      countryCode: countryCode,
      description: description,
      foodId: foodId,
      chosenServingSize: chosenServingSize,
      verified: verified,
      brandName: brandName,
      nutritionalContents: nutritionalContents,
      servingSizes: servingSizes != null ? List<ServingSize>.unmodifiable(servingSizes) : servingSizes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Food &&
      _countryCode == other._countryCode &&
      _description == other._description &&
      _foodId == other._foodId &&
      _chosenServingSize == other._chosenServingSize &&
      _verified == other._verified &&
      _brandName == other._brandName &&
      _nutritionalContents == other._nutritionalContents &&
      DeepCollectionEquality().equals(_servingSizes, other._servingSizes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Food {");
    buffer.write("countryCode=" + "$_countryCode" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("foodId=" + "$_foodId" + ", ");
    buffer.write("chosenServingSize=" + (_chosenServingSize != null ? _chosenServingSize!.toString() : "null") + ", ");
    buffer.write("verified=" + (_verified != null ? _verified!.toString() : "null") + ", ");
    buffer.write("brandName=" + "$_brandName" + ", ");
    buffer.write("nutritionalContents=" + (_nutritionalContents != null ? _nutritionalContents!.toString() : "null") + ", ");
    buffer.write("servingSizes=" + (_servingSizes != null ? _servingSizes!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Food copyWith({String? countryCode, String? description, String? foodId, int? chosenServingSize, bool? verified, String? brandName, Nutrients? nutritionalContents, List<ServingSize>? servingSizes}) {
    return Food._internal(
      countryCode: countryCode ?? this.countryCode,
      description: description ?? this.description,
      foodId: foodId ?? this.foodId,
      chosenServingSize: chosenServingSize ?? this.chosenServingSize,
      verified: verified ?? this.verified,
      brandName: brandName ?? this.brandName,
      nutritionalContents: nutritionalContents ?? this.nutritionalContents,
      servingSizes: servingSizes ?? this.servingSizes);
  }
  
  Food copyWithModelFieldValues({
    ModelFieldValue<String?>? countryCode,
    ModelFieldValue<String>? description,
    ModelFieldValue<String>? foodId,
    ModelFieldValue<int>? chosenServingSize,
    ModelFieldValue<bool>? verified,
    ModelFieldValue<String?>? brandName,
    ModelFieldValue<Nutrients>? nutritionalContents,
    ModelFieldValue<List<ServingSize>>? servingSizes
  }) {
    return Food._internal(
      countryCode: countryCode == null ? this.countryCode : countryCode.value,
      description: description == null ? this.description : description.value,
      foodId: foodId == null ? this.foodId : foodId.value,
      chosenServingSize: chosenServingSize == null ? this.chosenServingSize : chosenServingSize.value,
      verified: verified == null ? this.verified : verified.value,
      brandName: brandName == null ? this.brandName : brandName.value,
      nutritionalContents: nutritionalContents == null ? this.nutritionalContents : nutritionalContents.value,
      servingSizes: servingSizes == null ? this.servingSizes : servingSizes.value
    );
  }
  
  Food.fromJson(Map<String, dynamic> json)  
    : _countryCode = json['countryCode'],
      _description = json['description'],
      _foodId = json['foodId'],
      _chosenServingSize = (json['chosenServingSize'] as num?)?.toInt(),
      _verified = json['verified'],
      _brandName = json['brandName'],
      _nutritionalContents = json['nutritionalContents']?['serializedData'] != null
        ? Nutrients.fromJson(new Map<String, dynamic>.from(json['nutritionalContents']['serializedData']))
        : null,
      _servingSizes = json['servingSizes'] is List
        ? (json['servingSizes'] as List)
          .where((e) => e != null)
          .map((e) => ServingSize.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'countryCode': _countryCode, 'description': _description, 'foodId': _foodId, 'chosenServingSize': _chosenServingSize, 'verified': _verified, 'brandName': _brandName, 'nutritionalContents': _nutritionalContents?.toJson(), 'servingSizes': _servingSizes?.map((ServingSize? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'countryCode': _countryCode,
    'description': _description,
    'foodId': _foodId,
    'chosenServingSize': _chosenServingSize,
    'verified': _verified,
    'brandName': _brandName,
    'nutritionalContents': _nutritionalContents,
    'servingSizes': _servingSizes
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Food";
    modelSchemaDefinition.pluralName = "Foods";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'countryCode',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'description',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'foodId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'chosenServingSize',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'verified',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'brandName',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'nutritionalContents',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Nutrients')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'servingSizes',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'ServingSize')
    ));
  });
}