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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ShoppingCartModel type in your schema. */
@immutable
class ShoppingCartModel extends Model {
  static const classType = const _ShoppingCartModelModelType();
  final String id;
  final String? _name;
  final int? _price;
  final String? _option;
  final int? _count;
  final bool? _isSelected;
  final int? _sequence;
  final String? _iamge_info;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ShoppingCartModelModelIdentifier get modelIdentifier {
      return ShoppingCartModelModelIdentifier(
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
  
  int get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get option {
    try {
      return _option!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get count {
    try {
      return _count!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isSelected {
    try {
      return _isSelected!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get sequence {
    try {
      return _sequence!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get iamge_info {
    return _iamge_info;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ShoppingCartModel._internal({required this.id, required name, required price, required option, required count, required isSelected, required sequence, iamge_info, createdAt, updatedAt}): _name = name, _price = price, _option = option, _count = count, _isSelected = isSelected, _sequence = sequence, _iamge_info = iamge_info, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ShoppingCartModel({String? id, required String name, required int price, required String option, required int count, required bool isSelected, required int sequence, String? iamge_info}) {
    return ShoppingCartModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      price: price,
      option: option,
      count: count,
      isSelected: isSelected,
      sequence: sequence,
      iamge_info: iamge_info);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShoppingCartModel &&
      id == other.id &&
      _name == other._name &&
      _price == other._price &&
      _option == other._option &&
      _count == other._count &&
      _isSelected == other._isSelected &&
      _sequence == other._sequence &&
      _iamge_info == other._iamge_info;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ShoppingCartModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("option=" + "$_option" + ", ");
    buffer.write("count=" + (_count != null ? _count!.toString() : "null") + ", ");
    buffer.write("isSelected=" + (_isSelected != null ? _isSelected!.toString() : "null") + ", ");
    buffer.write("sequence=" + (_sequence != null ? _sequence!.toString() : "null") + ", ");
    buffer.write("iamge_info=" + "$_iamge_info" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ShoppingCartModel copyWith({String? name, int? price, String? option, int? count, bool? isSelected, int? sequence, String? iamge_info}) {
    return ShoppingCartModel._internal(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      option: option ?? this.option,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
      sequence: sequence ?? this.sequence,
      iamge_info: iamge_info ?? this.iamge_info);
  }
  
  ShoppingCartModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _price = (json['price'] as num?)?.toInt(),
      _option = json['option'],
      _count = (json['count'] as num?)?.toInt(),
      _isSelected = json['isSelected'],
      _sequence = (json['sequence'] as num?)?.toInt(),
      _iamge_info = json['iamge_info'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'price': _price, 'option': _option, 'count': _count, 'isSelected': _isSelected, 'sequence': _sequence, 'iamge_info': _iamge_info, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'price': _price, 'option': _option, 'count': _count, 'isSelected': _isSelected, 'sequence': _sequence, 'iamge_info': _iamge_info, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ShoppingCartModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ShoppingCartModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField OPTION = QueryField(fieldName: "option");
  static final QueryField COUNT = QueryField(fieldName: "count");
  static final QueryField ISSELECTED = QueryField(fieldName: "isSelected");
  static final QueryField SEQUENCE = QueryField(fieldName: "sequence");
  static final QueryField IAMGE_INFO = QueryField(fieldName: "iamge_info");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShoppingCartModel";
    modelSchemaDefinition.pluralName = "ShoppingCartModels";
    
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
      key: ShoppingCartModel.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.OPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.COUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.ISSELECTED,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.SEQUENCE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShoppingCartModel.IAMGE_INFO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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

class _ShoppingCartModelModelType extends ModelType<ShoppingCartModel> {
  const _ShoppingCartModelModelType();
  
  @override
  ShoppingCartModel fromJson(Map<String, dynamic> jsonData) {
    return ShoppingCartModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ShoppingCartModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ShoppingCartModel] in your schema.
 */
@immutable
class ShoppingCartModelModelIdentifier implements ModelIdentifier<ShoppingCartModel> {
  final String id;

  /** Create an instance of ShoppingCartModelModelIdentifier using [id] the primary key. */
  const ShoppingCartModelModelIdentifier({
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
  String toString() => 'ShoppingCartModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ShoppingCartModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}