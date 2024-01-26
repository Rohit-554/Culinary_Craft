import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
// @RoutePage()
// class SettingScreen extends StatefulWidget{
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

class SettingScreen extends StatelessWidget {
  final firebaseAuth=FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Dialog(

      child:
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: textOrange,width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 24,left: 24),
                  child:
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                        image: NetworkImage(firebaseAuth.currentUser?.photoURL ?? ""),
                        fit: BoxFit.cover, // Choose the BoxFit that suits your needs
                      ),
                    ),
                  ),
                ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Adjust the spacing between the image and buttons
            Column(
              children: [
                CustomFilledButton(text: "About", onPressed: () {},
                  icon: Icons.info_outline,
                ),
              ],
            ),
          ],
        ),
      )




    );
  }


}


class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color fillColor;
  final IconData? icon;

  const CustomFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fillColor = lightOrange,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child:
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor, // Set the fill color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
