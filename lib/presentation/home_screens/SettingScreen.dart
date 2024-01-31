import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/presentation/routes/AppRouter.gr.dart';

// @RoutePage()
// class SettingScreen extends StatefulWidget{
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

class SettingScreen extends StatelessWidget {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textOrange, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 24, left: 24),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                    image:
                        NetworkImage(firebaseAuth.currentUser?.photoURL ?? ""),
                    fit:
                        BoxFit.cover, // Choose the BoxFit that suits your needs
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // Adjust the spacing between the image and buttons
          Column(
            children: [
              CustomFilledButton(
                text: "About",
                onPressed: () {
                  context.router.push(AboutRoute());
                },
                icon: Icons.info_outline,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              CustomFilledButton(
                text: "Log Out",
                onPressed: () {
                  firebaseAuth.signOut();
                  context.router.popUntil(
                      (route) => route.settings.name == LoginRoute.name);
                },
                icon: Icons.logout,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color fillColor;
  final IconData? icon;
  final textcolor;
  final textAlignment;
  final isBorderEnabled;

  const CustomFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fillColor = lightOrange,
    this.icon,
    this.textcolor = Colors.black,
    this.textAlignment = MainAxisAlignment.start,
    this.isBorderEnabled = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: fillColor,
            // Set the fill color of the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: isBorderEnabled
                ? BorderSide(
                    width: 0.5,
                    color: Colors.black54,
                  )
                : BorderSide.none,

            surfaceTintColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: textAlignment,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: textcolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
