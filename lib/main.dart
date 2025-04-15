import 'package:cosmic_pages/firebase_options.dart';
import 'package:cosmic_pages/screens/login.dart';
import 'package:cosmic_pages/screens/splash_screen.dart';
import 'package:cosmic_pages/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// main() => runApp(
//       GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           fontFamily: 'OpenSans',
//         ),
//         home: splash_screen(),
//       ),
//     );

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CosmicPages());
}

class CosmicPages extends StatelessWidget {
  const CosmicPages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: splash_screen(),
    );
  }
}
