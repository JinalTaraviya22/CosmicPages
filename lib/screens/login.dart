import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmic_pages/controller/snackbar_controller.dart';
import 'package:cosmic_pages/controller/user_auth.dart';
import 'package:cosmic_pages/screens/bottomnavbar.dart';
import 'package:cosmic_pages/screens/dashboard_with_nav.dart';
import 'package:cosmic_pages/screens/forgotPassword.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:cosmic_pages/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final Snackbar _snackbar = Snackbar();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios)),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF31496F)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please fill below details to login',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(Forgotpassword());
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          _snackbar.showCustomSnackBar(
                            context: context,
                            message: "Please enter both email and password.",
                            isSuccess: false,
                          );
                          return;
                        }

                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);

                          if (credential.user != null) {
                            print("✅ Login successful");
                            Get.to(() => DashboardWithNav());
                          }
                        } on FirebaseAuthException catch (e) {
                          print(
                              "🔥 FirebaseAuth Error: ${e.code} - ${e.message}");

                          String msg = "Something went wrong!";
                          if (e.code == 'user-not-found') {
                            msg = "No user found with this email.";
                          } else if (e.code == 'wrong-password') {
                            msg = "Incorrect password.";
                          } else if (e.code == 'invalid-credential') {
                            msg = "Invalid login credentials.";
                          } else if (e.code == 'invalid-email') {
                            msg = "Invalid email format.";
                          }

                          _snackbar.showCustomSnackBar(
                            context: context,
                            message: msg,
                            isSuccess: false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Color(0xFF31496F),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () async {
                        try {
                          // Attempt to sign in with Google
                          final user = await UserController.loginWithGoogle();

                          if (user != null) {
                            final email = user.email;

                            // Check if this user exists in Firestore
                            final querySnapshot = await FirebaseFirestore
                                .instance
                                .collection('UsersTbl')
                                .where('UserEmail', isEqualTo: email)
                                .limit(1)
                                .get();

                            if (querySnapshot.docs.isNotEmpty) {
                              // User exists in Firestore - direct to dashboard
                              print('✅ User is registered → Go to dashboard');
                              Get.to(() => DashboardWithNav());
                            } else {
                              // User doesn't exist in Firestore - sign them out and ask to register
                              print(
                                  '❌ User is not registered → Go to register');
                              _snackbar.showCustomSnackBar(
                                context: context,
                                message:
                                    "Please register first before signing in with Google.",
                                isSuccess: false,
                              );

                              // Sign out from Firebase and Google
                              await FirebaseAuth.instance.signOut();
                              await GoogleSignIn().signOut();
                            }
                          }
                        } on FirebaseAuthException catch (error) {
                          print('🔥 GoogleSignIn Error: ${error.message}');
                          _snackbar.showCustomSnackBar(
                            context: context,
                            message:
                                "Failed to sign in with Google: ${error.message}",
                            isSuccess: false,
                          );
                        } catch (e) {
                          print('❌ Error: $e');
                          _snackbar.showCustomSnackBar(
                            context: context,
                            message: "Something went wrong with Google sign-in",
                            isSuccess: false,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/googleLogo.png",
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Login with Google',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                    Spacer(),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Get.to(Register());
                          Get.to(() => Register());
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          'New member? Register',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
