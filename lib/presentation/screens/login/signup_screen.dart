import 'dart:developer';

import 'package:atoz_admin/core/colors.dart';
import 'package:atoz_admin/core/constants.dart';
import 'package:atoz_admin/core/firebase_functions.dart';
import 'package:atoz_admin/presentation/screens/login/loginpage.dart';
import 'package:atoz_admin/presentation/widgets/textfield_signup.dart';
import 'package:atoz_admin/presentation/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Future<void> signUp() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      // if (EmailValidator.validate(emailController.text) &&
      //     passwordController.text.trim().length >= 8) {
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        User currentuser = FirebaseAuth.instance.currentUser!;
        currentuser.updateDisplayName(nameController.text);
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        utils.showSnackbar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      // } else {
      //   return false;
      // }
      return;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                kHeight10,
                kHeight10,
                TextFieldSignUp(
                    controller: nameController,
                    icon: Icons.edit,
                    title: 'Name'),
                kHeight10,
                TextFieldSignUp(
                    selection: 1,
                    controller: emailController,
                    icon: Icons.email,
                    title: 'Email'),
                kHeight10,
                TextFieldSignUp(
                  // validator: ,
                  passwordVisible: true,
                  controller: passwordController,
                  icon: Icons.lock,
                  title: 'Password',
                ),
                kHeight10,
                kHeight10,
                InkWell(
                  onTap: () {
                    signUp();
                  },
                  child: Container(
                    width: size.width * 0.9,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(color: white),
                        borderRadius: BorderRadius.circular(20),
                        color: black),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'SignUp',
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      ),
                    ),
                  ),
                ),
                kHeight10,
                Center(
                  child: SizedBox(
                    width: size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: 1,
                            color: grey,
                          ),
                          const Text('or Sign up with'),
                          Container(
                            width: size.width * 0.3,
                            height: 1,
                            color: black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                kHeight10,
                GestureDetector(
                  onTap: () {
                    googleSignIn();
                  },
                  child: SizedBox(
                    width: 40,
                    child: Image.network(
                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png'),
                  ),
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: black, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
