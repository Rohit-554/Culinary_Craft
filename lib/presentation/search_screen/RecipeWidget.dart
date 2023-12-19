import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/presentation/routes/AppRouter.gr.dart';

import '../../models/eRecipe/Food.dpart';
@RoutePage()
class RecipeWidget extends StatelessWidget{
  final List<Food> recipes;
   RecipeWidget(this.recipes);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
        itemBuilder:(context,index)
        {
          Food recipe=recipes[index];
          return GestureDetector(
            onTap: (){
              context.router.push(RecipeDetailRoute(recipe: recipe));
            },
            child: ListTile(title:Text(recipe.label),),

          );
        }
    );

  }
}


