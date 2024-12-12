// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'Toast.dart';

final toast = Toast();

class Authentication {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  //User? get user => _firebaseauth.currentUser;

  Future<User?> CreateUser(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        toast.showToast(msg: 'Account already exists');
      }
    } catch (e) {
      print('the error was : $e');
    }
    return null;
  }

  Future<User?> SigninUser(
      {required String email, required String password}) async {
    try {
      UserCredential credentials = await _firebaseauth
          .signInWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        toast.showToast(msg: 'Invalid email or password.');
      } else {
        toast.showToast(msg: 'An error occurred: ${e.code}');
      }
    } catch (e) {
      print('the error was : $e');
    }
    return null;
  }

  Future<void> LogoutUser() async {
    try {
      await _firebaseauth.signOut();
    } catch (e) {
      print('the error was : $e');
    }
  }
  //function that returns true if user is logged in and returns false otherwise
}
