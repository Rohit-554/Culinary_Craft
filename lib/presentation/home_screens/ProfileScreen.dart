import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  @override
  MyProfilePage createState() => MyProfilePage();
}

class MyProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Adjust the length based on the number of tabs

      child:
      Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings_outlined),
            ),
          ],
          bottom: TabBar(
           indicatorColor: fabButton,
            tabs: [
              Tab(text: 'Favourites'),
              Tab(text: 'My Recipe'),

            ],
            labelColor: fabButton, // Change the color for selected tab
            unselectedLabelColor: Colors.grey, // Change the color for unselected tabs
          ),
        ),
        body: TabBarView(
          children: [
          favourite(),
            myRecipe(),

          ],
        ),
      ),
    );
  }
}

Container profileStats() {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16, left: 40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(getImage() ?? '',
                width: 60, // Adjust width as needed
                height: 60, // Adjust height as needed
                fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              // If there's an error loading the network image, display the asset image
              return Image.asset(
                'assets/user.png', // Replace with your asset path
                width: 60, // Adjust width as needed
                height: 60, // Adjust height as needed
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 28),
          child: Text(
            '${getName()}',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    ),
  );
}

String? getImage() {
  var userImage = FirebaseAuth.instance.currentUser?.photoURL;
  return userImage;
}

String? getName() {
  var userName = FirebaseAuth.instance.currentUser?.displayName;
  return userName;
}

Center favourite(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(top: 0),child:  Image.asset(
          'assets/images/hourglass.png',
          width: 100,
          height: 100,
        ),),
  Padding(padding: EdgeInsets.only(top: 20),child:
        Text('No Favourites yet',style: TextStyle(color: CupertinoColors.systemGrey,fontWeight:FontWeight.bold),),),
      ],
    ),
  );
}


Center myRecipe(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(top: 0),child:  Image.asset(
          'assets/images/hourglass.png',
          width: 100,
          height: 100,
        ),),
        Padding(padding: EdgeInsets.only(top: 20),child:
        Text('No Recipes yet',style: TextStyle(color: CupertinoColors.systemGrey,fontWeight:FontWeight.bold),),),
      ],
    ),
  );
}