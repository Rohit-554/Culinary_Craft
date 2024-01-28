import 'package:dio/dio.dart';
import 'package:fud/core/constants/constants.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:retrofit/retrofit.dart';

part 'recipe_api_service.g.dart';

@RestApi(baseUrl: BASEURL)
abstract class RecipeApiService {
  factory RecipeApiService(Dio dio) = _RecipeApiService;

  @GET("/api/json/v1/1/filter.php")
  Future<HttpResponse<MealType>> getRecipeByFilter({
    @Query("c") String? category,
  });
}
