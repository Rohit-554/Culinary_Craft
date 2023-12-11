import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fud/models/mRecipe/mRecipe.dart';
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
class ApiService{
  static const String baseurl='https://edamam-food-and-grocery-database.p.rapidapi.com';
  static const String endpoint='/api/food-database/v2/parser';
  static  String? xrapidapikey=dotenv.env['X-RapidAPI-Key'];
  static String? apikey=dotenv.env['apiKey'];
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
  Future<ERecipe> getrecipes() async{
    try
        {
          print("RapidKeyIs$xrapidapikey");
         dio=Dio(BaseOptions(
           headers: {
             'X-RapidAPI-Key':  xrapidapikey ,
             'X-RapidAPI-Host':'edamam-food-and-grocery-database.p.rapidapi.com'

           }
         ));//when we add headers we add in base options of Dio

         final Response response=await dio.get('$baseurl$endpoint',queryParameters: {
           'apiKey':apikey,
         });
         print("response${response.data}");
         ERecipe recipes=ERecipe.fromJson(response.data);
         return recipes;
        }
     on DioException catch(e){
      print("error$e");
      rethrow;
     }

  }


}