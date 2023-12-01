import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/presentation/uicomponents/ButtonComponent.dart';
import 'package:fud/presentation/uicomponents/UiComponents.dart';

class LoginScreen extends StatefulWidget {
  @override
  MyLoginScreen createState() => MyLoginScreen();
}

class MyLoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoginScreenUI(),
    ));
  }
}

SingleChildScrollView LoginScreenUI() {

  return SingleChildScrollView(
padding: EdgeInsets.only(top: 0),
    child:  Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Image.asset(
                'assets/images/loginpage.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(padding:
        EdgeInsets.only(top: 28,left: 20,right: 20,bottom: 20),
            child: RoundedEditText( hint: 'Email Address')
        ),

        Padding(padding:
        EdgeInsets.only(top: 4,left: 20,right: 20,bottom: 0),
            child: RoundedEditText( hint: 'Password')
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8,right: 20,bottom: 8),
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: CupertinoColors.systemGrey),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 0),
        child:
            RoundedButton(text: 'Login', onPressed: () {  },),
        )

      ],

    ),
  );


}
