import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
@RoutePage()
class SettingScreen extends StatefulWidget{
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final firebaseAuth=FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Dialog(

      child:
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: textOrange),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: NetworkImage(firebaseAuth.currentUser?.photoURL ?? ""),
                      fit: BoxFit.cover, // Choose the BoxFit that suits your needs
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),

              ],
            ),
          ),


    );
  }
}