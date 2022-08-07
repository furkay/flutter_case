import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/field/field.dart';
import '../../../data/repository/recipe_repository.dart';
import '../bloc/recipes_bloc.dart';
import '../extension/recipes_state_extension.dart';

import '../../../core/init/locator.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecipesBloc(sl.get<RecipeRepository>())..add(RecipesLoaded()),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BlocBuilder<RecipesBloc, RecipesState>(
              builder: (context, state) {
                return Field(
                    onChanged: (val) => context.read<RecipesBloc>().add(
                          RecipesSearched(val),
                        ),
                    hintText: 'Search..');
              },
            ),
            Expanded(
              child: BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
                  return state.widget;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
