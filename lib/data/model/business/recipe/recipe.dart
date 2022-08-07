import '../../entity/recipe/recipe_entity.dart';

class Recipe {
  final int id;
  final String title;
  final String image;
  final String? type;

  const Recipe(
      {required this.id, required this.title, required this.image, this.type});

  factory Recipe.fromEntity(RecipeEntity entity) {
    return Recipe(
        id: entity.id,
        title: entity.title,
        image: entity.image,
        type: entity.type);
  }

  RecipeEntity toEntity() {
    return RecipeEntity(id: id, title: title, image: image, type: type);
  }
}
