import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fud/core/resources/data_state.dart';
import 'package:fud/feature/explore_recipes/data/data_sources/remote/recipe_api_service.dart';
import 'package:fud/feature/explore_recipes/domain/repository/recipe_repository.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/meals/MealsModel.dart';

class RecipeRepositoryImplementation implements RecipeRepository{
  final RecipeApiService _recipeApiService;

  RecipeRepositoryImplementation(this._recipeApiService);

  @override
  Future<DataState<MealType>> getMealByCategory() async {
    try{
      final filteredRecipe = await _recipeApiService.getRecipeByFilter(category: 'seafood');
      if(filteredRecipe.response.statusCode == HttpStatus.ok){
        return DataSuccess(filteredRecipe.data);
      }else{
        return DataFailed(
          DioException(
            response: filteredRecipe.response,
            requestOptions: filteredRecipe.response.requestOptions,
            error: filteredRecipe.response.statusMessage,
            type: DioExceptionType.badResponse,
          )
        );
      }
    }on DioException catch(e){
      return DataFailed(e);
    }
  }
}