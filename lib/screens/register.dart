// import 'package:cosmic_pages/screens/dashboard.dart';
import 'package:cosmic_pages/controller/snackbar_controller.dart';
import 'package:cosmic_pages/screens/dashboard_with_nav.dart';
import 'package:cosmic_pages/screens/home.dart';
import 'package:cosmic_pages/screens/login.dart';
import 'package:cosmic_pages/services/firebase_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Snackbar _snackbar = Snackbar();

  final FirebaseServices firebaseServices = FirebaseServices();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          // This allows content to fill the screen height even when content is shorter
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
                    // Form fields section
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF31496F),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please fill below details to sign up',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        filled: true,
                        fillColor: Color(0xFFDEDEDE),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Author',
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                          groupValue: selectedRole,
                        ),
                        Text('Author'),
                        Radio<String>(
                          value: 'Reader',
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                        ),
                        Text('Reader'),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // Get.to(DashboardWithNav());
                        final name = nameController.text.trim();
                        final email = emailController.text.trim();
                        final password = passwordController.text;
                        final confirmPassword = confirmPasswordController.text;

                        if (name.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            confirmPassword.isEmpty ||
                            selectedRole == null) {
                          // Get.snackbar("Error", "All fields are required");
                          _snackbar.showCustomSnackBar(
                            context: context,
                            message: "All fields are required",
                            isSuccess: false,
                          );

                          return;
                        }
                        if (password != confirmPassword) {
                          // Get.snackbar("Error", "Passwords Do Not Match");
                          _snackbar.showCustomSnackBar(
                            context: context,
                            message: "Passwords do not match",
                            isSuccess: false,
                          );

                          return;
                        }
                        await firebaseServices.addUser(
                            name, email, password, selectedRole!);

                        _snackbar.showCustomSnackBar(
                          context: context,
                          message: "Registered successfully! Please Login.",
                          isSuccess: true,
                        );

                        Future.delayed(Duration(seconds: 2), () {
                          Get.to(() => login());
                        });

                        // Get.to(DashboardWithNav());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color(0xFF31496F),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Spacer(),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(login());
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // This makes the keyboard push content up naturally
      resizeToAvoidBottomInset: true,
    );
  }
}
