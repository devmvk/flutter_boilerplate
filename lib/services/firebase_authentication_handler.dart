import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthBase{

  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> googleSignIn();
  Future<User> facebookSignIn();
  Future<User> emailAndPasswordSignIn(String email, String password);
  Future<User> createAccount(String email, String password);
  Future<void> signOut();
  Future<User> mobileSignIn();
  Stream<User> get onAuthStateChanged;
  Future<void> verifyPhoneNumber({@required String mobileNumber});
}

class User{
  final String uid;
  final String displayName;
  final String avatarUrl;
  final AuthResult result;
  User({@required this.uid, @required this.avatarUrl, @required this.displayName, this.result});
}