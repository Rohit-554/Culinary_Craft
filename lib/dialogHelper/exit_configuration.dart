import 'package:flutter/material.dart';
import 'package:fud/presentation/home_screens/SettingScreen.dart';

class DialogHelper{


  static exit(context) => showDialog(context: context, builder: (context) => SettingScreen());
}