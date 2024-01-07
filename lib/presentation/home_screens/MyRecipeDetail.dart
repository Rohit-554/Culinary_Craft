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

class _MyRecipeDetailState extends State<MyRecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                widget.snapshot.data!.meals![widget.index].strMealThumb!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Your Card Content Here',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: List.generate(50, (index) => ListTile(title: Text('Item $index'))),
        ), // Replace with your actual body content
      ),
    );
  }
}
