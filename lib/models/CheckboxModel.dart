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

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CheckboxModel type in your schema. */
@immutable
class CheckboxModel extends Model {
  static const classType = const _CheckboxModelModelType();
  final String id;
  final String? _name;
  final String? _menu_name;
  final List<String>? _option;
  final List<int>? _price;
  final List<bool>? _isSelected;
  final int? _sequence;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CheckboxModelModelIdentifier get modelIdentifier {
      return CheckboxModelModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get menu_name {
    try {
      return _menu_name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get option {
    return _option;
  }
  
  List<int>? get price {
    return _price;
  }
  
  List<bool>? get isSelected {
    return _isSelected;
  }
  
  int? get sequence {
    return _sequence;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CheckboxModel._internal({required this.id, required name, required menu_name, option, price, isSelected, sequence, createdAt, updatedAt}): _name = name, _menu_name = menu_name, _option = option, _price = price, _isSelected = isSelected, _sequence = sequence, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CheckboxModel({String? id, required String name, required String menu_name, List<String>? option, List<int>? price, List<bool>? isSelected, int? sequence}) {
    return CheckboxModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      menu_name: menu_name,
      option: option != null ? List<String>.unmodifiable(option) : option,
      price: price != null ? List<int>.unmodifiable(price) : price,
      isSelected: isSelected != null ? List<bool>.unmodifiable(isSelected) : isSelected,
      sequence: sequence);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckboxModel &&
      id == other.id &&
      _name == other._name &&
      _menu_name == other._menu_name &&
      DeepCollectionEquality().equals(_option, other._option) &&
      DeepCollectionEquality().equals(_price, other._price) &&
      DeepCollectionEquality().equals(_isSelected, other._isSelected) &&
      _sequence == other._sequence;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CheckboxModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("menu_name=" + "$_menu_name" + ", ");
    buffer.write("option=" + (_option != null ? _option!.toString() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("isSelected=" + (_isSelected != null ? _isSelected!.toString() : "null") + ", ");
    buffer.write("sequence=" + (_sequence != null ? _sequence!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CheckboxModel copyWith({String? name, String? menu_name, List<String>? option, List<int>? price, List<bool>? isSelected, int? sequence}) {
    return CheckboxModel._internal(
      id: id,
      name: name ?? this.name,
      menu_name: menu_name ?? this.menu_name,
      option: option ?? this.option,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
      sequence: sequence ?? this.sequence);
  }
  
  CheckboxModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _menu_name = json['menu_name'],
      _option = json['option']?.cast<String>(),
      _price = (json['price'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _isSelected = json['isSelected']?.cast<bool>(),
      _sequence = (json['sequence'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'menu_name': _menu_name, 'option': _option, 'price': _price, 'isSelected': _isSelected, 'sequence': _sequence, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'menu_name': _menu_name, 'option': _option, 'price': _price, 'isSelected': _isSelected, 'sequence': _sequence, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CheckboxModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CheckboxModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MENU_NAME = QueryField(fieldName: "menu_name");
  static final QueryField OPTION = QueryField(fieldName: "option");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField ISSELECTED = QueryField(fieldName: "isSelected");
  static final QueryField SEQUENCE = QueryField(fieldName: "sequence");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CheckboxModel";
    modelSchemaDefinition.pluralName = "CheckboxModels";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.MENU_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.OPTION,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.PRICE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.ISSELECTED,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.bool))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheckboxModel.SEQUENCE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _CheckboxModelModelType extends ModelType<CheckboxModel> {
  const _CheckboxModelModelType();
  
  @override
  CheckboxModel fromJson(Map<String, dynamic> jsonData) {
    return CheckboxModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CheckboxModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CheckboxModel] in your schema.
 */
@immutable
class CheckboxModelModelIdentifier implements ModelIdentifier<CheckboxModel> {
  final String id;

  /** Create an instance of CheckboxModelModelIdentifier using [id] the primary key. */
  const CheckboxModelModelIdentifier({
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
  String toString() => 'CheckboxModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CheckboxModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}