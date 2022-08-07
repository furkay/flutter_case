import 'package:json_annotation/json_annotation.dart';

import '../ingredient/ingredients_entity.dart';

part 'recipe_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDetailEntity {
  final List<IngredientEntity> ingredients;
  final double totalCost;
  final double totalCostPerServing;

  const RecipeDetailEntity(
      {required this.totalCost,
      required this.totalCostPerServing,
      required this.ingredients});

  factory RecipeDetailEntity.fromJson(Map<String, dynamic> map) =>
      _$RecipeDetailEntityFromJson(map);

  Map<String, dynamic> toJson() => _$RecipeDetailEntityToJson(this);
}


//"{ingredients: [{name: cooked broccoli, image: broccoli.jpg, price: 40.04, amount: {metric: {value: 182.0, unit: g}, us: {value: 2.0, unit: cups}}}, {name: raw cauliflower, image: cauliflower.jpg, price: 299.0, amount: {metric: {value: 1.0, unit: head}, us: {value: 1.0, unit: head}}}, {name: coconut oil, image: oil-coconut.jpg, price: 1.56, amount: {metric: {value: 1.0, unit: }, us: {value: 1.0, unit: }}}, {name: cooked brown rice, image: rice-brown-cooked.png, price: 62.68, amount: {metric: {value: 585.0, unit: g}, us: {value: 3.0, unit: cups}}}, {name: garlic, image: garlic.png, price: 33.33, amount: {metric: {value: 5.0, unit: cloves}, us: {value: 5.0, unit: cloves}}}, {name: low sodium soy sauce, image: soy-sauce.jpg, price: 48.81, amount: {metric: {value: 3.0, unit: Tbsps}, us: {value: 3.0, unit: Tbsps}}}, {name: frozen peas, image: peas.jpg, price: 82.86, amount: {metric: {value: 145.0, unit: g}, us: {value: 1.0, unit: cup}}}, {name: scallion, image: spring-onions.jpg, price: 31.68, amount: {metric: {value: 8.0, unit: servings}, us: {value: 8.0, unit: servings}}}, {name: green dark scallions, image: spring-onions.jpg, price: 55.44, amount: {metric: {value: 7.0, unit: }, us: {value: 7.0, unit: }}}, {name: sesame oil, image: sesame-oil.png, price: 21.66, amount: {metric: {value: 0.643, unit: tsps}, us: {value: 0.643, unit: tsps}}}, {name: sesame seeds, image: sesame-seeds.png, price: 246.86, amount: {metric: {value: 8.0, unit: servings}, us: {value: 8.0, unit: servings}}}], totalCost: 923.92, totalCostPerServing: 115.49}"