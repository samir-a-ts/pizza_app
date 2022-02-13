import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/application/core/injections/injection.dart';
import 'package:pizza_app/presentation/core/widgets/app/app_dependecies_widget.dart';
import 'package:pizza_app/presentation/core/widgets/app/app_widget.dart';
import 'package:pizza_app/presentation/core/widgets/theme/theme_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
    (err, stack) async {
      await FirebaseCrashlytics.instance.recordFlutterError(
        FlutterErrorDetails(
          exception: err,
          stack: stack,
        ),
      );
    },
  );
}
