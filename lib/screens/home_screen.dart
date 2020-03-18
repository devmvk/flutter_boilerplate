import 'package:flutter/material.dart';
import 'package:project_boilerplate/services/firebase_authentication_handler.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome ${user.displayName}"),
      ),
    );
  }
}