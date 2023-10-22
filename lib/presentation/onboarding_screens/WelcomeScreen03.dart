import 'package:flutter/material.dart';
import 'package:fud/presentation/home_screens/Home.dart';
import 'package:fud/presentation/onboarding_screens/WelcomeScreen02.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/images/cooking.png',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Share your recipes, collaborate with fellow foodies and enjoy!!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },



        child: Icon(Icons.arrow_circle_right_outlined),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
