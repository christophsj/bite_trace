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


/** This is an auto generated class representing the AccountData type in your schema. */
class AccountData extends amplify_core.Model {
  static const classType = const _AccountDataModelType();
  final String id;
  final NutrientGoal? _nutrientGoal;
  final List<String>? _mealNames;
  final int? _themeModeIdx;
  final int? _themeColorIdx;
  final String? _name;
  final List<String>? _friends;
  final List<MyFood>? _food;
  final List<MyMeal>? _meals;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AccountDataModelIdentifier get modelIdentifier {
      return AccountDataModelIdentifier(
        id: id
      );
  }
  
  NutrientGoal get nutrientGoal {
    try {
      return _nutrientGoal!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get mealNames {
    return _mealNames;
  }
  
  int? get themeModeIdx {
    return _themeModeIdx;
  }
  
  int? get themeColorIdx {
    return _themeColorIdx;
  }
  
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
  
  List<String>? get friends {
    return _friends;
  }
  
  List<MyFood>? get food {
    return _food;
  }
  
  List<MyMeal>? get meals {
    return _meals;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AccountData._internal({required this.id, required nutrientGoal, mealNames, themeModeIdx, themeColorIdx, required name, friends, food, meals, createdAt, updatedAt}): _nutrientGoal = nutrientGoal, _mealNames = mealNames, _themeModeIdx = themeModeIdx, _themeColorIdx = themeColorIdx, _name = name, _friends = friends, _food = food, _meals = meals, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AccountData({String? id, required NutrientGoal nutrientGoal, List<String>? mealNames, int? themeModeIdx, int? themeColorIdx, required String name, List<String>? friends, List<MyFood>? food, List<MyMeal>? meals}) {
    return AccountData._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nutrientGoal: nutrientGoal,
      mealNames: mealNames != null ? List<String>.unmodifiable(mealNames) : mealNames,
      themeModeIdx: themeModeIdx,
      themeColorIdx: themeColorIdx,
      name: name,
      friends: friends != null ? List<String>.unmodifiable(friends) : friends,
      food: food != null ? List<MyFood>.unmodifiable(food) : food,
      meals: meals != null ? List<MyMeal>.unmodifiable(meals) : meals);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountData &&
      id == other.id &&
      _nutrientGoal == other._nutrientGoal &&
      DeepCollectionEquality().equals(_mealNames, other._mealNames) &&
      _themeModeIdx == other._themeModeIdx &&
      _themeColorIdx == other._themeColorIdx &&
      _name == other._name &&
      DeepCollectionEquality().equals(_friends, other._friends) &&
      DeepCollectionEquality().equals(_food, other._food) &&
      DeepCollectionEquality().equals(_meals, other._meals);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AccountData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nutrientGoal=" + (_nutrientGoal != null ? _nutrientGoal!.toString() : "null") + ", ");
    buffer.write("mealNames=" + (_mealNames != null ? _mealNames!.toString() : "null") + ", ");
    buffer.write("themeModeIdx=" + (_themeModeIdx != null ? _themeModeIdx!.toString() : "null") + ", ");
    buffer.write("themeColorIdx=" + (_themeColorIdx != null ? _themeColorIdx!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("friends=" + (_friends != null ? _friends!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AccountData copyWith({NutrientGoal? nutrientGoal, List<String>? mealNames, int? themeModeIdx, int? themeColorIdx, String? name, List<String>? friends, List<MyFood>? food, List<MyMeal>? meals}) {
    return AccountData._internal(
      id: id,
      nutrientGoal: nutrientGoal ?? this.nutrientGoal,
      mealNames: mealNames ?? this.mealNames,
      themeModeIdx: themeModeIdx ?? this.themeModeIdx,
      themeColorIdx: themeColorIdx ?? this.themeColorIdx,
      name: name ?? this.name,
      friends: friends ?? this.friends,
      food: food ?? this.food,
      meals: meals ?? this.meals);
  }
  
  AccountData copyWithModelFieldValues({
    ModelFieldValue<NutrientGoal>? nutrientGoal,
    ModelFieldValue<List<String>>? mealNames,
    ModelFieldValue<int?>? themeModeIdx,
    ModelFieldValue<int?>? themeColorIdx,
    ModelFieldValue<String>? name,
    ModelFieldValue<List<String>>? friends,
    ModelFieldValue<List<MyFood>>? food,
    ModelFieldValue<List<MyMeal>>? meals
  }) {
    return AccountData._internal(
      id: id,
      nutrientGoal: nutrientGoal == null ? this.nutrientGoal : nutrientGoal.value,
      mealNames: mealNames == null ? this.mealNames : mealNames.value,
      themeModeIdx: themeModeIdx == null ? this.themeModeIdx : themeModeIdx.value,
      themeColorIdx: themeColorIdx == null ? this.themeColorIdx : themeColorIdx.value,
      name: name == null ? this.name : name.value,
      friends: friends == null ? this.friends : friends.value,
      food: food == null ? this.food : food.value,
      meals: meals == null ? this.meals : meals.value
    );
  }
  
  AccountData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nutrientGoal = json['nutrientGoal']?['serializedData'] != null
        ? NutrientGoal.fromJson(new Map<String, dynamic>.from(json['nutrientGoal']['serializedData']))
        : null,
      _mealNames = json['mealNames']?.cast<String>(),
      _themeModeIdx = (json['themeModeIdx'] as num?)?.toInt(),
      _themeColorIdx = (json['themeColorIdx'] as num?)?.toInt(),
      _name = json['name'],
      _friends = json['friends']?.cast<String>(),
      _food = json['food'] is List
        ? (json['food'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MyFood.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _meals = json['meals'] is List
        ? (json['meals'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MyMeal.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nutrientGoal': _nutrientGoal?.toJson(), 'mealNames': _mealNames, 'themeModeIdx': _themeModeIdx, 'themeColorIdx': _themeColorIdx, 'name': _name, 'friends': _friends, 'food': _food?.map((MyFood? e) => e?.toJson()).toList(), 'meals': _meals?.map((MyMeal? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nutrientGoal': _nutrientGoal,
    'mealNames': _mealNames,
    'themeModeIdx': _themeModeIdx,
    'themeColorIdx': _themeColorIdx,
    'name': _name,
    'friends': _friends,
    'food': _food,
    'meals': _meals,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AccountDataModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AccountDataModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NUTRIENTGOAL = amplify_core.QueryField(fieldName: "nutrientGoal");
  static final MEALNAMES = amplify_core.QueryField(fieldName: "mealNames");
  static final THEMEMODEIDX = amplify_core.QueryField(fieldName: "themeModeIdx");
  static final THEMECOLORIDX = amplify_core.QueryField(fieldName: "themeColorIdx");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final FRIENDS = amplify_core.QueryField(fieldName: "friends");
  static final FOOD = amplify_core.QueryField(
    fieldName: "food",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'MyFood'));
  static final MEALS = amplify_core.QueryField(
    fieldName: "meals",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'MyMeal'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AccountData";
    modelSchemaDefinition.pluralName = "AccountData";
    
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
      fieldName: 'nutrientGoal',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'NutrientGoal')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AccountData.MEALNAMES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AccountData.THEMEMODEIDX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AccountData.THEMECOLORIDX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AccountData.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AccountData.FRIENDS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: AccountData.FOOD,
      isRequired: true,
      ofModelName: 'MyFood',
      associatedKey: MyFood.ACCOUNTDATAFOODID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: AccountData.MEALS,
      isRequired: true,
      ofModelName: 'MyMeal',
      associatedKey: MyMeal.ACCOUNTDATAMEALSID
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

class _AccountDataModelType extends amplify_core.ModelType<AccountData> {
  const _AccountDataModelType();
  
  @override
  AccountData fromJson(Map<String, dynamic> jsonData) {
    return AccountData.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AccountData';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AccountData] in your schema.
 */
class AccountDataModelIdentifier implements amplify_core.ModelIdentifier<AccountData> {
  final String id;

  /** Create an instance of AccountDataModelIdentifier using [id] the primary key. */
  const AccountDataModelIdentifier({
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
  String toString() => 'AccountDataModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AccountDataModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}