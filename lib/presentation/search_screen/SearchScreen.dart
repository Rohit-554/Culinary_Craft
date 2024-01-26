import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/data/remote/ApiService.dart';
import 'package:fud/models/meals/MealDetail.dart';
import 'package:fud/models/meals/MealItem.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/meals/MealsModel.dart';

import '../../models/eRecipe/ERecipe.dart';
import '../../models/eRecipe/Food.dart';
import 'RecipeWidget.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  @override
  MySearchPage createState() => MySearchPage();
}

class MySearchPage extends State<SearchPage> {
  late Future<MealType> _recipeFuture;
  late Future<MealsModel> _recipeFuture1;

  @override
  void initState() {
    super.initState(); 
    _recipeFuture1 = ApiService().getRecipeBySearch('a');
    // _recipeFuture = ApiService().getRecipeBySearch(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    String query = '';
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              backgroundColor: MaterialStateProperty.all(bottomNavbarColor),
              elevation: MaterialStateProperty.all(0.0),
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                controller.closeView(query);
                print("query $value");
              },
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              trailing: <Widget>[
                Tooltip(
                  message: 'Filter',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            );
          }, suggestionsBuilder: (BuildContext context, SearchController controller) {
            return buildRecipeFutureWidget(query);
          },
            viewBackgroundColor: Colors.white,
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 24, left: 32, right: 20, bottom: 0),
            child: Text(
              'POPULAR SEARCHES',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<MealType>(
            future: ApiService().getrecipes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while fetching data
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Handle error state
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                // Handle the case when no data is available
                return const Center(
                  child: Text('No recipe data available.'),
                );
              } else {
                // Data is available, display the recipe content
                MealType? recipe = snapshot.data;

                return PopularRecipeWidget(snapshot); // working :)
                //   return RecipeWidget(recipe as AsyncSnapshot<MRecipe>); // Casting error
              }
            },
          ),
        ),
      ],
    ));
  }
}


List<MealsDetail> _filteredRecipes(MealsModel recipe, String query) {
  return recipe.meals!
      .where((element) =>
          element.strMeal!.toLowerCase().contains(query.toLowerCase()))
      .toList();
}


Future<Iterable<Widget>> buildRecipeFutureWidget(String query) async {
  try {
    MealsModel recipe = await ApiService().getRecipeBySearch(query);
    if (recipe.meals == null) {
      return <Widget>[];
    } else {
      return recipe.meals!.map((meal) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: Container(
                width: 50, // Adjust the width as needed
                height: 50, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(meal.strMealThumb!),
                  ),
                ),
              ),
              title: Text(meal.strMeal!),
              // Add other details as needed
              onTap: () {
                // Handle tap on the search result item
              },
            ),
          ),
        ) ;


      });
    }
  } catch (e) {
    print("error $e");
    return <Widget>[]; // Return an empty list in case of an error
  }
}

Widget PopularRecipeWidget(AsyncSnapshot<MealType> snapshot) {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      MealItem? recipe = snapshot.data!.meals![index];
      return
        Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 8),
        child: ListTile(
          title: Text(recipe.strMeal!),
          onTap: () {},
          leading: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(recipe.strMealThumb!)),
            ),
          ),
        ),
      );
    },
  );
}
