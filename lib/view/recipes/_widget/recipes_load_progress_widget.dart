part of '../extension/recipes_state_extension.dart';

class _RecipesLoadProgressWidget extends StatelessWidget {
  const _RecipesLoadProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

@visibleForTesting
class RecipesLoadProgressWidget extends _RecipesLoadProgressWidget {
  const RecipesLoadProgressWidget({Key? key})
      : super(
          key: key,
        );
}
