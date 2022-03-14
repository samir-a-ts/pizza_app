import 'package:flutter/material.dart';

// TODO: Initialise all dependecies

/// Provides all dependecies
/// (repositories, state managers, etc)
/// in lower element tree.
class AppDependeciesWidget extends StatelessWidget {
  final Widget child;

  const AppDependeciesWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
