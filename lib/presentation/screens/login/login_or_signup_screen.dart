import 'package:atoz_admin/core/colors.dart';
import 'package:atoz_admin/core/constants.dart';
import 'package:atoz_admin/core/firebase_functions.dart';
import 'package:atoz_admin/presentation/screens/login/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginOrSignUp extends StatelessWidget {
  const LoginOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          backgroundColor: black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight25,
              InkWell(
                onTap: () {
                  googleSignIn();
                },
                hoverColor: grey,
                child: Container(
                  width: size.width * 0.9,
                  height: size.width * 0.13,
                  decoration: BoxDecoration(
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.circular(20),
                      color: white),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 20, color: black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              kHeight10,
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account? ",
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
