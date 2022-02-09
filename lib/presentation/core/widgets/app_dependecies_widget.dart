import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: Initialise all dependecies
class AppDependeciesWidget extends StatelessWidget {
  final Widget child;

  const AppDependeciesWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: child,
    );
  }
}
