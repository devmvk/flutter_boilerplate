import 'package:meta/meta.dart';

abstract class AuthBase{

  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> googleSignIn();
  Future<User> facebookSignIn();
  Future<User> emailAndPasswordSignIn(String email, String password);
  Future<User> createAccount(String email, String password);
  Future<void> signOut();
  Future<User> phoneAuthentication();
  Stream<User> get onAuthStateChanged;

}

class AuthBaseImpl extends AuthBase{
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

class User{
  final String uid;
  final String displayName;
  final String avatarUrl;
  User({@required this.uid, @required this.avatarUrl, @required this.displayName});
}