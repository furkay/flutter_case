import 'package:flutter/material.dart';
import '../../../core/constant/api_constant.dart';

import '../../../data/model/business/recipe_detail/recipe_detail.dart';
import '../bloc/recipe_detail_bloc.dart';

part '../_widget/recipe_detail_load_succes_widget.dart';
part '../_widget/recipe_detail_load_progress_widget.dart';
part '../_widget/recipe_detail_load_error_widget.dart';

extension RecipeDetailStateExtension on RecipeDetailState {
  Widget get widget {
    if (this is RecipeDetailLoadProgress) {
      return const _RecipeDetailLoadProgressWidget();
    } else if (this is RecipeDetailLoadSucces) {
      return _RecipeDetailLoadSuccesWidget(
          model: (this as RecipeDetailLoadSucces).recipeDetailModel);
    } else if (this is RecipeDetailLoadError) {
      return _RecipeDetailLoadErrorWidget(
          errorText: (this as RecipeDetailLoadError).error);
    } else {
      return const SizedBox();
    }
  }
}
