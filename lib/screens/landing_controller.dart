import 'package:flutter/material.dart';
import 'package:project_boilerplate/blocs/authentication_bloc.dart';
import 'package:provider/provider.dart';
import 'package:project_boilerplate/services/handlers/firebase/firebase_authentication_handler.dart';
import 'authentication_screen.dart';
import 'package:project_boilerplate/services/handlers/firebase/firebase_handler.dart';

class LandingController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (BuildContext context) => FirebaseHandler(),
      child: Consumer<AuthBase>(
        builder: (
          BuildContext context,
          AuthBase auth,
          Widget child,
        ) {
          return Provider<AuthenticationManager>(
            create: (BuildContext context) => AuthenticationManager(
              isLoading: ValueNotifier<bool>(false),
              auth: auth,
            ),
            child: Consumer<AuthenticationManager>(
              builder: (
                BuildContext context,
                AuthenticationManager bloc,
                Widget child,
              ) {
                return AuthenticationScreen.create(context);
              },
            ),
          );
        },
      ),
    );
  }
}
