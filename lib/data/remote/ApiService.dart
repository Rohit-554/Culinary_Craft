import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fud/models/mRecipe/mRecipe.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/meals/MealsModel.dart';
import 'package:fud/models/recipes/Recipe.dart';

import '../../models/eRecipe/ERecipe.dart';
//ApiService defines the end points of the api
/*An API typically consists of multiple endpoints,
 each of which serves a specific purpose or provides access to a specific set of data or functionality.
 These endpoints are used to send requests and receive responses from the API.
 The endpoint's URL, along with the HTTP method (such as GET, POST, PUT, DELETE, etc.),
  defines the operation you want to perform on the API.
  example:nitdgp.org/departments/cse/sectionX/Saumya
  HTTP,Dio search
  */
class ApiService {
  // static const String baseurl='MealsDetail';
  // static const String endpoint='/api/food-database/v2/parser';
  static const String baseurl = 'https://www.themealdb.com';
  static const String endpoint = '/api/json/v1/1/filter.php';
  static const String endpoint1 = '/api/json/v1/1/search.php';
  static const String endpointbyid='api/json/v1/1/lookup.php';
  static String? xrapidapikey = dotenv.env['X-RapidAPI-Key'];
  static String? apikey = dotenv.env['apiKey'];
  late final Dio dio;

  /*Future is a return type of type Recipe and getrecipes is the name of the function,
  async is used for synchronization, together this whole line defines a function
  async ensures not to return data until full processing of getting data completes,
  By marking the function as async and using await,
  you ensure that your code remains responsive and doesn't block while waiting
  for the asynchronous operation to complete. The function returns a Future<Recipe>,
  indicating that it will eventually provide a Recipe object
  when the asynchronous operation finishes.
  */
  // Future<ERecipe> getrecipes() async{
  //   try
  //       {
  //         print("RapidKeyIs$xrapidapikey");
  //        dio=Dio(BaseOptions(
  //          headers: {
  //            'X-RapidAPI-Key':  xrapidapikey ,
  //            'X-RapidAPI-Host':'edamam-food-and-grocery-database.p.rapidapi.com'
  //
  //          }
  //        ));//when we add headers we add in base options of Dio
  //
  //        final Response response=await dio.get('$baseurl$endpoint',queryParameters: {
  //          'apiKey':apikey,
  //        });
  //        print("response${response.data}");
  //        ERecipe recipes=ERecipe.fromJson(response.data);
  //        return recipes;
  //       }
  //    on DioException catch(e){
  //     print("error$e");
  //     rethrow;
  //    }
  //
  // }

/*  // for meals according to the first letter
  */ /*Future<MealsModel> getrecipes() async {
    try {
      dio = Dio();

      final Response response = await dio.get('$baseurl$endpoint', queryParameters: {
        'f': 'a', // Add any other parameters as needed
      });

      print("response${response.data}");
      MealsModel recipes = MealsModel.fromJson(response.data);
      return recipes;
    } on DioException catch (e) {
      print("error$e");
      rethrow;
    }
  }*/

  Future<MealsModel> getRecipeBySearch(String searchTerm) async {
    try {
      dio = Dio();

      final Response response = await dio.get(
          '$baseurl$endpoint1', queryParameters: {
        's': searchTerm, // Use 's' parameter for search term
      });
      print("responsesearch ${response.data}");
      MealsModel recipes = MealsModel.fromJson(response.data);
      return recipes;
    } on DioException catch (e) {
      print("error $e");
      rethrow;
    }
  }

  // for meals according to the category like seafood, chicken etc
  Future<MealType> getrecipes() async {
    try {
      dio = Dio();
      final Response response = await dio.get(
          '$baseurl$endpoint', queryParameters: {
        'c': 'seafood', // Add any other parameters as needed
      });
      print("response${response.data}");
      MealType recipes = MealType.fromJson(response.data);
      return recipes;
    } on DioException catch (e) {
      print("error$e");
      rethrow;
    }
  }

  Future<MealsModel> getrecipebyid(String id) async {
    try {
      dio = Dio();
      final Response response = await dio.get(
          '$baseurl$endpointbyid', queryParameters: {
        'i': id, // Add any other parameters as needed
      });
      print("response${response.data}");
      MealsModel recipes = MealsModel.fromJson(response.data);
      return recipes;
    } on DioException catch (e) {
      print("error$e");
      rethrow;
    }
  }
}