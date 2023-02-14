import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user.dart';
import 'db _services.dart';


class AuthServices {
  final FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance; // details about login or sign in
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanage => _firebaseAuth.authStateChanges();

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //For Register

  Future<void> signUp(String email, String password, String name) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await DatabaseServices().addUser(AppUser(
      name: name,
      email: email,
      uid: FirebaseAuth.instance.currentUser!.uid,
    ));
  }

  ///                   For SignOut
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Google signin

  Future<void> logininwithgoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential myCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(myCredential);

    await DatabaseServices().addUser(AppUser(
      name: user.user!.displayName,
      email: user.user!.email,
      uid: user.user!.uid,
    ));

    debugPrint(user.user?.displayName);
  }

  // database services
}
