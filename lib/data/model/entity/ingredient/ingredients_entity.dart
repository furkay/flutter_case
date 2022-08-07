import 'package:json_annotation/json_annotation.dart';

part 'ingredients_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientEntity {
  final String name;
  final String image;
  final double price;

  const IngredientEntity(
      {required this.name, required this.image, required this.price});

  factory IngredientEntity.fromJson(Map<String, dynamic> map) =>
      _$IngredientEntityFromJson(map);

  Map<String, dynamic> toJson() => _$IngredientEntityToJson(this);
}
