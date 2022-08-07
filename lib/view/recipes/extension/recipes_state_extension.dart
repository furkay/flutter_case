import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../bloc/recipes_bloc.dart';

import '../../../data/model/business/recipe/recipe.dart';
part '../_widget/recipes_load_succes_widget.dart';
part '../_widget/recipes_load_progress_widget.dart';
part '../_widget/recipes_load_error_widget.dart';

extension RecipesStateExtension on RecipesState {
  Widget get widget {
    if (this is RecipesLoadProgress) {
      return const _RecipesLoadProgressWidget();
    } else if (this is RecipesLoadSucces) {
      return _RecipesLoadSuccesWidget(
          list: (this as RecipesLoadSucces).recipes);
    } else if (this is RecipesLoadError) {
      return _RecipesLoadErrorWidget(
          errorText: (this as RecipesLoadError).error);
    } else {
      return const SizedBox();
    }
  }
}
