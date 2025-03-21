import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic to handle form submission here
                print('Form submitted!');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}