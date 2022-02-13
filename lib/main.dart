import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pizza_app/presentation/core/widgets/app_dependecies_widget.dart';
import 'package:pizza_app/presentation/core/widgets/app_widget.dart';
import 'package:pizza_app/presentation/core/widgets/theme_widget.dart';

import 'application/core/injections/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runZonedGuarded(
    () {
      runApp(
        const AppDependeciesWidget(
          child: ThemeWidget(
            key: Key("theme_widget"),
            child: AppWidget(
              key: Key("app_key"),
            ),
          ),
        ),
      );
    },
    (err, stack) {
      /// TODO: Configure error handling
    },
  );
}
