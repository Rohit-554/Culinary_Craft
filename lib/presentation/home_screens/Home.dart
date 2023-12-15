import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/models/mRecipe/mRecipe.dart';
import 'package:fud/models/recipes/Recipe.dart';
import 'package:fud/data/remote/ApiService.dart';
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
    ERecipe recipe = await ApiService().getrecipes();
    print('recipelengthhaiye${recipe.hints.length}');
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
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 60,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: bottomNavbarColor,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    print("home");
                  },
                  icon: Icon(Icons.search_rounded),
                ),
                IconButton(
                  onPressed: () {
                    print("home");
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
          child: FutureBuilder<ERecipe>(
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
                ERecipe? recipe = snapshot.data;
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

  SingleChildScrollView RecipeWidget(AsyncSnapshot<ERecipe> snapshot) {
    // print('recipelengthhaiye${snapshot.data?.hints.length}');
    //log("total elements"+snapshot.data!.recipes.length.toString());
    return SingleChildScrollView(
      child: Column (
        children: [
          Container(
            color: Colors.white,
            child: greetWidget(),
          ),
          Container(
            height: 200,
            child: PageView.builder(
                itemCount: 5,
                itemBuilder:(context,index){
                  return Padding(padding: EdgeInsets.only(top:20 ),
                  child: Image.network(snapshot.data!.hints[index].food.image!),
                  );
                },
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.hints.length,
              itemBuilder: (context, index) {
                return Expanded(child:
                  SizedBox(
                  height: 600,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // Vertically center the icon and text
                          children: [
                            const Icon(
                              Icons.account_circle,
                              // Replace this with the icon you want to use for the profile
                              size: 24,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 8),
                            // Add some spacing between the icon and the text
                            Text(
                              "hello",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: snapshot.data != null &&
                                  snapshot.data!.hints != null &&
                                  index < snapshot.data!.hints.length
                                  ? Image.network(
                                snapshot.data!.hints[index].food.image ?? '',
                                // Provide a default value or handle null appropriately
                                height: 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                                  : Container(), // You can provide a placeholder or an empty container when data is null
                            ),

                            Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // Toggle the 'liked' state of the photo
                                        // snapshot.data!.photos[index].liked =
                                        //!snapshot.data!.photos[index].liked;
                                      });
                                    },
                                  ),
                                )),

                            //download section
                            // Positioned(
                            //     bottom: 8,
                            //     right: 8,
                            //     child: Container(
                            //       decoration: BoxDecoration(
                            //         color: Colors.black.withOpacity(0.5),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       child: IconButton(
                            //         icon: isDownloading
                            //             ? const Icon(
                            //           Icons.download,
                            //           color: Colors.white,
                            //           size: 24,
                            //         )
                            //             : const Icon(
                            //           Icons.downloading,
                            //           color: Colors.white,
                            //           size: 24,
                            //         ),
                            //         onPressed: () {
                            //           isDownloading = true;
                            //           Icons.downloading;
                            //           String url =
                            //               snapshot.data!.photos[index].src.original;
                            //           String fileName =
                            //           snapshot.data!.photos[index].id.toString();
                            //           showDialog(
                            //               context: context,
                            //               builder: (context) =>
                            //                   DownloadingDialog(url, fileName));
                            //         },
                            //       ),
                            //     ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                );
              }),
        ],
      )
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
