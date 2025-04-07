import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController{
  static User? user=FirebaseAuth.instance.currentUser;

  static Future<User?> loginWithGoogle() async {
    final googleAccount=await GoogleSignIn().signIn();
    final googleAuth=await googleAccount?.authentication;

    final credential=GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    final userCredentials=await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredentials.user;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}