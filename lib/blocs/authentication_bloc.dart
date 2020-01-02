import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:project_boilerplate/services/firebase_authentication_handler.dart';

class AuthenticationManager{
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;
  AuthenticationManager({@required this.auth, @required this.isLoading});
  
  
  Future<User> _signIn(Future<User> Function() signInMethod) async{
    try{
      isLoading.value = true;
      return await signInMethod();
    }catch(e){
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInAnonymously() async => await _signIn(auth.signInAnonymously);
  Future<User> googleSignIn() async => await _signIn(auth.googleSignIn);
  Future<User> facebookSignIn() async => await _signIn(auth.facebookSignIn);
}