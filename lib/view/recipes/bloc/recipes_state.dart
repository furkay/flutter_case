part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object?> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoadProgress extends RecipesState {}

class RecipesLoadError extends RecipesState {
  final String error;
  const RecipesLoadError(this.error);

  @override
  List<Object?> get props => [error];
}

class RecipesLoadSucces extends RecipesState {
  final List<Recipe> recipes;

  const RecipesLoadSucces(this.recipes);

  @override
  List<Object?> get props => [recipes];
}
