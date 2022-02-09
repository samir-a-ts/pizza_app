import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';

// TODO: initialise all needed parameters for `MaterialApp`.

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizza App",
      initialRoute: '/',
      routes: routes,
    );
  }
}
