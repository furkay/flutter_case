import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_case/core/base/service/i_base_reposityory.dart';
import 'package:flutter_case/core/exception/request_exception.dart';
import 'package:flutter_case/core/exception/response_exception.dart';
import 'package:flutter_case/core/network/network_manager.dart';
import 'package:flutter_case/data/model/business/recipe/recipe.dart';
import 'package:flutter_case/data/model/business/recipe_detail/recipe_detail.dart';
import 'package:flutter_case/data/repository/recipe_repository.dart';
import 'package:flutter_case/data/service/recipe_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late RecipeRepository recipeRepository;
  late RecipeService recipeService;
  late NetworkDioManager networkDioManager;
  late DioAdapter dioAdapter;

  setUp(() {
    const baseUrl = 'https://google.com';

    networkDioManager =
        NetworkDioManager(options: BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(dio: networkDioManager);
    recipeService = RecipeService(networkDioManager);
    recipeRepository = RecipeRepository(recipeService);
  });

  tearDown(() {
    //close repo
  });

  test('should create recipeRepository without client', () {
    expect(recipeRepository, isA<RecipeRepository>());
    expect(recipeRepository, isA<IBaseRepository>());
  });

  group('get recipes list method scenarios', () {
    test('mocking with fake data and get method test ->return List<Recipe> ',
        () async {
      const fakeData =
          '{"results":[{"id":716426,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"https://spoonacular.com/recipeImages/716426-312x231.jpg","imageType":"jpg"},{"id":715594,"title":"Homemade Garlic and Basil French Fries","image":"https://spoonacular.com/recipeImages/715594-312x231.jpg","imageType":"jpg"},{"id":715497,"title":"Berry Banana Breakfast Smoothie","image":"https://spoonacular.com/recipeImages/715497-312x231.jpg","imageType":"jpg"},{"id":644387,"title":"Garlicky Kale","image":"https://spoonacular.com/recipeImages/644387-312x231.jpg","imageType":"jpg"},{"id":716268,"title":"African Chicken Peanut Stew","image":"https://spoonacular.com/recipeImages/716268-312x231.jpg","imageType":"jpg"},{"id":716381,"title":"Nigerian Snail Stew","image":"https://spoonacular.com/recipeImages/716381-312x231.jpg","imageType":"jpg"},{"id":782601,"title":"Red Kidney Bean Jambalaya","image":"https://spoonacular.com/recipeImages/782601-312x231.jpg","imageType":"jpg"},{"id":794349,"title":"Broccoli and Chickpea Rice Salad","image":"https://spoonacular.com/recipeImages/794349-312x231.jpg","imageType":"jpg"},{"id":715446,"title":"Slow Cooker Beef Stew","image":"https://spoonacular.com/recipeImages/715446-312x231.jpg","imageType":"jpg"},{"id":715415,"title":"Red Lentil Soup with Chicken and Turnips","image":"https://spoonacular.com/recipeImages/715415-312x231.jpg","imageType":"jpg"}],"offset":0,"number":10,"totalResults":5219}';

      dioAdapter.onGet('/recipes/complexSearch',
          (server) => server.reply(200, jsonDecode(fakeData)));

      final result = await recipeRepository.getRecipes();
      expect(result.isNotEmpty, true);
      expect(result, isA<List<Recipe>>());
    });

    test(
        'mocking with fake data and get recipe response 200 -> throws ResponseException',
        () async {
      const fakeJson = '{"Response" : "False","Error": "Incorrect data"}';

      dioAdapter.onGet('/recipes/complexSearch',
          (server) => server.reply(200, jsonDecode(fakeJson)));
      expect(() => recipeRepository.getRecipes(),
          throwsA(isA<ResponseException>()));
    });

    test(
        'mocking with fake data and get recipe response 400 -> throws RequestException',
        () async {
      const fakeJson = '{"Response" : "False","Error": "Incorrect data"}';

      dioAdapter.onGet('/recipes/complexSearch',
          (server) => server.reply(400, jsonDecode(fakeJson)));

      //expect(result, isA<List<Movie>>());
      expect(() => recipeRepository.getRecipes(),
          throwsA(isA<RequestException>()));
    });
  });

  group('get recipe detail method scenarios', () {
    test(
        'mocking with fake data and get method test priceBreakdownWidget -> return RecipeDetail',
        () async {
      const fakeData =
          '{"ingredients":[{"name":"cooked broccoli","image":"broccoli.jpg","price":40.04,"amount":{"metric":{"value":182,"unit":"g"},"us":{"value":2,"unit":"cups"}}},{"name":"raw cauliflower","image":"cauliflower.jpg","price":299,"amount":{"metric":{"value":1,"unit":"head"},"us":{"value":1,"unit":"head"}}},{"name":"coconut oil","image":"oil-coconut.jpg","price":1.56,"amount":{"metric":{"value":1,"unit":""},"us":{"value":1,"unit":""}}},{"name":"cooked brown rice","image":"rice-brown-cooked.png","price":62.68,"amount":{"metric":{"value":585,"unit":"g"},"us":{"value":3,"unit":"cups"}}},{"name":"garlic","image":"garlic.png","price":33.33,"amount":{"metric":{"value":5,"unit":"cloves"},"us":{"value":5,"unit":"cloves"}}},{"name":"low sodium soy sauce","image":"soy-sauce.jpg","price":48.81,"amount":{"metric":{"value":3,"unit":"Tbsps"},"us":{"value":3,"unit":"Tbsps"}}},{"name":"frozen peas","image":"peas.jpg","price":82.86,"amount":{"metric":{"value":145,"unit":"g"},"us":{"value":1,"unit":"cup"}}},{"name":"scallion","image":"spring-onions.jpg","price":31.68,"amount":{"metric":{"value":8,"unit":"servings"},"us":{"value":8,"unit":"servings"}}},{"name":"green dark scallions","image":"spring-onions.jpg","price":55.44,"amount":{"metric":{"value":7,"unit":""},"us":{"value":7,"unit":""}}},{"name":"sesame oil","image":"sesame-oil.png","price":21.66,"amount":{"metric":{"value":0.643,"unit":"tsps"},"us":{"value":0.643,"unit":"tsps"}}},{"name":"sesame seeds","image":"sesame-seeds.png","price":246.86,"amount":{"metric":{"value":8,"unit":"servings"},"us":{"value":8,"unit":"servings"}}}],"totalCost":923.92,"totalCostPerServing":115.49}';
      dioAdapter.onGet(
          '/recipes/1/priceBreakdownWidget.json',
          (server) => server.reply(
                200,
                jsonDecode(fakeData),
              ));

      final result = await recipeRepository.getRecipeDetail(1);
      expect(result, isA<RecipeDetail>());
    });

    test(
        'mocking with fake data and get method test priceBreakdownWidget -> throws ResponseException',
        () async {
      const fakeData = '{"Response" : "False","Error": "Incorrect data"}';

      dioAdapter.onGet(
          '/recipes/1/priceBreakdownWidget.json',
          (server) => server.reply(
                200,
                jsonDecode(fakeData),
              ));

      expect(() => recipeRepository.getRecipeDetail(1),
          throwsA(isA<ResponseException>()));
    });

    test(
        'mocking with fake data and and get method test priceBreakdownWidget -> throws RequestException',
        () async {
      const fakeData = '{"Response" : "False","Error": "Incorrect data"}';

      dioAdapter.onGet(
          '/recipes/1/priceBreakdownWidget.json',
          (server) => server.reply(
                400,
                jsonDecode(fakeData),
              ));

      expect(() => recipeRepository.getRecipeDetail(1),
          throwsA(isA<RequestException>()));
    });
  });
}
