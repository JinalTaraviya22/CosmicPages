import 'package:cosmic_pages/screens/login.dart';
import 'package:cosmic_pages/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/blah.png',
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height*1,
                  width: double.infinity,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  // padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/whiteLogo.png',
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'Welcome to CosmicPages',
                        style: TextStyle(fontSize: 24, color: Colors.white,fontFamily: 'Italiana'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Explore the Universe of Books - Read, Discover, and Soar Beyond!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(Register());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF31496F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: SizedBox(
                            width: 200,
                            height: 50,
                            child: Center(child: Text('Get Started',style: TextStyle(fontSize: 16),))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(login());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF31496F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: SizedBox(
                            width: 200,
                            height: 50,
                            child:
                                Center(child: Text('Already have an account?',style: TextStyle(fontSize: 16),))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
