// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientEntity _$IngredientEntityFromJson(Map<String, dynamic> json) =>
    IngredientEntity(
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$IngredientEntityToJson(IngredientEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
