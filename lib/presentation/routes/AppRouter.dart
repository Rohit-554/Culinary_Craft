
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fud/presentation/home_screens/Home.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page,initial: true),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: MyRecipeDetail.page),
    AutoRoute(page: AboutRoute.page),
    AutoRoute(page: AddRoute.page),
    AutoRoute(page: IngredientsRoute.page),
  ];
}
