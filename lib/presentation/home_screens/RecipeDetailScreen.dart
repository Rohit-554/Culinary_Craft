import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../models/meals/MealType.dart';
@RoutePage()
class MyRecipeDetail extends StatefulWidget {
  final AsyncSnapshot<MealType> snapshot;
  final int index;

  MyRecipeDetail({required this.snapshot, required this.index});

  @override
  _MyRecipeDetailState createState() => _MyRecipeDetailState();
}

class _MyRecipeDetailState extends State<MyRecipeDetail> {  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
