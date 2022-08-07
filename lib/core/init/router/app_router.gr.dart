// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_case/view/recipe_detail/view/recipe_detail_page.dart'
    as _i2;
import 'package:flutter_case/view/recipes/view/recipes_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RecipesRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RecipesPage());
    },
    RecipeDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecipeDetailRouteArgs>(
          orElse: () => RecipeDetailRouteArgs(id: pathParams.getInt('id')));
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.RecipeDetailPage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RecipesRoute.name, path: '/'),
        _i3.RouteConfig(RecipeDetailRoute.name, path: 'recipes/:id/detail')
      ];
}

/// generated route for
/// [_i1.RecipesPage]
class RecipesRoute extends _i3.PageRouteInfo<void> {
  const RecipesRoute() : super(RecipesRoute.name, path: '/');

  static const String name = 'RecipesRoute';
}

/// generated route for
/// [_i2.RecipeDetailPage]
class RecipeDetailRoute extends _i3.PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({_i4.Key? key, required int id})
      : super(RecipeDetailRoute.name,
            path: 'recipes/:id/detail',
            args: RecipeDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'RecipeDetailRoute';
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{key: $key, id: $id}';
  }
}
