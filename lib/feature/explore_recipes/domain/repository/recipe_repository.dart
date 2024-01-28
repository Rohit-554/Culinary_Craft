import 'package:fud/core/resources/data_state.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/meals/MealsModel.dart';

/* Define your methods for interacting with the data layer */
abstract class RecipeRepository {
  Future<DataState<MealType>> getMealByCategory();
}