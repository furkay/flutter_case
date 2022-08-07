class ApiConstant {
  static const String recipesPath = '/recipes/complexSearch';
  static String getDetailPath(int id) =>
      '/recipes/$id/priceBreakdownWidget.json';
  static const String keyHeader = 'apiKey';
  static String imageUrl(String imagePath) =>
      'https://spoonacular.com/cdn/ingredients_100x100/$imagePath';
}
