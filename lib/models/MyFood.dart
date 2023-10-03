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


/** This is an auto generated class representing the MyFood type in your schema. */
class MyFood extends amplify_core.Model {
  static const classType = const _MyFoodModelType();
  final String id;
  final Food? _food;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _accountDataFoodId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MyFoodModelIdentifier get modelIdentifier {
      return MyFoodModelIdentifier(
        id: id
      );
  }
  
  Food get food {
    try {
      return _food!;
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
  
  String? get accountDataFoodId {
    return _accountDataFoodId;
  }
  
  const MyFood._internal({required this.id, required food, createdAt, updatedAt, accountDataFoodId}): _food = food, _createdAt = createdAt, _updatedAt = updatedAt, _accountDataFoodId = accountDataFoodId;
  
  factory MyFood({String? id, required Food food, String? accountDataFoodId}) {
    return MyFood._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      food: food,
      accountDataFoodId: accountDataFoodId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyFood &&
      id == other.id &&
      _food == other._food &&
      _accountDataFoodId == other._accountDataFoodId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MyFood {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("food=" + (_food != null ? _food!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("accountDataFoodId=" + "$_accountDataFoodId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MyFood copyWith({Food? food, String? accountDataFoodId}) {
    return MyFood._internal(
      id: id,
      food: food ?? this.food,
      accountDataFoodId: accountDataFoodId ?? this.accountDataFoodId);
  }
  
  MyFood copyWithModelFieldValues({
    ModelFieldValue<Food>? food,
    ModelFieldValue<String?>? accountDataFoodId
  }) {
    return MyFood._internal(
      id: id,
      food: food == null ? this.food : food.value,
      accountDataFoodId: accountDataFoodId == null ? this.accountDataFoodId : accountDataFoodId.value
    );
  }
  
  MyFood.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _food = json['food']?['serializedData'] != null
        ? Food.fromJson(new Map<String, dynamic>.from(json['food']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _accountDataFoodId = json['accountDataFoodId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'food': _food?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'accountDataFoodId': _accountDataFoodId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'food': _food,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'accountDataFoodId': _accountDataFoodId
  };

  static final amplify_core.QueryModelIdentifier<MyFoodModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MyFoodModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FOOD = amplify_core.QueryField(fieldName: "food");
  static final ACCOUNTDATAFOODID = amplify_core.QueryField(fieldName: "accountDataFoodId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MyFood";
    modelSchemaDefinition.pluralName = "MyFoods";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'food',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Food')
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
      key: MyFood.ACCOUNTDATAFOODID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _MyFoodModelType extends amplify_core.ModelType<MyFood> {
  const _MyFoodModelType();
  
  @override
  MyFood fromJson(Map<String, dynamic> jsonData) {
    return MyFood.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'MyFood';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MyFood] in your schema.
 */
class MyFoodModelIdentifier implements amplify_core.ModelIdentifier<MyFood> {
  final String id;

  /** Create an instance of MyFoodModelIdentifier using [id] the primary key. */
  const MyFoodModelIdentifier({
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
  String toString() => 'MyFoodModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MyFoodModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}