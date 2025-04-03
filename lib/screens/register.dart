import 'package:cosmic_pages/screens/dashboard.dart';
import 'package:cosmic_pages/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
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
                  'Get Started',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please fill below details to sign up',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Color(0xFFDEDEDE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email Id',
                      filled: true,
                      fillColor: Color(0xFFDEDEDE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Color(0xFFDEDEDE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Color(0xFFDEDEDE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Author',
                      onChanged: (value) {},
                      groupValue: null,
                    ),
                    Text('Author'),
                    Radio(
                        value: 'Reader',
                        groupValue: null,
                        onChanged: (value) {}),
                    Text('Reader'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.off(Dashboard());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.black,
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
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Already have an account? Login',
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
    );
  }
}
