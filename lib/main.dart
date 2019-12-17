import 'package:flutter/material.dart';
import 'package:project_boilerplate/appconfig.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(Devmvk());
 
class Devmvk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppConfig>(
      create: (BuildContext context) => AppConfig(),
          child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}