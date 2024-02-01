// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:fud/models/meals/MealDetail.dart' as _i13;
import 'package:fud/models/meals/MealType.dart' as _i12;
import 'package:fud/presentation/auth_screens/LoginScreen.dart' as _i1;
import 'package:fud/presentation/auth_screens/SignupScreen.dart' as _i2;
import 'package:fud/presentation/home_screens/AboutScreen.dart' as _i3;
import 'package:fud/presentation/home_screens/AddScreen.dart' as _i4;
import 'package:fud/presentation/home_screens/IngredientsScreen.dart' as _i9;
import 'package:fud/presentation/home_screens/MyRecipeDetail.dart' as _i5;
import 'package:fud/presentation/home_screens/ProfileScreen.dart' as _i6;
import 'package:fud/presentation/search_screen/RecipeWidget.dart' as _i7;
import 'package:fud/presentation/search_screen/SearchScreen.dart' as _i8;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LoginScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SignupScreen(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AboutScreen(),
      );
    },
    AddRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddScreen(),
      );
    },
    MyRecipeDetail.name: (routeData) {
      final args = routeData.argsAs<MyRecipeDetailArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MyRecipeDetail(
          snapshot: args.snapshot,
          index: args.index,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProfilePage(),
      );
    },
    RecipeWidget.name: (routeData) {
      final args = routeData.argsAs<RecipeWidgetArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RecipeWidget(args.recipes),
      );
    },
    SearchRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SearchPage(),
      );
    },
    IngredientsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.IngredientsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignupScreen]
class SignupRoute extends _i10.PageRouteInfo<void> {
  const SignupRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AboutScreen]
class AboutRoute extends _i10.PageRouteInfo<void> {
  const AboutRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddScreen]
class AddRoute extends _i10.PageRouteInfo<void> {
  const AddRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MyRecipeDetail]
class MyRecipeDetail extends _i10.PageRouteInfo<MyRecipeDetailArgs> {
  MyRecipeDetail({
    required _i11.AsyncSnapshot<_i12.MealType> snapshot,
    required int index,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MyRecipeDetail.name,
          args: MyRecipeDetailArgs(
            snapshot: snapshot,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'MyRecipeDetail';

  static const _i10.PageInfo<MyRecipeDetailArgs> page =
      _i10.PageInfo<MyRecipeDetailArgs>(name);
}

class MyRecipeDetailArgs {
  const MyRecipeDetailArgs({
    required this.snapshot,
    required this.index,
  });

  final _i11.AsyncSnapshot<_i12.MealType> snapshot;

  final int index;

  @override
  String toString() {
    return 'MyRecipeDetailArgs{snapshot: $snapshot, index: $index}';
  }
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RecipeWidget]
class RecipeWidget extends _i10.PageRouteInfo<RecipeWidgetArgs> {
  RecipeWidget({
    required List<_i13.MealsDetail> recipes,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RecipeWidget.name,
          args: RecipeWidgetArgs(recipes: recipes),
          initialChildren: children,
        );

  static const String name = 'RecipeWidget';

  static const _i10.PageInfo<RecipeWidgetArgs> page =
      _i10.PageInfo<RecipeWidgetArgs>(name);
}

class RecipeWidgetArgs {
  const RecipeWidgetArgs({required this.recipes});

  final List<_i13.MealsDetail> recipes;

  @override
  String toString() {
    return 'RecipeWidgetArgs{recipes: $recipes}';
  }
}

/// generated route for
/// [_i8.SearchPage]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.IngredientsScreen]
class IngredientsRoute extends _i10.PageRouteInfo<void> {
  const IngredientsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          IngredientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'IngredientsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
