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
  final NutrientGoals? _nutrientGoals;
  final List<String>? _mealNames;
  final int? _themeModeIdx;
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
  
  NutrientGoals get nutrientGoals {
    try {
      return _nutrientGoals!;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AccountData._internal({required this.id, required nutrientGoals, mealNames, themeModeIdx, createdAt, updatedAt}): _nutrientGoals = nutrientGoals, _mealNames = mealNames, _themeModeIdx = themeModeIdx, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AccountData({String? id, required NutrientGoals nutrientGoals, List<String>? mealNames, int? themeModeIdx}) {
    return AccountData._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nutrientGoals: nutrientGoals,
      mealNames: mealNames != null ? List<String>.unmodifiable(mealNames) : mealNames,
      themeModeIdx: themeModeIdx);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountData &&
      id == other.id &&
      _nutrientGoals == other._nutrientGoals &&
      DeepCollectionEquality().equals(_mealNames, other._mealNames) &&
      _themeModeIdx == other._themeModeIdx;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AccountData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nutrientGoals=" + (_nutrientGoals != null ? _nutrientGoals!.toString() : "null") + ", ");
    buffer.write("mealNames=" + (_mealNames != null ? _mealNames!.toString() : "null") + ", ");
    buffer.write("themeModeIdx=" + (_themeModeIdx != null ? _themeModeIdx!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AccountData copyWith({NutrientGoals? nutrientGoals, List<String>? mealNames, int? themeModeIdx}) {
    return AccountData._internal(
      id: id,
      nutrientGoals: nutrientGoals ?? this.nutrientGoals,
      mealNames: mealNames ?? this.mealNames,
      themeModeIdx: themeModeIdx ?? this.themeModeIdx);
  }
  
  AccountData copyWithModelFieldValues({
    ModelFieldValue<NutrientGoals>? nutrientGoals,
    ModelFieldValue<List<String>>? mealNames,
    ModelFieldValue<int?>? themeModeIdx
  }) {
    return AccountData._internal(
      id: id,
      nutrientGoals: nutrientGoals == null ? this.nutrientGoals : nutrientGoals.value,
      mealNames: mealNames == null ? this.mealNames : mealNames.value,
      themeModeIdx: themeModeIdx == null ? this.themeModeIdx : themeModeIdx.value
    );
  }
  
  AccountData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nutrientGoals = json['nutrientGoals']?['serializedData'] != null
        ? NutrientGoals.fromJson(new Map<String, dynamic>.from(json['nutrientGoals']['serializedData']))
        : null,
      _mealNames = json['mealNames']?.cast<String>(),
      _themeModeIdx = (json['themeModeIdx'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nutrientGoals': _nutrientGoals?.toJson(), 'mealNames': _mealNames, 'themeModeIdx': _themeModeIdx, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nutrientGoals': _nutrientGoals,
    'mealNames': _mealNames,
    'themeModeIdx': _themeModeIdx,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AccountDataModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AccountDataModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NUTRIENTGOALS = amplify_core.QueryField(fieldName: "nutrientGoals");
  static final MEALNAMES = amplify_core.QueryField(fieldName: "mealNames");
  static final THEMEMODEIDX = amplify_core.QueryField(fieldName: "themeModeIdx");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AccountData";
    modelSchemaDefinition.pluralName = "AccountData";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
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
      fieldName: 'nutrientGoals',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'NutrientGoals')
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