part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipesLoaded extends RecipesEvent {}

class RecipesSearched extends RecipesEvent {
  final String text;

  const RecipesSearched(this.text);
}
