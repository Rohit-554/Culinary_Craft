import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/presentation/uicomponents/ButtonComponent.dart';
import 'package:fud/presentation/uicomponents/UiComponents.dart';

class SignupScreen extends StatefulWidget {
  @override
  MySignupScreen createState() => MySignupScreen();
}

class MySignupScreen extends State<SignupScreen> {
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SignupScreenUI(),
          heightFactor: 1.6,
        ));
  }
}

SingleChildScrollView SignupScreenUI() {
  TextEditingController _textController = TextEditingController();
  TextEditingController _textController1 = TextEditingController();
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
                'assets/images/signuppage.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(padding:
        const EdgeInsets.only(top: 28,left: 20,right: 20,bottom: 20),
            child: RoundedEditText( hint: 'Email Address',controller: _textController,)
        ),

        Padding(padding:
        const EdgeInsets.only(top: 4,left: 20,right: 20,bottom: 0),
            child: RoundedEditText( hint: 'Password',controller: _textController1,)
        ),

        Padding(padding: const EdgeInsets.only(top: 48,left: 20,right: 20,bottom: 0),
          child:
          RoundedButton(text: 'Sign Up', onPressed: ()async {


           await signupWithEmailAndPassword(_textController.text, _textController1.text);

          },),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "or",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: CupertinoColors.systemGrey),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Image.asset('assets/images/google.png', width: 20.0),
              style: ElevatedButton.styleFrom(
              primary: googleButton,
                onPrimary: googleButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),  // Adjust the radius as needed
                ),
              ),
              onPressed: () {},
              label:
              const Padding(padding: EdgeInsets.only(top: 12,bottom: 12),
              child: Text(
                " Sign Up with Google",
                style: TextStyle(color: Colors.blueAccent),
              ),)

            ),
          ),
        )





      ],

    ),
  );


}
Future<void> signupWithEmailAndPassword(String email,String password)async
{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print('user registered successfully');
  }catch(e){
    print('error in registering user$e');
  }
}