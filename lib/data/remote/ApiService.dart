import 'package:dio/dio.dart';
import 'package:fud/models/recipes/Recipe.dart';
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
  static const String baseurl='https://api.spoonacular.com/';
  static const String endpoint='/recipes/random';
  static const String apiKey='5277f3683f584b5a91f6616c62daafe3';
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