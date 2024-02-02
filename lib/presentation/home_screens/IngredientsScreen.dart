import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
@RoutePage()
class IngredientsScreen extends StatefulWidget{
  @override
  State<IngredientsScreen> createState() => _IngredientsState();
}

class _IngredientsState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [


                 Padding(
                   padding: const EdgeInsets.only(left: 4,bottom: 8),
                   child: Container(
                     alignment: Alignment.topLeft,
                     child: Text('Tags',

                        style: TextStyle(fontWeight: FontWeight.bold)
                                     ),
                   ),
                 ),

              Row(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.04,
                    decoration :BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupertinoColors.systemGrey5
                    ),
                    child: TextField(),

                  ),
                ],
              )
            ],
          ),
        ) ,

      ),
    );
  }
}