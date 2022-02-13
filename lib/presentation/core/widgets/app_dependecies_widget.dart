import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:provider/provider.dart';

// TODO: Initialise all dependecies
class AppDependeciesWidget extends StatelessWidget {
  final Widget child;

  const AppDependeciesWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiTextThemeNotifier>(
          create: (context) => MultiTextThemeNotifier(
            themesMap: {
              "playfair": playfairTextTheme,
              "sanfracisco": sanFraciscoTextTheme,
            },
          ),
        ),
      ],
      child: child,
    );
  }
}
