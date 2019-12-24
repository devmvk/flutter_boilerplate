import 'package:flutter/material.dart';
import 'package:project_boilerplate/blocs/authentication_bloc.dart';
import 'package:provider/provider.dart';

import 'authentication_screen.dart';

class LandingController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc(),
      child: Consumer<AuthenticationBloc>(
        builder: (BuildContext context, AuthenticationBloc bloc, Widget child) {
          return AuthenticationScreen.create(context);
        },
      ),
    );
  }
}
