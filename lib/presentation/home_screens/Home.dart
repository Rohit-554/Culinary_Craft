import 'package:flutter/material.dart';
import 'package:fud/models/recipes/Recipe.dart';
import 'package:fud/data/remote/ApiService.dart';

class Home extends StatefulWidget {


  @override
  MyHomePage createState() => MyHomePage();


}

class MyHomePage extends State<Home> {


  @override
  void initState() {
    super.initState();
    fetchrecipes();
  }

  void fetchrecipes() async
  {
    try {
      Recipe recipe = await ApiService().getrecipes();
      print('recipe$recipe');
    }
    catch (e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Test'),
      ),
      body: Center(

        ),

    );
  }

}