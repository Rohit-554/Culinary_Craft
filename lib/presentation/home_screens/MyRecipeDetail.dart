import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  return Scaffold(
  appBar: AppBar(
    title: const Text(''),
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0.0,
    automaticallyImplyLeading: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.favorite_outline_sharp),
      ),
    ],


    ),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child:
                  Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          widget.snapshot.data!.meals![widget.index].strMealThumb!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20),
                        ),
                        color: Colors.black,

                        child: Expanded(
                          child:  Container(


                          ),
                        ),

                      ),

                      Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.black,
                            child: Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [

                                ],
                              ),
                            ),
                          )
                      ),


                    ],
                  ),
          ),
        ],
      ),
    ),




  );
  }
}
