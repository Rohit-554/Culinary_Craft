import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fud/colors/Colors.dart';
import 'package:fud/presentation/home_screens/Home.dart';
import 'package:fud/presentation/uicomponents/ButtonComponent.dart';
import 'package:fud/presentation/uicomponents/UiComponents.dart';
import 'package:google_sign_in/google_sign_in.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  @override
  MySignupScreen createState() => MySignupScreen();
}

class MySignupScreen extends State<SignupScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    isUserExisting(context);

    return Scaffold(
        body: Center(
      child: SignupScreenUI(context),
      heightFactor: 1.6,
    ));
  }
}

SingleChildScrollView SignupScreenUI(BuildContext context) {
  TextEditingController _textController = TextEditingController();
  TextEditingController _textController1 = TextEditingController();
  return SingleChildScrollView(
    padding: EdgeInsets.only(top: 0),
    child: Column(
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
        Padding(
            padding:
                const EdgeInsets.only(top: 28, left: 20, right: 20, bottom: 20),
            child: RoundedEditText(
              hint: 'Email Address',
              controller: _textController,
            )),
        Padding(
            padding:
                const EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 0),
            child: RoundedEditText(
              hint: 'Password',
              controller: _textController1,
            )),
        Padding(
          padding:
              const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 0),
          child: RoundedButton(
            text: 'Sign Up',
            onPressed: () async {
              print("value of email address ${_textController.text}");
              print("value of password ${_textController1.text}");
              await signupWithEmailAndPassword(
                  _textController.text.trim(), _textController1.text.trim(),context);
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "or",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: CupertinoColors.systemGrey),
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
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                  ),
                ),
                onPressed: () async {
                  try {
                    UserCredential usercredential = await signInWithGoogle();
                    if (usercredential.user != null) {
                      print("User Authenticated, user is up");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      print("Failed to Authenticate");
                    }
                  } catch (e) {
                    print("error in google sign in $e");
                  }
                },
                label: const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    " Sign Up with Google",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                )),
          ),
        )
      ],
    ),
  );
}

Future<void> signupWithEmailAndPassword(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password); //all authentication services of firebase can be accessed through FirebaseAuth.instance

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Home()),
    );

    print('user registered successfully');
  } catch (e) {
    print('error in registering user$e');
  }
}

void isUserExisting(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  } else {
    print("User is null");
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
/* to generate SHA1 key for using google apis such as google sign in use in powershell of C:\Program Files\Java\jdk-19\bin -->
keytool -list -v -keystore "C:\Users\"Your-User-Name(no quotes)"\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
  */