part of '../extension/recipe_detail_extension.dart';

class _RecipeDetailLoadProgressWidget extends StatelessWidget {
  const _RecipeDetailLoadProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

@visibleForTesting
class RecipeDetailLoadProgressWidget extends _RecipeDetailLoadProgressWidget {
  const RecipeDetailLoadProgressWidget({Key? key}) : super(key: key);
}
