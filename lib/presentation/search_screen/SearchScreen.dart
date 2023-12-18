import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/data/remote/ApiService.dart';

import '../../models/eRecipe/ERecipe.dart';
import '../../models/eRecipe/Food.dart';
import 'RecipeWidget.dart';
@RoutePage()
class SearchPage extends StatefulWidget {
  @override
  MySearchPage createState() => MySearchPage();
}

class MySearchPage extends State<SearchPage> {
  late Future<ERecipe> _recipeFuture;
  @override
  void initState() {

    super.initState();
    _recipeFuture=ApiService().getrecipes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        actions: 
        [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate(_recipeFuture));
          },
              icon: Icon(Icons.search_rounded),

          )
        ],

        ),
    );
  }
  }

  class CustomSearchDelegate extends SearchDelegate
  {
    final Future<ERecipe> recipefuture;
  CustomSearchDelegate( this.recipefuture);//constructor for initialization

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()=>query='', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<ERecipe>(
        future: recipefuture,

        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          else if(snapshot.hasError){
            return Center(child: Text('Error:${snapshot.error}'),);
          }
          else if(!snapshot.hasData)
            {
              return Center(child: Text('No recipe data available') ,);
            }
          else {
            ERecipe? recipe = snapshot.data;
            List<Food> filteredrecipe = _filteredRecipes(recipe!, query);


            return RecipeWidget(_filteredRecipes(recipe, query));
          }
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Suggestions'),
    );
  }

  }

  List<Food> _filteredRecipes(ERecipe recipe,String query)
  {
    return recipe.hints.where((hint) => hint.food.label.toLowerCase().contains(query.toLowerCase())).map((e) => e.food).toList();
  }

