

import 'package:project_boilerplate/services/firebase_authentication_handler.dart';

class FirebaseHandler extends AuthBase{

  FirebaseHandler._();

  static FirebaseHandler get instance => FirebaseHandler._();

  Future<User> currentUser() =>  null;
  Future<User> signInAnonymously() =>  null;
  Future<User> googleSignIn() =>  null;
  Future<User> facebookSignIn() =>  null;
  Future<User> emailAndPasswordSignIn(String email, String password) =>  null;
  Future<User> createAccount(String email, String password) =>  null;
  Future<void> signOut() =>  null;
  Future<User> phoneAuthentication() => null;
  Stream<User> get onAuthStateChanged =>  null;
}