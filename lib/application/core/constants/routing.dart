part of '../constants.dart';

/// Map of static routes of the app.
final Map<String, WidgetBuilder> routes = {
  '/launch': (context) => const LaunchPage(
        key: Key("launch_page"),
      ),
  "/menu": (context) => const MenuPage(
        key: Key("menu_page"),
      ),
};
