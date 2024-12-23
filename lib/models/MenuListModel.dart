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


/** This is an auto generated class representing the MenuListModel type in your schema. */
@immutable
class MenuListModel extends Model {
  static const classType = const _MenuListModelModelType();
  final String id;
  final String? _category_name;
  final List<String>? _name;
  final List<int>? _price;
  final List<String>? _detail;
  final List<int>? _sequence_in;
  final int? _sequence_out;
  final List<String>? _image_info;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MenuListModelModelIdentifier get modelIdentifier {
      return MenuListModelModelIdentifier(
        id: id
      );
  }
  
  String get category_name {
    try {
      return _category_name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get name {
    return _name;
  }
  
  List<int>? get price {
    return _price;
  }
  
  List<String>? get detail {
    return _detail;
  }
  
  List<int>? get sequence_in {
    return _sequence_in;
  }
  
  int? get sequence_out {
    return _sequence_out;
  }
  
  List<String>? get image_info {
    return _image_info;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MenuListModel._internal({required this.id, required category_name, name, price, detail, sequence_in, sequence_out, image_info, createdAt, updatedAt}): _category_name = category_name, _name = name, _price = price, _detail = detail, _sequence_in = sequence_in, _sequence_out = sequence_out, _image_info = image_info, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MenuListModel({String? id, required String category_name, List<String>? name, List<int>? price, List<String>? detail, List<int>? sequence_in, int? sequence_out, List<String>? image_info}) {
    return MenuListModel._internal(
      id: id == null ? UUID.getUUID() : id,
      category_name: category_name,
      name: name != null ? List<String>.unmodifiable(name) : name,
      price: price != null ? List<int>.unmodifiable(price) : price,
      detail: detail != null ? List<String>.unmodifiable(detail) : detail,
      sequence_in: sequence_in != null ? List<int>.unmodifiable(sequence_in) : sequence_in,
      sequence_out: sequence_out,
      image_info: image_info != null ? List<String>.unmodifiable(image_info) : image_info);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuListModel &&
      id == other.id &&
      _category_name == other._category_name &&
      DeepCollectionEquality().equals(_name, other._name) &&
      DeepCollectionEquality().equals(_price, other._price) &&
      DeepCollectionEquality().equals(_detail, other._detail) &&
      DeepCollectionEquality().equals(_sequence_in, other._sequence_in) &&
      _sequence_out == other._sequence_out &&
      DeepCollectionEquality().equals(_image_info, other._image_info);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MenuListModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("category_name=" + "$_category_name" + ", ");
    buffer.write("name=" + (_name != null ? _name!.toString() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("detail=" + (_detail != null ? _detail!.toString() : "null") + ", ");
    buffer.write("sequence_in=" + (_sequence_in != null ? _sequence_in!.toString() : "null") + ", ");
    buffer.write("sequence_out=" + (_sequence_out != null ? _sequence_out!.toString() : "null") + ", ");
    buffer.write("image_info=" + (_image_info != null ? _image_info!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MenuListModel copyWith({String? category_name, List<String>? name, List<int>? price, List<String>? detail, List<int>? sequence_in, int? sequence_out, List<String>? image_info}) {
    return MenuListModel._internal(
      id: id,
      category_name: category_name ?? this.category_name,
      name: name ?? this.name,
      price: price ?? this.price,
      detail: detail ?? this.detail,
      sequence_in: sequence_in ?? this.sequence_in,
      sequence_out: sequence_out ?? this.sequence_out,
      image_info: image_info ?? this.image_info);
  }
  
  MenuListModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _category_name = json['category_name'],
      _name = json['name']?.cast<String>(),
      _price = (json['price'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _detail = json['detail']?.cast<String>(),
      _sequence_in = (json['sequence_in'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _sequence_out = (json['sequence_out'] as num?)?.toInt(),
      _image_info = json['image_info']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'category_name': _category_name, 'name': _name, 'price': _price, 'detail': _detail, 'sequence_in': _sequence_in, 'sequence_out': _sequence_out, 'image_info': _image_info, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'category_name': _category_name, 'name': _name, 'price': _price, 'detail': _detail, 'sequence_in': _sequence_in, 'sequence_out': _sequence_out, 'image_info': _image_info, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<MenuListModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<MenuListModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CATEGORY_NAME = QueryField(fieldName: "category_name");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField DETAIL = QueryField(fieldName: "detail");
  static final QueryField SEQUENCE_IN = QueryField(fieldName: "sequence_in");
  static final QueryField SEQUENCE_OUT = QueryField(fieldName: "sequence_out");
  static final QueryField IMAGE_INFO = QueryField(fieldName: "image_info");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MenuListModel";
    modelSchemaDefinition.pluralName = "MenuListModels";
    
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
      key: MenuListModel.CATEGORY_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.NAME,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.PRICE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.DETAIL,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.SEQUENCE_IN,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.SEQUENCE_OUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuListModel.IMAGE_INFO,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
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

class _MenuListModelModelType extends ModelType<MenuListModel> {
  const _MenuListModelModelType();
  
  @override
  MenuListModel fromJson(Map<String, dynamic> jsonData) {
    return MenuListModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'MenuListModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MenuListModel] in your schema.
 */
@immutable
class MenuListModelModelIdentifier implements ModelIdentifier<MenuListModel> {
  final String id;

  /** Create an instance of MenuListModelModelIdentifier using [id] the primary key. */
  const MenuListModelModelIdentifier({
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
  String toString() => 'MenuListModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MenuListModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}