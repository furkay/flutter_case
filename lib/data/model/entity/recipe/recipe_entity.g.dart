// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
    };
