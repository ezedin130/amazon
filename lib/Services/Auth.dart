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
      toast.showToast(msg: 'the error was : $e');
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
      if (e.code == 'ERROR_USER_NOT_FOUND') {
        toast.showToast(msg: 'User not found');
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        toast.showToast(msg: 'Wrong password , try again');
      }
    } catch (e) {
      toast.showToast(msg: 'the error was : $e');
    }
    return null;
  }

  Future<void> LogoutUser() async {
    try {
      await _firebaseauth.signOut();
    } catch (e) {
      toast.showToast(msg: 'the error was : $e');
    }
  }
}
