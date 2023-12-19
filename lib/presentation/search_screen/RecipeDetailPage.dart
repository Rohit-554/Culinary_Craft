import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/eRecipe/Food.dart';
@RoutePage()
class RecipeDetailPage extends StatelessWidget
{
  final  Food recipe;
  RecipeDetailPage(this.recipe);
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(recipe.image!),
            )
          ],
      ),
      );
  }

}