import 'package:auto_route/annotations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors/Colors.dart';
import 'SettingScreen.dart';

@RoutePage()
class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddState();
}

class _AddState extends State<AddScreen> {
  final _databaseRef = FirebaseDatabase.instance.ref('UserRecipes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        Card(
                          elevation: 2,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black54,
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 100, // Adjust the size as needed
                                color: Colors.black, // Adjust the color as needed
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.32,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey, // Adjust the color as needed
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      size: 100, // Adjust the size as needed
                                      color: Colors.white, // Adjust the color as needed
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Click Here!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 24,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(
                              //   Icons.add_photo_alternate_outlined,
                              //   size: 30, // Adjust the size as needed
                              //   color: Colors.black, // Adjust the color as needed
                              // ),
                              // SizedBox(width: 8),
                              Text(
                                "Add Photo",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomFilledButton(
                    text: "Add Ingredients",
                    onPressed: () {},
                    icon: Icons.add_shopping_cart_outlined,
                    isBorderEnabled: true,
                    fillColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  CustomFilledButton(
                    text: "Add Instructions",
                    onPressed: () {},
                    icon: Icons.emoji_food_beverage,
                    isBorderEnabled: true,
                    fillColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  CustomFilledButton(
                    text: "Add Links",
                    onPressed: () {},
                    icon: Icons.add_link,
                    fillColor: Colors.white,
                    isBorderEnabled: true,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            CustomFilledButton(
              text: "Submit",
              onPressed: () {},
              icon: Icons.check_circle,
              fillColor: lightOrange,
              isBorderEnabled: false,
              textAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 16),
          ],
        )
    );
  }
}
