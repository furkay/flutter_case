part of '../extension/recipes_state_extension.dart';

class _RecipesLoadErrorWidget extends StatelessWidget {
  final String errorText;
  const _RecipesLoadErrorWidget({Key? key, required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(errorText);
  }
}

@visibleForTesting
class RecipesLoadErrorWidget extends _RecipesLoadErrorWidget {
  const RecipesLoadErrorWidget({Key? key, required error})
      : super(
          key: key,
          errorText: error,
        );
}
