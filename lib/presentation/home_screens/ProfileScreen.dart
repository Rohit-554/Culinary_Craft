import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
@RoutePage()
class ProfilePage extends StatefulWidget {
  @override
  MyProfilePage createState() => MyProfilePage();
}

class MyProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 2,
        child:   Scaffold(
          appBar: AppBar(
            title: const Text(''),
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.settings_outlined)),
            ],
          ),
          body:
              Column(
                children:[
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          TabBarView(
            children: [
              // Content for the 'Favourites' tab
              // FavouritesTabContent(),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              // Content for the 'My Recipe' tab
              //MyRecipeTabContent(),
            ],
          ),
    ],
              )
          // Column(
          //   children: [
          //     profileStats(),
          //     Column(
          //         children: [
          //
          //           // Provide content for each tab in TabBarView
          //
          //         ],
          //       ),
          //
          //   ],
          // ),

        )
    );

  }


  }

Container profileStats()
{
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        Padding(padding: EdgeInsets.only(top: 16,left: 40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
              getImage() ?? '',
              width: 60, // Adjust width as needed
              height: 60, // Adjust height as needed
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // If there's an error loading the network image, display the asset image
                return Image.asset(
                  'assets/user.png', // Replace with your asset path
                  width: 60, // Adjust width as needed
                  height: 60, // Adjust height as needed
                  fit: BoxFit.cover,
                );
              }
          ),
        ),
        ),

        Padding(padding: EdgeInsets.only(top: 16,left: 28),
        child:  Text('${getName()}',style: TextStyle(fontSize: 16),),
        )



      ],
    ),
  );

}

String? getImage()
{
  var userImage=FirebaseAuth.instance.currentUser?.photoURL;
  return userImage;
}
String? getName()
{
  var userName=FirebaseAuth.instance.currentUser?.displayName;
  return userName;
}