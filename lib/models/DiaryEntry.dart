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


/** This is an auto generated class representing the DiaryEntry type in your schema. */
class DiaryEntry extends amplify_core.Model {
  static const classType = const _DiaryEntryModelType();
  final amplify_core.TemporalDate? _day;
  final List<Meal>? _meals;
  final String? _user;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  DiaryEntryModelIdentifier get modelIdentifier {
    try {
      return DiaryEntryModelIdentifier(
        day: _day!,
        user: _user!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate get day {
    try {
      return _day!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Meal>? get meals {
    return _meals;
  }
  
  String get user {
    try {
      return _user!;
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
  
  const DiaryEntry._internal({required day, meals, required user, createdAt, updatedAt}): _day = day, _meals = meals, _user = user, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DiaryEntry({required amplify_core.TemporalDate day, List<Meal>? meals, required String user}) {
    return DiaryEntry._internal(
      day: day,
      meals: meals != null ? List<Meal>.unmodifiable(meals) : meals,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryEntry &&
      _day == other._day &&
      DeepCollectionEquality().equals(_meals, other._meals) &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DiaryEntry {");
    buffer.write("day=" + (_day != null ? _day!.format() : "null") + ", ");
    buffer.write("meals=" + (_meals != null ? _meals!.toString() : "null") + ", ");
    buffer.write("user=" + "$_user" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DiaryEntry copyWith({List<Meal>? meals}) {
    return DiaryEntry._internal(
      day: day,
      meals: meals ?? this.meals,
      user: user);
  }
  
  DiaryEntry copyWithModelFieldValues({
    ModelFieldValue<List<Meal>>? meals
  }) {
    return DiaryEntry._internal(
      day: day,
      meals: meals == null ? this.meals : meals.value,
      user: user
    );
  }
  
  DiaryEntry.fromJson(Map<String, dynamic> json)  
    : _day = json['day'] != null ? amplify_core.TemporalDate.fromString(json['day']) : null,
      _meals = json['meals'] is List
        ? (json['meals'] as List)
          .where((e) => e != null)
          .map((e) => Meal.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _user = json['user'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'day': _day?.format(), 'meals': _meals?.map((Meal? e) => e?.toJson()).toList(), 'user': _user, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'day': _day,
    'meals': _meals,
    'user': _user,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DiaryEntryModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DiaryEntryModelIdentifier>();
  static final DAY = amplify_core.QueryField(fieldName: "day");
  static final MEALS = amplify_core.QueryField(fieldName: "meals");
  static final USER = amplify_core.QueryField(fieldName: "user");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DiaryEntry";
    modelSchemaDefinition.pluralName = "DiaryEntries";
    
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
      amplify_core.ModelIndex(fields: const ["day", "user"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiaryEntry.DAY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'meals',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Meal')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiaryEntry.USER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _DiaryEntryModelType extends amplify_core.ModelType<DiaryEntry> {
  const _DiaryEntryModelType();
  
  @override
  DiaryEntry fromJson(Map<String, dynamic> jsonData) {
    return DiaryEntry.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'DiaryEntry';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [DiaryEntry] in your schema.
 */
class DiaryEntryModelIdentifier implements amplify_core.ModelIdentifier<DiaryEntry> {
  final amplify_core.TemporalDate day;
  final String user;

  /**
   * Create an instance of DiaryEntryModelIdentifier using [day] the primary key.
   * And [user] the sort key.
   */
  const DiaryEntryModelIdentifier({
    required this.day,
    required this.user});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'day': day,
    'user': user
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'DiaryEntryModelIdentifier(day: $day, user: $user)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DiaryEntryModelIdentifier &&
      day == other.day &&
      user == other.user;
  }
  
  @override
  int get hashCode =>
    day.hashCode ^
    user.hashCode;
}