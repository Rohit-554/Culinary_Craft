import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fud/presentation/routes/AppRouter.gr.dart';

import '../../models/meals/MealType.dart';

class MyRecipeCard extends StatefulWidget {
  final AsyncSnapshot<MealType> snapshot;
  final int index;

  MyRecipeCard({required this.snapshot, required this.index});

  @override
  _MyRecipeCardState createState() => _MyRecipeCardState();
}

class _MyRecipeCardState extends State<MyRecipeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),

      child:
      GestureDetector(
        onTap: (){
           context.pushRoute(MyRecipeDetail(snapshot: widget.snapshot,index: widget.index,));
        },
        child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,

        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 6,
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      widget.snapshot.data!.meals?[widget.index].strMealThumb ??
                          '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline_sharp,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                        );
                      },
                    ),
                    iconSize: 32,
                    onPressed: _toggleFavorite,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.snapshot.data!.meals?[widget.index].strMeal ??
                          'Food',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(

                    width: 100,
                    height: 50,
                    child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.black,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),

    );
  }
}
