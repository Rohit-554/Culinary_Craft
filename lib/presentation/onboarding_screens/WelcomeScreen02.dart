import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'WelcomeScreen03.dart';

class WelcomeScreen02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/images/healthy-food.png',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Savor wellness through nutritious cuisine",
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
            MaterialPageRoute(builder: (context) =>  WelcomeScreen03()),
          );
        },
        child: Icon(Icons.arrow_circle_right_outlined),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
