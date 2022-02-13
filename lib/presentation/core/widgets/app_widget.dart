import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';

// TODO: initialise all needed parameters for `MaterialApp`.

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizza App",
      initialRoute: '/',
      routes: routes,
      darkTheme: darkTheme,
      theme: lightTheme,
    );
  }
}
