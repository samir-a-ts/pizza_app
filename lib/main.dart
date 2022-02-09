import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pizza_app/presentation/core/widgets/app_dependecies_widget.dart';
import 'package:pizza_app/presentation/core/widgets/app_widget.dart';

import 'application/core/injections/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runZonedGuarded(
    () {
      runApp(
        const AppDependeciesWidget(
          child: AppWidget(),
        ),
      );
    },
    (err, stack) {
      /// TODO: Configure error handling
    },
  );
}
