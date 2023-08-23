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


/** This is an auto generated class representing the Nutrients type in your schema. */
class Nutrients {
  final double? _calories;
  final double? _carbohydrates;
  final double? _protein;
  final double? _fat;
  final double? _calcium;
  final double? _cholesterol;
  final double? _fiber;
  final double? _iron;
  final double? _monounsaturatedFat;
  final double? _polyunsaturatedFat;
  final double? _potassium;
  final double? _saturatedFat;
  final double? _sodium;
  final double? _sugar;
  final double? _vitaminC;
  final double? _vitaminD;
  final double? _transFat;
  final double? _vitaminA;

  double get calories {
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
  
  double get carbohydrates {
    try {
      return _carbohydrates!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get protein {
    try {
      return _protein!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get fat {
    try {
      return _fat!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double? get calcium {
    return _calcium;
  }
  
  double? get cholesterol {
    return _cholesterol;
  }
  
  double? get fiber {
    return _fiber;
  }
  
  double? get iron {
    return _iron;
  }
  
  double? get monounsaturatedFat {
    return _monounsaturatedFat;
  }
  
  double? get polyunsaturatedFat {
    return _polyunsaturatedFat;
  }
  
  double? get potassium {
    return _potassium;
  }
  
  double? get saturatedFat {
    return _saturatedFat;
  }
  
  double? get sodium {
    return _sodium;
  }
  
  double? get sugar {
    return _sugar;
  }
  
  double? get vitaminC {
    return _vitaminC;
  }
  
  double? get vitaminD {
    return _vitaminD;
  }
  
  double? get transFat {
    return _transFat;
  }
  
  double? get vitaminA {
    return _vitaminA;
  }
  
  const Nutrients._internal({required calories, required carbohydrates, required protein, required fat, calcium, cholesterol, fiber, iron, monounsaturatedFat, polyunsaturatedFat, potassium, saturatedFat, sodium, sugar, vitaminC, vitaminD, transFat, vitaminA}): _calories = calories, _carbohydrates = carbohydrates, _protein = protein, _fat = fat, _calcium = calcium, _cholesterol = cholesterol, _fiber = fiber, _iron = iron, _monounsaturatedFat = monounsaturatedFat, _polyunsaturatedFat = polyunsaturatedFat, _potassium = potassium, _saturatedFat = saturatedFat, _sodium = sodium, _sugar = sugar, _vitaminC = vitaminC, _vitaminD = vitaminD, _transFat = transFat, _vitaminA = vitaminA;
  
  factory Nutrients({required double calories, required double carbohydrates, required double protein, required double fat, double? calcium, double? cholesterol, double? fiber, double? iron, double? monounsaturatedFat, double? polyunsaturatedFat, double? potassium, double? saturatedFat, double? sodium, double? sugar, double? vitaminC, double? vitaminD, double? transFat, double? vitaminA}) {
    return Nutrients._internal(
      calories: calories,
      carbohydrates: carbohydrates,
      protein: protein,
      fat: fat,
      calcium: calcium,
      cholesterol: cholesterol,
      fiber: fiber,
      iron: iron,
      monounsaturatedFat: monounsaturatedFat,
      polyunsaturatedFat: polyunsaturatedFat,
      potassium: potassium,
      saturatedFat: saturatedFat,
      sodium: sodium,
      sugar: sugar,
      vitaminC: vitaminC,
      vitaminD: vitaminD,
      transFat: transFat,
      vitaminA: vitaminA);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Nutrients &&
      _calories == other._calories &&
      _carbohydrates == other._carbohydrates &&
      _protein == other._protein &&
      _fat == other._fat &&
      _calcium == other._calcium &&
      _cholesterol == other._cholesterol &&
      _fiber == other._fiber &&
      _iron == other._iron &&
      _monounsaturatedFat == other._monounsaturatedFat &&
      _polyunsaturatedFat == other._polyunsaturatedFat &&
      _potassium == other._potassium &&
      _saturatedFat == other._saturatedFat &&
      _sodium == other._sodium &&
      _sugar == other._sugar &&
      _vitaminC == other._vitaminC &&
      _vitaminD == other._vitaminD &&
      _transFat == other._transFat &&
      _vitaminA == other._vitaminA;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Nutrients {");
    buffer.write("calories=" + (_calories != null ? _calories!.toString() : "null") + ", ");
    buffer.write("carbohydrates=" + (_carbohydrates != null ? _carbohydrates!.toString() : "null") + ", ");
    buffer.write("protein=" + (_protein != null ? _protein!.toString() : "null") + ", ");
    buffer.write("fat=" + (_fat != null ? _fat!.toString() : "null") + ", ");
    buffer.write("calcium=" + (_calcium != null ? _calcium!.toString() : "null") + ", ");
    buffer.write("cholesterol=" + (_cholesterol != null ? _cholesterol!.toString() : "null") + ", ");
    buffer.write("fiber=" + (_fiber != null ? _fiber!.toString() : "null") + ", ");
    buffer.write("iron=" + (_iron != null ? _iron!.toString() : "null") + ", ");
    buffer.write("monounsaturatedFat=" + (_monounsaturatedFat != null ? _monounsaturatedFat!.toString() : "null") + ", ");
    buffer.write("polyunsaturatedFat=" + (_polyunsaturatedFat != null ? _polyunsaturatedFat!.toString() : "null") + ", ");
    buffer.write("potassium=" + (_potassium != null ? _potassium!.toString() : "null") + ", ");
    buffer.write("saturatedFat=" + (_saturatedFat != null ? _saturatedFat!.toString() : "null") + ", ");
    buffer.write("sodium=" + (_sodium != null ? _sodium!.toString() : "null") + ", ");
    buffer.write("sugar=" + (_sugar != null ? _sugar!.toString() : "null") + ", ");
    buffer.write("vitaminC=" + (_vitaminC != null ? _vitaminC!.toString() : "null") + ", ");
    buffer.write("vitaminD=" + (_vitaminD != null ? _vitaminD!.toString() : "null") + ", ");
    buffer.write("transFat=" + (_transFat != null ? _transFat!.toString() : "null") + ", ");
    buffer.write("vitaminA=" + (_vitaminA != null ? _vitaminA!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Nutrients copyWith({double? calories, double? carbohydrates, double? protein, double? fat, double? calcium, double? cholesterol, double? fiber, double? iron, double? monounsaturatedFat, double? polyunsaturatedFat, double? potassium, double? saturatedFat, double? sodium, double? sugar, double? vitaminC, double? vitaminD, double? transFat, double? vitaminA}) {
    return Nutrients._internal(
      calories: calories ?? this.calories,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      calcium: calcium ?? this.calcium,
      cholesterol: cholesterol ?? this.cholesterol,
      fiber: fiber ?? this.fiber,
      iron: iron ?? this.iron,
      monounsaturatedFat: monounsaturatedFat ?? this.monounsaturatedFat,
      polyunsaturatedFat: polyunsaturatedFat ?? this.polyunsaturatedFat,
      potassium: potassium ?? this.potassium,
      saturatedFat: saturatedFat ?? this.saturatedFat,
      sodium: sodium ?? this.sodium,
      sugar: sugar ?? this.sugar,
      vitaminC: vitaminC ?? this.vitaminC,
      vitaminD: vitaminD ?? this.vitaminD,
      transFat: transFat ?? this.transFat,
      vitaminA: vitaminA ?? this.vitaminA);
  }
  
  Nutrients copyWithModelFieldValues({
    ModelFieldValue<double>? calories,
    ModelFieldValue<double>? carbohydrates,
    ModelFieldValue<double>? protein,
    ModelFieldValue<double>? fat,
    ModelFieldValue<double?>? calcium,
    ModelFieldValue<double?>? cholesterol,
    ModelFieldValue<double?>? fiber,
    ModelFieldValue<double?>? iron,
    ModelFieldValue<double?>? monounsaturatedFat,
    ModelFieldValue<double?>? polyunsaturatedFat,
    ModelFieldValue<double?>? potassium,
    ModelFieldValue<double?>? saturatedFat,
    ModelFieldValue<double?>? sodium,
    ModelFieldValue<double?>? sugar,
    ModelFieldValue<double?>? vitaminC,
    ModelFieldValue<double?>? vitaminD,
    ModelFieldValue<double?>? transFat,
    ModelFieldValue<double?>? vitaminA
  }) {
    return Nutrients._internal(
      calories: calories == null ? this.calories : calories.value,
      carbohydrates: carbohydrates == null ? this.carbohydrates : carbohydrates.value,
      protein: protein == null ? this.protein : protein.value,
      fat: fat == null ? this.fat : fat.value,
      calcium: calcium == null ? this.calcium : calcium.value,
      cholesterol: cholesterol == null ? this.cholesterol : cholesterol.value,
      fiber: fiber == null ? this.fiber : fiber.value,
      iron: iron == null ? this.iron : iron.value,
      monounsaturatedFat: monounsaturatedFat == null ? this.monounsaturatedFat : monounsaturatedFat.value,
      polyunsaturatedFat: polyunsaturatedFat == null ? this.polyunsaturatedFat : polyunsaturatedFat.value,
      potassium: potassium == null ? this.potassium : potassium.value,
      saturatedFat: saturatedFat == null ? this.saturatedFat : saturatedFat.value,
      sodium: sodium == null ? this.sodium : sodium.value,
      sugar: sugar == null ? this.sugar : sugar.value,
      vitaminC: vitaminC == null ? this.vitaminC : vitaminC.value,
      vitaminD: vitaminD == null ? this.vitaminD : vitaminD.value,
      transFat: transFat == null ? this.transFat : transFat.value,
      vitaminA: vitaminA == null ? this.vitaminA : vitaminA.value
    );
  }
  
  Nutrients.fromJson(Map<String, dynamic> json)  
    : _calories = (json['calories'] as num?)?.toDouble(),
      _carbohydrates = (json['carbohydrates'] as num?)?.toDouble(),
      _protein = (json['protein'] as num?)?.toDouble(),
      _fat = (json['fat'] as num?)?.toDouble(),
      _calcium = (json['calcium'] as num?)?.toDouble(),
      _cholesterol = (json['cholesterol'] as num?)?.toDouble(),
      _fiber = (json['fiber'] as num?)?.toDouble(),
      _iron = (json['iron'] as num?)?.toDouble(),
      _monounsaturatedFat = (json['monounsaturatedFat'] as num?)?.toDouble(),
      _polyunsaturatedFat = (json['polyunsaturatedFat'] as num?)?.toDouble(),
      _potassium = (json['potassium'] as num?)?.toDouble(),
      _saturatedFat = (json['saturatedFat'] as num?)?.toDouble(),
      _sodium = (json['sodium'] as num?)?.toDouble(),
      _sugar = (json['sugar'] as num?)?.toDouble(),
      _vitaminC = (json['vitaminC'] as num?)?.toDouble(),
      _vitaminD = (json['vitaminD'] as num?)?.toDouble(),
      _transFat = (json['transFat'] as num?)?.toDouble(),
      _vitaminA = (json['vitaminA'] as num?)?.toDouble();
  
  Map<String, dynamic> toJson() => {
    'calories': _calories, 'carbohydrates': _carbohydrates, 'protein': _protein, 'fat': _fat, 'calcium': _calcium, 'cholesterol': _cholesterol, 'fiber': _fiber, 'iron': _iron, 'monounsaturatedFat': _monounsaturatedFat, 'polyunsaturatedFat': _polyunsaturatedFat, 'potassium': _potassium, 'saturatedFat': _saturatedFat, 'sodium': _sodium, 'sugar': _sugar, 'vitaminC': _vitaminC, 'vitaminD': _vitaminD, 'transFat': _transFat, 'vitaminA': _vitaminA
  };
  
  Map<String, Object?> toMap() => {
    'calories': _calories,
    'carbohydrates': _carbohydrates,
    'protein': _protein,
    'fat': _fat,
    'calcium': _calcium,
    'cholesterol': _cholesterol,
    'fiber': _fiber,
    'iron': _iron,
    'monounsaturatedFat': _monounsaturatedFat,
    'polyunsaturatedFat': _polyunsaturatedFat,
    'potassium': _potassium,
    'saturatedFat': _saturatedFat,
    'sodium': _sodium,
    'sugar': _sugar,
    'vitaminC': _vitaminC,
    'vitaminD': _vitaminD,
    'transFat': _transFat,
    'vitaminA': _vitaminA
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Nutrients";
    modelSchemaDefinition.pluralName = "Nutrients";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'calories',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'carbohydrates',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'protein',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'fat',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'calcium',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'cholesterol',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'fiber',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'iron',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'monounsaturatedFat',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'polyunsaturatedFat',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'potassium',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'saturatedFat',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'sodium',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'sugar',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'vitaminC',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'vitaminD',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'transFat',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'vitaminA',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
  });
}