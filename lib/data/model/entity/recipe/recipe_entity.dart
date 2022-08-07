import 'package:json_annotation/json_annotation.dart';
part 'recipe_entity.g.dart';

@JsonSerializable()
class RecipeEntity {
  final int id;
  final String title;
  final String image;
  final String? type;

  const RecipeEntity(
      {required this.id, required this.title, required this.image, this.type});

  factory RecipeEntity.fromJson(Map<String, dynamic> map) =>
      _$RecipeEntityFromJson(map);

  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);
}
