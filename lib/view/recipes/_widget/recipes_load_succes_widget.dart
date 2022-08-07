part of '../extension/recipes_state_extension.dart';

class _RecipesLoadSuccesWidget extends StatelessWidget {
  final List<Recipe> list;
  const _RecipesLoadSuccesWidget({Key? key, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(list[index].title),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () async => await AutoRouter.of(context)
            .navigateNamed('recipes/${list[index].id}/detail'),
      ),
    );
  }
}

@visibleForTesting
class RecipesLoadSuccessWidget extends _RecipesLoadSuccesWidget {
  const RecipesLoadSuccessWidget({Key? key, required list})
      : super(
          key: key,
          list: list,
        );
}
