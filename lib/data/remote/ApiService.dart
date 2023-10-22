import 'package:dio/dio.dart';
import 'package:fud/models/recipes/Recipe.dart';
class ApiService{
  static const String baseurl='https://api.spoonacular.com/';
  static const String endpoint='/recipes/random';
  static const String apiKey='5277f3683f584b5a91f6616c62daafe3';
  late final Dio dio;
  /*Future is a return type of type Recipe and getrecipes is the name of the function,
  async is used for synchronization, together this whole line defines a function
  async ensures not to return data until full processing of getting data completes
  */
  Future<Recipe> getrecipes() async{
    try
        {
         dio=Dio();

         final Response response=await dio.get('$baseurl$endpoint',queryParameters: {
           'apiKey':apiKey,
         });
         print("response$response");
         Recipe recipes=Recipe.fromJson(response.data);
         return recipes;
        }
     on DioException catch(e){
      print("error$e");
      rethrow;
     }

  }


}