import 'package:fud/feature/explore_recipes/domain/repository/recipe_repository.dart';
import 'package:get_it/get_it.dart';

import 'feature/explore_recipes/data/repository/recipe_repository_implementation.dart';

final sl = GetIt.instance;

/*Initialize your dependencies here and register them for entire app*/
Future<void> initializeDependencies() async {


  // Repositories below
  sl.registerSingleton<RecipeRepository>(
    RecipeRepositoryImplementation(sl()),
  );
}
