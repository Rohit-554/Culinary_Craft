// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:fud/models/eRecipe/Food.dart' as _i8;
import 'package:fud/models/meals/MealDetail.dart' as _i9;
import 'package:fud/presentation/auth_screens/LoginScreen.dart' as _i1;
import 'package:fud/presentation/auth_screens/SignupScreen.dart' as _i2;
import 'package:fud/presentation/home_screens/ProfileScreen.dart' as _i3;
import 'package:fud/presentation/search_screen/RecipeDetailPage.dart' as _i4;
import 'package:fud/presentation/search_screen/RecipeWidget.dart' as _i5;
import 'package:fud/presentation/search_screen/SearchScreen.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LoginScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SignupScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProfilePage(),
      );
    },
    RecipeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RecipeDetailPage(args.recipe),
      );
    },
    RecipeWidget.name: (routeData) {
      final args = routeData.argsAs<RecipeWidgetArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.RecipeWidget(args.recipes),
      );
    },
    SearchRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignupScreen]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RecipeDetailPage]
class RecipeDetailRoute extends _i7.PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({
    required _i8.Food recipe,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RecipeDetailRoute.name,
          args: RecipeDetailRouteArgs(recipe: recipe),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailRoute';

  static const _i7.PageInfo<RecipeDetailRouteArgs> page =
      _i7.PageInfo<RecipeDetailRouteArgs>(name);
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({required this.recipe});

  final _i8.Food recipe;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{recipe: $recipe}';
  }
}

/// generated route for
/// [_i5.RecipeWidget]
class RecipeWidget extends _i7.PageRouteInfo<RecipeWidgetArgs> {
  RecipeWidget({
    required List<_i9.MealsDetail> recipes,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RecipeWidget.name,
          args: RecipeWidgetArgs(recipes: recipes),
          initialChildren: children,
        );

  static const String name = 'RecipeWidget';

  static const _i7.PageInfo<RecipeWidgetArgs> page =
      _i7.PageInfo<RecipeWidgetArgs>(name);
}

class RecipeWidgetArgs {
  const RecipeWidgetArgs({required this.recipes});

  final List<_i9.MealsDetail> recipes;

  @override
  String toString() {
    return 'RecipeWidgetArgs{recipes: $recipes}';
  }
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
