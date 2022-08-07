import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/recipe_repository.dart';
import '../extension/recipe_detail_extension.dart';

import '../../../core/init/locator.dart';
import '../bloc/recipe_detail_bloc.dart';

class RecipeDetailPage extends StatelessWidget {
  final int id;
  const RecipeDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeDetailBloc(sl.get<RecipeRepository>(), id)
        ..add(const RecipeDetailLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(id.toString()),
        ),
        body: SafeArea(
          child: BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
            builder: (context, state) {
              return state.widget;
            },
          ),
        ),
      ),
    );
  }
}
