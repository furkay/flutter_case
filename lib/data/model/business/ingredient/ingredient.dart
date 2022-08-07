import '../../entity/ingredient/ingredients_entity.dart';

class Ingredient {
  final String name;
  final String image;
  final double price;

  const Ingredient({
    required this.name,
    required this.price,
    required this.image,
  });

  factory Ingredient.fromEntity(IngredientEntity entity) {
    return Ingredient(
        name: entity.name, image: entity.image, price: entity.price);
  }

  IngredientEntity toEntity() {
    return IngredientEntity(name: name, image: image, price: price);
  }
}
