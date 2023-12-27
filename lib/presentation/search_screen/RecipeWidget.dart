import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/models/meals/MealDetail.dart';
import 'package:fud/models/meals/MealsModel.dart';
import 'package:fud/presentation/routes/AppRouter.gr.dart';

import '../../models/eRecipe/Food.dart';
@RoutePage()
class RecipeWidget extends StatelessWidget{
  final List<MealsDetail> recipes;
   RecipeWidget(this.recipes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,//if not given it shows only one item in the list that is the first index
        itemBuilder:(context,index)
        {
          MealsDetail recipe=recipes[index];//index helps access the list elements
          return GestureDetector(
            onTap: (){
              // context.router.push(RecipeDetailRoute(recipe: recipe));
            },
            child: ListTile(title:Text(recipe.strMeal!),),

          );
        }
    );

  }
}


