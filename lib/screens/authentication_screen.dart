
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_boilerplate/blocs/authentication_bloc.dart';
import 'package:project_boilerplate/services/handlers/firebase/firebase_authentication_handler.dart';
import 'package:provider/provider.dart';
import 'package:project_boilerplate/common_widgets/widgets.dart';


class AuthenticationScreen extends StatelessWidget {

  final AuthenticationManager manager;
  final bool isLoading;

  const AuthenticationScreen({Key key,
    @required this.manager,
    @required this.isLoading
   }) : super(key: key);

  static Widget create(BuildContext context){
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
       child: Consumer(
        builder: (_, ValueNotifier<bool> isLoading, __) => Provider<AuthenticationManager>(
          create: (_) => AuthenticationManager(auth: auth, isLoading: isLoading),
          child: Consumer<AuthenticationManager>(
            builder: (context, manager, _) => AuthenticationScreen(manager: manager, isLoading: isLoading.value,)
          ),
        ),
      ),
    );
  }

  
  void _showError(BuildContext context, PlatformException exception){
    PlatformExceptionAlertDialog(
      exception: exception,
      title: "Sign In Failed",
    ).show(context);
  }

  void _signInAnonymously(BuildContext context) async{
    try{
      await manager.signInAnonymously();
    }on PlatformException catch (e){
      _showError(context, e);
    }catch(e){
      print(e.toString());
    }
  }

  void _googleSignIn(BuildContext context) async{
    try{
      await manager.googleSignIn();
    }on PlatformException catch (e){
      _showError(context, e);
    }catch(e){
      print(e.toString());
    }

  }

  void _facebookSignIn(BuildContext context) async{
    try{
      await manager.facebookSignIn();
    }on PlatformException catch (e){
      _showError(context, e);
    }catch(e){
      print(e.toString());
    }
  }

  void _emailSignIn(BuildContext context){
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => EmailSignIn()
    //   )
    // );
  }

  void _phoneAuthentication(BuildContext context){
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => EmailSignIn()
    //   )
    // );
  }

  @override
  Widget build(BuildContext context) {
    final _isLoading = Provider.of<ValueNotifier<bool>>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter boilerplate"),
          centerTitle: true,
        ),  
        body: _buildScreen(context)
      ),
    );
  }

  Container _buildScreen(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildHeader(),
            SizedBox(
              height: 48.0,
            ),
            // for commit
            SocialSignInButton(
              color: Colors.white,
              onPressed: isLoading ? null : () => _googleSignIn(context),
              text: "Sign in with Google",
              textColor: Colors.black87,
            ),

            SizedBox(
              height: 8.0,
            ),
            SocialSignInButton(
              color: Color(0xFF334D92),
              onPressed: isLoading ? null : () => _facebookSignIn(context),
              text: "Sign in with Facebook",
              textColor: Colors.white,
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              color: Colors.teal.shade700,
              textColor: Colors.white,
              text: "Sign in with Email",
              onPressed: isLoading ? null : () => _emailSignIn(context),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text("or", textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0, color: Colors.black87),),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
              color: Colors.purple.shade600,
              textColor: Colors.white30,
              text: "Phone authentication",
              onPressed: isLoading ? null : () =>  _phoneAuthentication(context),
            ),
            SignInButton(
              color: Colors.lime.shade300,
              textColor: Colors.black87,
              text: "Go anonymous",
              onPressed: isLoading ? null : () =>  _signInAnonymously(context),
            )
          ],
        ),
      );
  }

  Widget _buildHeader() {
    if(isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text("Sign In",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600
      ),
    );
  }
}