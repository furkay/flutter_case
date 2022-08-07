// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailEntity _$RecipeDetailEntityFromJson(Map<String, dynamic> json) =>
    RecipeDetailEntity(
      totalCost: (json['totalCost'] as num).toDouble(),
      totalCostPerServing: (json['totalCostPerServing'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeDetailEntityToJson(RecipeDetailEntity instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'totalCost': instance.totalCost,
      'totalCostPerServing': instance.totalCostPerServing,
    };
