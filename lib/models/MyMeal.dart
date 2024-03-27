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


/** This is an auto generated class representing the MyMeal type in your schema. */
class MyMeal extends amplify_core.Model {
  static const classType = const _MyMealModelType();
  final String id;
  final String? _name;
  final List<Food>? _foods;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _accountDataMealsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MyMealModelIdentifier get modelIdentifier {
      return MyMealModelIdentifier(
        id: id
      );
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get accountDataMealsId {
    return _accountDataMealsId;
  }
  
  const MyMeal._internal({required this.id, required name, required foods, createdAt, updatedAt, accountDataMealsId}): _name = name, _foods = foods, _createdAt = createdAt, _updatedAt = updatedAt, _accountDataMealsId = accountDataMealsId;
  
  factory MyMeal({String? id, required String name, required List<Food> foods, String? accountDataMealsId}) {
    return MyMeal._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      foods: foods != null ? List<Food>.unmodifiable(foods) : foods,
      accountDataMealsId: accountDataMealsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyMeal &&
      id == other.id &&
      _name == other._name &&
      DeepCollectionEquality().equals(_foods, other._foods) &&
      _accountDataMealsId == other._accountDataMealsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MyMeal {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("foods=" + (_foods != null ? _foods!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("accountDataMealsId=" + "$_accountDataMealsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MyMeal copyWith({String? name, List<Food>? foods, String? accountDataMealsId}) {
    return MyMeal._internal(
      id: id,
      name: name ?? this.name,
      foods: foods ?? this.foods,
      accountDataMealsId: accountDataMealsId ?? this.accountDataMealsId);
  }
  
  MyMeal copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<List<Food>>? foods,
    ModelFieldValue<String?>? accountDataMealsId
  }) {
    return MyMeal._internal(
      id: id,
      name: name == null ? this.name : name.value,
      foods: foods == null ? this.foods : foods.value,
      accountDataMealsId: accountDataMealsId == null ? this.accountDataMealsId : accountDataMealsId.value
    );
  }
  
  MyMeal.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _foods = json['foods'] is List
        ? (json['foods'] as List)
          .where((e) => e != null)
          .map((e) => Food.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _accountDataMealsId = json['accountDataMealsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'foods': _foods?.map((Food? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'accountDataMealsId': _accountDataMealsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'foods': _foods,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'accountDataMealsId': _accountDataMealsId
  };

  static final amplify_core.QueryModelIdentifier<MyMealModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MyMealModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final FOODS = amplify_core.QueryField(fieldName: "foods");
  static final ACCOUNTDATAMEALSID = amplify_core.QueryField(fieldName: "accountDataMealsId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MyMeal";
    modelSchemaDefinition.pluralName = "MyMeals";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MyMeal.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'foods',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Food')
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MyMeal.ACCOUNTDATAMEALSID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _MyMealModelType extends amplify_core.ModelType<MyMeal> {
  const _MyMealModelType();
  
  @override
  MyMeal fromJson(Map<String, dynamic> jsonData) {
    return MyMeal.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'MyMeal';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MyMeal] in your schema.
 */
class MyMealModelIdentifier implements amplify_core.ModelIdentifier<MyMeal> {
  final String id;

  /** Create an instance of MyMealModelIdentifier using [id] the primary key. */
  const MyMealModelIdentifier({
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
  String toString() => 'MyMealModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MyMealModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}