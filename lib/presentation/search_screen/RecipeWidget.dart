import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/eRecipe/Food.dart';

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

            },
            child: ListTile(title:Text(recipe.label),),

          );
        }
    );

  }
}


