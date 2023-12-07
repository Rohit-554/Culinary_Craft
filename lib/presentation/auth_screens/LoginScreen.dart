import 'package:firebase_auth/firebase_auth.dart';
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
          heightFactor: 1.6,
    ));
  }
}

SingleChildScrollView LoginScreenUI() {
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
                'assets/images/loginpage.png',
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
                "Login",
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8,right: 20,bottom: 8),
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 48,left: 20,right: 20,bottom: 0),
        child:
            RoundedButton(text: 'Login', onPressed: ()async {
              print("value of email address ${_textController.text}");
              print("value of password ${_textController1.text}");
              await loginWithEmailAndPassword(_textController.text, _textController1.text);
            },),
        ),
       const Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: EdgeInsets.only(top: 16),
             child:  Text(
               "New User? ",
               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: CupertinoColors.systemGrey),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 16),
             child:  Text(
               "Sign Up",
               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blueAccent),
             ),
           ),
         ],

       )
      ],

    ),
  );
}

Future<void> loginWithEmailAndPassword(String email, String password) async {
  try {
    // Attempt to sign in the user with the provided email and password
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If the sign-in is successful, you can perform additional actions here
    print('User signed in successfully.');
  } on FirebaseAuthException catch (e) {
    // Handle specific errors that might occur during the sign-in process
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      // Handle other FirebaseAuthException types if needed
      print('Error during sign-in: ${e.message}');
    }
  } catch (e) {
    // Handle general exceptions that might occur
    print('Unexpected error during sign-in: $e');
  }
}
