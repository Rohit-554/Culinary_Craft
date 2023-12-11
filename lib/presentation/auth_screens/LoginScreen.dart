import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/presentation/auth_screens/SignupScreen.dart';
import 'package:fud/presentation/home_screens/Home.dart';
import 'package:fud/presentation/uicomponents/ButtonComponent.dart';
import 'package:fud/presentation/uicomponents/UiComponents.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  @override
  MyLoginScreen createState() => MyLoginScreen();
}

class MyLoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    isUserExisting(context);
    return Scaffold(
        body: Center(
      child: LoginScreenUI(context),
          heightFactor: 1.6,
    ));
  }
}

SingleChildScrollView LoginScreenUI(BuildContext context) {
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
              print("value of email address ${_textController.text.trim()}");
              print("value of password ${_textController1.text}");
              await loginWithEmailAndPassword(_textController.text.trim(), _textController1.text.trim(),context);
            },),
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Padding(
             padding: EdgeInsets.only(top: 16),
             child:  Text(
               "New User? ",
               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: CupertinoColors.systemGrey),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 16),
             child:
             GestureDetector(
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  SignupScreen()),
                 );
               },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                ),
             ),
             // Text(
             //   "Sign Up",
             //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blueAccent),
             // ),
           ),
         ],

       )
      ],
    ),
  );
}
void isUserExisting(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
   // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
    /* Duration.zero is used as the delay duration.
 The Duration.zero represents a duration of zero seconds,
 meaning there is no delay at all. So, essentially,
 the callback function inside Future.delayed will be executed immediately, without any delay.
In this specific context, it might seem redundant to use Future.
delayed with a zero duration because you could achieve the same result by
directly calling the Navigator.push method without introducing a delay.
However, in some scenarios, developers might use Future.
delayed with a zero duration as a way to schedule the execution of code
to happen in the next event loop iteration.
This can be useful in certain cases where you want to
ensure that some code runs after the current frame of execution.
*/
  } else {
    print("User is null");
  }
}

Future<void> loginWithEmailAndPassword(String email, String password, BuildContext context) async {
  try {
    // Attempt to sign in the user with the provided email and password
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User signed in successfully.');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Home()),
    );
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
