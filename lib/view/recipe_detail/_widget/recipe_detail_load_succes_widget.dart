part of '../extension/recipe_detail_extension.dart';

class _RecipeDetailLoadSuccesWidget extends StatelessWidget {
  final RecipeDetail model;
  const _RecipeDetailLoadSuccesWidget({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'ingredients'.toUpperCase();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: model.ingredients.length,
            itemBuilder: ((context, index) {
              final item = model.ingredients[index];
              return ListTile(
                leading: SizedBox(
                  width: 60,
                  child: Image.network(
                    ApiConstant.imageUrl(item.image),
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
                ),
                title: Text(item.name),
                subtitle: Text(item.price.toString()),
              );
            }),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(model.totalCost.toString()),
        ),
      ],
    );
  }
}

@visibleForTesting
class RecipeDetailLoadSuccesWidget extends _RecipeDetailLoadSuccesWidget {
  const RecipeDetailLoadSuccesWidget({Key? key, required model})
      : super(key: key, model: model);
}
