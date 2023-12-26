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

      body: Padding(
        padding: const EdgeInsets.only(top: 48,left: 20,right: 20,bottom: 0),
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                trailing: <Widget>[
                  Tooltip(
                    message: 'Filter',
                    child: IconButton(

                      onPressed: () {

                      },
                      icon: const Icon(Icons.filter_list_sharp),

                    ),
                  )
                ],
              );
            }, suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        }),
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
    return recipe.hints.where(
            (hint) => hint.food.label.toLowerCase().contains(query.toLowerCase())).
    map((e) => e.food).toList();
  }

