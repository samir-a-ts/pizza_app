import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_app/application/core/injections/injection.dart';
import 'package:pizza_app/presentation/core/widgets/app/app_dependecies_widget.dart';
import 'package:pizza_app/presentation/core/widgets/app/app_widget.dart';
import 'package:pizza_app/presentation/core/widgets/theme/theme_widget.dart';

/// App's starting point.
///
/// Does pre-run compilations,
/// initializations and then runs
/// the app.
Future<void> main() async {
  /// Ensures that all Flutter Bindings
  /// have been binded to Engine.
  ///
  /// Unlocks possibility of pre-run
  /// computations.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialises the Firebase app
  /// and allows requests to Firebase app.
  await Firebase.initializeApp();

  /// Adds to injection container all
  /// registered dependecies.
  configureDependencies();

  /// Runs code in his own *Zone*.
  ///
  /// Allows us to catch all exceptions that
  /// came from particular part of code.
  runZonedGuarded(
    () {
      /// Attaches root widget and
      /// schedules *warm-up* frame.
      ///
      /// This function sets provided
      /// widget in root, that we actually see.
      ///
      /// Also rendering first widget might be
      /// expensive, so we adds to one frame
      /// a lot more time to compute.
      runApp(
        /// Initialises screen util in
        /// lower widget tree.
        ///
        /// Auto-scales app UI elements
        /// based on actual design size.
        ScreenUtilInit(
          builder: () => const AppDependeciesWidget(
            child: ThemeWidget(
              key: Key("theme_widget"),
              child: AppWidget(
                key: Key("app_key"),
              ),
            ),
          ),
          designSize: const Size(375, 812),
        ),
      );
    },
    (err, stack) {
      /// If we registered error in upper scope,
      /// we sent it to *FirebaseCrashlytics*.
      FirebaseCrashlytics.instance.recordFlutterError(
        FlutterErrorDetails(
          exception: err,
          stack: stack,
        ),
      );
    },
  );
}
