

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_boilerplate/services/firebase_authentication_handler.dart';

class FirebaseHandler extends AuthBase{

  FirebaseHandler._();
  static FirebaseHandler get instance => FirebaseHandler._();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override Future<User> currentUser() async{
    return _auth.currentUser()
      .then((_fireUser) => _fireUser != null ? User(uid: _fireUser.uid, avatarUrl: _fireUser.photoUrl, displayName: _fireUser.displayName) : null)
      .catchError((e){print(e.toString());});
  }

  @override Future<User> signInAnonymously() async{
    return _auth.signInAnonymously()
      .then((_fireAuthResult) => User(uid: _fireAuthResult.user.uid, avatarUrl: _fireAuthResult.user.photoUrl, displayName: _fireAuthResult.user.displayName))
      .catchError((e){print(e.toString());});
  }
  
  @override Future<User> googleSignIn() async{
    try{
      GoogleSignIn _gSignIn = GoogleSignIn();
      GoogleSignInAccount _gAccount = await _gSignIn.signIn();
      if(_gAccount != null){
        GoogleSignInAuthentication _gAuthentication = await _gAccount.authentication;
         return _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken
          )
        ).then<User>((AuthResult _fbAuth) => _fbAuth.user != null ? User(uid: _fbAuth.user.uid, avatarUrl: _fbAuth.user.photoUrl, displayName: _fbAuth.user.displayName) : null);
      }else{
        throw StateError("");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }

  @override Future<User> facebookSignIn() async{
    try{
      final FacebookLogin _fLogin = FacebookLogin();
      final FacebookLoginResult  _result = await _fLogin.logIn(['public_profile']);

      switch(_result.status){
        case FacebookLoginStatus.loggedIn:
          return _auth.signInWithCredential(
            FacebookAuthProvider.getCredential(
              accessToken: _result.accessToken.token
            )
          ).then<User>((AuthResult _fbAuth) => _fbAuth.user != null ? User(uid: _fbAuth.user.uid, avatarUrl: _fbAuth.user.photoUrl, displayName: _fbAuth.user.displayName) : null);
          break;
        case FacebookLoginStatus.cancelledByUser:
          throw StateError("User Cancelled");
          break;
        case FacebookLoginStatus.error:
          throw StateError("Error");
          break;
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }
  @override Future<User> emailAndPasswordSignIn(String email, String password) async{
    try{
      return _auth.signInWithEmailAndPassword(email: email, password: password)
      .then<User>((AuthResult _fbAuth) => _fbAuth.user != null ? User(uid: _fbAuth.user.uid, avatarUrl: _fbAuth.user.photoUrl, displayName: _fbAuth.user.displayName) : null);
    }catch (e){
      throw Exception(e.toString());
    }
  }
  
  @override Future<User> createAccount(String email, String password) async{
    try{
      return _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then<User>((AuthResult _fbAuth) => _fbAuth.user != null ? User(uid: _fbAuth.user.uid, avatarUrl: _fbAuth.user.photoUrl, displayName: _fbAuth.user.displayName) : null);
    }catch (e){
      throw Exception(e.toString());
    }
  }

  @override Future<void> signOut() {
    GoogleSignIn _gSignIn = GoogleSignIn();
    _gSignIn.isSignedIn().then((bool isSignedIn){
      if(isSignedIn) _gSignIn.signOut();
    });
    FacebookLogin _fLogin = FacebookLogin();
    _fLogin.isLoggedIn..then((bool isSignedIn){
      if(isSignedIn) _fLogin.logOut();
    });
    return _auth.signOut();
  }
  
  @override Future<User> mobileSignIn() => null;
  @override Stream<User> get onAuthStateChanged =>  _auth.onAuthStateChanged.map((_fireUser) => _fireUser != null ? User(uid: _fireUser.uid, avatarUrl: _fireUser.photoUrl, displayName: _fireUser.displayName) : null);
}