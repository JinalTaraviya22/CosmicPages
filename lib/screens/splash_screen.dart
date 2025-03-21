import 'package:cosmic_pages/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Get.to(welcome());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F7F3),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/blackLogo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'CosmicPages',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Italiana',
                    color: Color(0xFF31496F),),
              ),
              Text(
                textAlign: TextAlign.center,
                'Explore the Universe of Books - Read, Discover, and Soar Beyond!',
                style: TextStyle(
                    fontSize: 18,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
