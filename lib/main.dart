import 'package:cosmic_pages/screens/publishedbooks.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: publishedbooks(),
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
