import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/models/mRecipe/mRecipe.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/meals/MealType.dart';
import 'package:fud/models/recipes/Recipe.dart';
import 'package:fud/data/remote/ApiService.dart';
import 'package:fud/presentation/routes/AppRouter.gr.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/eRecipe/ERecipe.dart';

class Home extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<Home> {
  @override
  void initState() {
    super.initState();
    // fetchrecipes();
    // userLogOut();
  }

  void fetchrecipes() async {
    MealType recipe = await ApiService().getrecipes();
    print('recipelengthhaiye${recipe.meals?.length}');
    // try {
    //   Recipe recipe = await ApiService().getrecipes();
    //   print('recipe$recipe');
    // }
    // catch (e) {
    //   print('error $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    int currrentindex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_outline_sharp)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_sharp)),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userLogOut();

              //Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: getrecipesUI(),
       // child: cuisineUI(),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 60,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: bottomNavbarColor,
          child: SizedBox(
            height: 60,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.router.push(SearchRoute());
                  },
                  icon: Icon(Icons.search_rounded),
                ),
                IconButton(
                  onPressed: () {
                    context.router.push(ProfileRoute());
                  },
                  icon: Icon(Icons.person_outline_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: fabButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    Widget buildbody() {}
  }

/*
In Flutter, the FutureBuilder widget is used to asynchronously
 build the UI based on the result of a Future.
  It's a convenient way to handle asynchronous operations
   and update your user interface when the data becomes available.
FutureBuilder is a widget that takes two key parameters:
future: This parameter expects a Future object.
 It represents the asynchronous operation whose result you want to use to build the UI.
  In your case, you are calling ApiService().getRecipes() to get a Future that will fetch recipe data.
builder: This parameter is a callback function that takes two arguments, context and snapshot.
 It is called when the Future completes, and its result is available.
 The purpose of this callback is to build the UI based on the state of the Future.
  It's where you define how your UI should look based on whether the Future is still loading,
   has completed successfully, or encountered an error.
*/
  Column getrecipesUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                log("${snapshot.data}");
                return RecipeWidget(snapshot); // working :)
                //   return RecipeWidget(recipe as AsyncSnapshot<MRecipe>); // Casting error
              }
            },
          ),
        ),
      ],
    );
  }

  Widget RecipeWidget(AsyncSnapshot<MealType> snapshot) {
    int _currentPage = 0;
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: greetWidget(),
              ),
              Container(
                height: 240,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return popularRecipes(snapshot, index);
                        },
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Indicator(
                          index: index,
                          currentIndex: _currentPage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              cuisineUI(),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(160), // Adjust the radius as needed
                            ),
                            child: Container(

                              width: 100, // Adjust the width as needed
                              height: 100, // Adjust the height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(160), // Same radius as the Card
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data!.meals?[index].strMealThumb ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              cuisineUI(),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(


                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(160), // Adjust the radius as needed
                            ),
                            child: Container(

                              width: 100, // Adjust the width as needed
                              height: 100, // Adjust the height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(160), // Same radius as the Card
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data!.meals?[index].strMealThumb ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}

void userLogOut() async {
  FirebaseAuth.instance.signOut();
}

Column greetWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20,left: 12),
            child: Text(
              "Hi,",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20,left: 12),
            child: Text(
              "${getUsername()}!" ?? "User!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),

          ),

        ],

      ),
      Padding(padding: EdgeInsets.only(top: 4,left: 12,bottom: 20),
        child: Text(
          "What's on the menu today?",
          style: TextStyle(
              fontSize: 14,

              color: greyText),
        ),

      ),

    ],
  );
}

String? getUsername() {
  var username = FirebaseAuth.instance.currentUser?.displayName;
  return username;
}

Container popularRecipes(AsyncSnapshot<MealType> snapshot, int index) {
  return Container(
    height: 240,
    padding: EdgeInsets.all(12),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      child: Card(
        elevation: 2, // You can adjust the elevation if desired
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: Image.network(
                snapshot.data!.meals?[index].strMealThumb ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Text('Food'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Column cuisineUI()
{
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 0),
          child:  Text('Cuisine',style: TextStyle(color: textOrange),),
          ),
          Padding(padding: EdgeInsets.only(top: 20,bottom: 20,left: 0,right: 20),
          child:Text('Explore More>>',style: TextStyle(color: greyText),),)
        ],
      )
    ],
  );

}

class Indicator extends StatelessWidget {
  final int index;
  final int currentIndex;

  const Indicator({Key? key, required this.index, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentIndex ? Colors.deepOrange : Colors.grey,
      ),
    );
  }
}

