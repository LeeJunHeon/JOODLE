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


/** This is an auto generated class representing the PopularMenuListModel type in your schema. */
@immutable
class PopularMenuListModel extends Model {
  static const classType = const _PopularMenuListModelModelType();
  final String id;
  final String? _name;
  final int? _price;
  final String? _detail;
  final int? _rank;
  final String? _image_info;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PopularMenuListModelModelIdentifier get modelIdentifier {
      return PopularMenuListModelModelIdentifier(
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
  
  String get detail {
    try {
      return _detail!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get rank {
    try {
      return _rank!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get image_info {
    return _image_info;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PopularMenuListModel._internal({required this.id, required name, required price, required detail, required rank, image_info, createdAt, updatedAt}): _name = name, _price = price, _detail = detail, _rank = rank, _image_info = image_info, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PopularMenuListModel({String? id, required String name, required int price, required String detail, required int rank, String? image_info}) {
    return PopularMenuListModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      price: price,
      detail: detail,
      rank: rank,
      image_info: image_info);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PopularMenuListModel &&
      id == other.id &&
      _name == other._name &&
      _price == other._price &&
      _detail == other._detail &&
      _rank == other._rank &&
      _image_info == other._image_info;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PopularMenuListModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("detail=" + "$_detail" + ", ");
    buffer.write("rank=" + (_rank != null ? _rank!.toString() : "null") + ", ");
    buffer.write("image_info=" + "$_image_info" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PopularMenuListModel copyWith({String? name, int? price, String? detail, int? rank, String? image_info}) {
    return PopularMenuListModel._internal(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      detail: detail ?? this.detail,
      rank: rank ?? this.rank,
      image_info: image_info ?? this.image_info);
  }
  
  PopularMenuListModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _price = (json['price'] as num?)?.toInt(),
      _detail = json['detail'],
      _rank = (json['rank'] as num?)?.toInt(),
      _image_info = json['image_info'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'price': _price, 'detail': _detail, 'rank': _rank, 'image_info': _image_info, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'price': _price, 'detail': _detail, 'rank': _rank, 'image_info': _image_info, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<PopularMenuListModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PopularMenuListModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField DETAIL = QueryField(fieldName: "detail");
  static final QueryField RANK = QueryField(fieldName: "rank");
  static final QueryField IMAGE_INFO = QueryField(fieldName: "image_info");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PopularMenuListModel";
    modelSchemaDefinition.pluralName = "PopularMenuListModels";
    
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
      key: PopularMenuListModel.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PopularMenuListModel.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PopularMenuListModel.DETAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PopularMenuListModel.RANK,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PopularMenuListModel.IMAGE_INFO,
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

class _PopularMenuListModelModelType extends ModelType<PopularMenuListModel> {
  const _PopularMenuListModelModelType();
  
  @override
  PopularMenuListModel fromJson(Map<String, dynamic> jsonData) {
    return PopularMenuListModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PopularMenuListModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PopularMenuListModel] in your schema.
 */
@immutable
class PopularMenuListModelModelIdentifier implements ModelIdentifier<PopularMenuListModel> {
  final String id;

  /** Create an instance of PopularMenuListModelModelIdentifier using [id] the primary key. */
  const PopularMenuListModelModelIdentifier({
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
  String toString() => 'PopularMenuListModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PopularMenuListModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}