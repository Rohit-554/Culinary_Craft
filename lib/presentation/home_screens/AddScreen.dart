import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
@RoutePage()
class AddScreen extends StatefulWidget
{
  @override
  State<AddScreen> createState() => _AddState();
}

class _AddState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:

      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 2,
              child: Container(
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    
                    size: 100, // Adjust the size as needed
                    color: Colors.black, // Adjust the color as needed
                  ),
                ),
              ),
            ),
          ),
        ],
      )

    );
  }
}