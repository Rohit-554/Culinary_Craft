import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/data/remote/ApiService.dart';
import 'package:fud/models/meals/MealsModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/meals/MealType.dart';

@RoutePage()
class MyRecipeDetail extends StatefulWidget {
  final AsyncSnapshot<MealType> snapshot;
  final int index;

  MyRecipeDetail({required this.snapshot, required this.index});

  @override
  _MyRecipeDetailState createState() => _MyRecipeDetailState();
}

class _MyRecipeDetailState extends State<MyRecipeDetail>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    bool isExpanded = _scrollController.hasClients &&
        _scrollController.offset > (400 - kToolbarHeight);
    setState(() {
      this.isExpanded = isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 32,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline_sharp,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            stretch: true,
            backgroundColor: bottomNavbarColor,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              expandedTitleScale: 1,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.snapshot.data!.meals![widget.index].strMealThumb!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100, // Adjust the height as needed
                      decoration: const BoxDecoration(
                        color: Colors.white, // Adjust the card background color
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          widget.snapshot.data!.meals![widget.index].strMeal!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [

                      Container(
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: fabButton,
                          tabs: [
                            Tab(text: 'Ingredients'),
                            Tab(text: 'Instructions'),
                          ],
                          labelColor: fabButton,
                          // Change the color for selected tab
                          unselectedLabelColor: Colors
                              .grey, // Change the color for unselected tabs
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(
                          controller: _tabController,
                          children:  [
                            Center(
                              child: getrecipedetails(widget.snapshot.data!.meals![widget.index].idMeal!),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start, // Align the column content to the start (left in this case)
                                crossAxisAlignment: CrossAxisAlignment.start, // Align the children within the column to the start
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 28,top: 16,right: 0,bottom: 4),
                                    child:  Text(
                                      "Saumya",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),)

                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

MealsModel? extractDataFromSnapshot(AsyncSnapshot<MealsModel> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    // Data is still loading
    return null;
  } else if (snapshot.hasError) {
    // Error occurred
    print('${snapshot.hasError}');
    return null;
  } else if (snapshot.hasData == false) {
    // No data available
    return null;
  } else {
    print("snapshotdata${snapshot.data}");
    // Data is available
    return snapshot.data;
  }
}


Widget getrecipedetails(String id) {
  return FutureBuilder<MealsModel>(
    future: ApiService().getrecipebyid(id),
    builder: (context, snapshot) {
      MealsModel? recipedetails = extractDataFromSnapshot(snapshot);
      if (recipedetails != null) {
        print('recipe details $recipedetails');
      }
      
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(child: Text('Error in fetching data'));
      } else if (snapshot.hasData == false) {
        return Center(child: Text('No data'));
      } else {
        return Ingredients(recipedetails!);
      }
    },
  );
}

// Widget getrecipedetails(String id) {
//   return FutureBuilder<MealsModel>(
//     future: ApiService().getrecipebyid(id),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       } else if (snapshot.hasError) {
//         print('${snapshot.hasError}');
//         return Center(child: Text('Error in fetching data'));
//       } else if (snapshot.hasData == false) {
//         return Center(child: Text('No data'));
//       } else {
//         MealsModel? recipedetails = snapshot.data;
//         print('recipe details$recipedetails');
//         return recipedetails != null ? Ingredients(recipedetails) : Container();
//       }
//     },
//   );
// }


Widget Ingredients(MealsModel recipedetails) {
  Map<String, String> IngredientMeasures = {
    recipedetails.meals![0].strIngredient1!:
        recipedetails.meals![0].strMeasure1!,
    recipedetails.meals![0].strIngredient2!:
        recipedetails.meals![0].strMeasure2!,
    recipedetails.meals![0].strIngredient3!:
        recipedetails.meals![0].strMeasure3!,
    recipedetails.meals![0].strIngredient4!:
        recipedetails.meals![0].strMeasure4!,
    recipedetails.meals![0].strIngredient5!:
        recipedetails.meals![0].strMeasure5!,
    recipedetails.meals![0].strIngredient6!:
        recipedetails.meals![0].strMeasure6!,
    recipedetails.meals![0].strIngredient7!:
        recipedetails.meals![0].strMeasure7!,
    recipedetails.meals![0].strIngredient8!:
        recipedetails.meals![0].strMeasure8!,
    recipedetails.meals![0].strIngredient9!:
        recipedetails.meals![0].strMeasure9!,
    recipedetails.meals![0].strIngredient10!:
        recipedetails.meals![0].strMeasure10!,
    recipedetails.meals![0].strIngredient11!:
        recipedetails.meals![0].strMeasure11!,
    recipedetails.meals![0].strIngredient12!:
        recipedetails.meals![0].strMeasure12!,
    recipedetails.meals![0].strIngredient13!:
        recipedetails.meals![0].strMeasure13!,
    recipedetails.meals![0].strIngredient14!:
        recipedetails.meals![0].strMeasure14!,
    recipedetails.meals![0].strIngredient15!:
        recipedetails.meals![0].strMeasure15!,
    recipedetails.meals![0].strIngredient16!:
        recipedetails.meals![0].strMeasure16!,
    recipedetails.meals![0].strIngredient17!:
        recipedetails.meals![0].strMeasure17!,
    recipedetails.meals![0].strIngredient18!:
        recipedetails.meals![0].strMeasure18!,
    recipedetails.meals![0].strIngredient19!:
        recipedetails.meals![0].strMeasure19!,
    recipedetails.meals![0].strIngredient20!:
        recipedetails.meals![0].strMeasure20!,
  };

  final youtubeController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(recipedetails.meals![0].strYoutube!) ?? '',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display Meal ID in the top left
        Text(
          'Meal ID: ${recipedetails.meals![0].idMeal}',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),

        ),
        SizedBox(height: 8.0),

        // Display strDrinkAlternate
        Text(
          'Alternate Drink: ${recipedetails.meals![0].strDrinkAlternate}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0), // Add some space between details

        // Display strCategory
        Text(
          'Category: ${recipedetails.meals![0].strCategory}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),

        // Display strArea
        Text(
          'Area: ${recipedetails.meals![0].strArea}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),

        // Display strTags in a rectangular box
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            'Tags: ${recipedetails.meals![0].strTags}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(height: 16.0),

        // Ingredients and Measures
        Column(
          children: IngredientMeasures.entries
              .where((element) =>
          element.key.isNotEmpty && element.value.isNotEmpty)
              .map((e) => Column(
            children: [
              ListTile(
                title: Text(
                  '${e.key}: ${e.value}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[300],
                height: 1.0,
              ),
            ],
          ))
              .toList(),
        ),
      ],
    ),
  );




}
