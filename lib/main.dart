import 'package:cosmic_pages/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: splash_screen(),
      ),
    );

// class MyLoginPage extends StatelessWidget {
//   const MyLoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: welcome(),
//     );
//   }
// }
