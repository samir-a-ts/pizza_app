import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:pizza_app/presentation/launch/pages/launch_page.dart';
import 'package:pizza_app/presentation/menu/pages/menu_page.dart';

part 'constants/routing.dart';
part 'constants/theme.dart';

abstract class EnvironmentHelper {
  static String get _devUrl => "http://localhost:7159";

  static String get _productionUrl => "i dont have money for deploy";

  static String getBaseUrl(String environment) {
    switch (environment) {
      case Environment.prod:
        return _productionUrl;
      case Environment.dev:
        return _devUrl;
      case Environment.test:
        return _devUrl;
    }

    return _devUrl;
  }
}
