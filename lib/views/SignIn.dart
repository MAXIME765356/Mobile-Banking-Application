import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inway/utils/app_colors.dart';
import 'package:inway/views/ResetPasswordScreen.dart';
import 'package:inway/views/login_screen.dart';
import 'package:inway/views/profile_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/green_intro_widget.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.greenColor,
  );

  final auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    // Create an instance of the firebase auth and google signin
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Triger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in the user with the credentials
    final UserCredential userCredential =
    await auth.signInWithCredential(credential);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'UCONNECT'// Change the color of UCONNECT to green
          ),
        ),
        backgroundColor: AppColors.greenColor, // Set the appBar background color to green
      ),
      body: Column(
        children: [

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password'),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(

            style: buttonStyle,

            onPressed: () async {
              try {
                await auth.signInWithEmailAndPassword(
                    email: _emailController.text, password: _passwordController.text);

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              } catch (e) {
                // Handle the error
              }
            },
            child: const Text('login'), // Change the text color of login to green
          ),

          SizedBox(height: 20),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  await signInWithGoogle(context);
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greenColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:

                        8.0),
                        child: Image.asset('images/banking/google.png'),
                      ),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.greenColor, // Change the text color of Continue with Google to green
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(

           style: buttonStyle,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettingScreen()),
              );
            },
            child: const Text('Click To Register'), // Change the text color of Click To Register to green
          ),
          SizedBox(height: 20),

          ElevatedButton(

            style: buttonStyle,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
              );
            },
            child: const Text('Reset Password'), // Change the text color of Reset Password to green
          ),
        ],
      ),
    );
  }

  }














