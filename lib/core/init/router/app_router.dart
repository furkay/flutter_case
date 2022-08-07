import 'package:auto_route/annotations.dart';

import '../../../view/recipe_detail/view/recipe_detail_page.dart';
import '../../../view/recipes/view/recipes_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(initial: true, path: '/', page: RecipesPage, children: []),
    AutoRoute(page: RecipeDetailPage, path: 'recipes/:id/detail'),
  ],
)
class $AppRouter {}
