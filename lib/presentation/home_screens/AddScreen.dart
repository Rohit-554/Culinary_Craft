import 'package:auto_route/annotations.dart';
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
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
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
                  ),
                  CustomFilledButton(
                    text: "Add Ingredients",
                    onPressed: () {},
                    icon: Icons.add_shopping_cart_outlined,
                  ),
                  const SizedBox(height: 16),
                  CustomFilledButton(
                    text: "Add Instructions",
                    onPressed: () {},
                    icon: Icons.emoji_food_beverage,
                  ),
                  const SizedBox(height: 16),
                  CustomFilledButton(
                    text: "Add Links",
                    onPressed: () {},
                    icon: Icons.add_link,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            CustomFilledButton(
              text: "Submit",
              onPressed: () {},
              icon: Icons.check_circle,
              fillColor: Colors.greenAccent,
              textAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 16),
          ],
        )


    );
  }
}
