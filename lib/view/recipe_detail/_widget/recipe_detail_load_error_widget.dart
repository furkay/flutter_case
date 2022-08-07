part of '../extension/recipe_detail_extension.dart';

class _RecipeDetailLoadErrorWidget extends StatelessWidget {
  final String errorText;
  const _RecipeDetailLoadErrorWidget({Key? key, required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(errorText);
  }
}

@visibleForTesting
class RecipeDetailLoadErrorWidget extends _RecipeDetailLoadErrorWidget {
  const RecipeDetailLoadErrorWidget({Key? key, required String error})
      : super(key: key, errorText: error);
}
