import 'package:fud/core/resources/data_state.dart';
import 'package:fud/models/meals/MealType.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/recipe_repository.dart';

class GetFilteredRecipeUseCase implements UseCase<DataState<MealType>,void> {
  final RecipeRepository _repository;

  GetFilteredRecipeUseCase(this._repository);

  @override
  Future<DataState<MealType>> call({void params}) {
      return _repository.getMealByCategory();
  }
}