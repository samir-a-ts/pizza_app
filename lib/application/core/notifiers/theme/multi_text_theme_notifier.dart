import 'package:flutter/material.dart';

/// Class that holds all text themes
/// in map. Allows to hold several text themes
/// and propogate it throughout the lower tree.
class MultiTextThemeNotifier extends ChangeNotifier {
  late Map<String, TextTheme> _themesMap;

  MultiTextThemeNotifier({required Map<String, TextTheme> themesMap}) {
    assert(themesMap.isNotEmpty);

    _themesMap = themesMap;
  }

  /// Gets [TextTheme] from themes container
  /// based on key theme was written.
  ///
  /// If there are no such a key in theme
  /// map, first theme would be returned.
  TextTheme operator [](String key) {
    if (_themesMap.containsKey(key)) return _themesMap[key]!;

    return _themesMap[_themesMap.keys.first]!;
  }

  /// Applies provided color
  /// to all [TextTheme]s in map.
  void apply({
    Color? textColor,
  }) {
    final appliedThemesMap = <String, TextTheme>{};

    final keys = _themesMap.keys.toList();

    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];

      appliedThemesMap[key] = _themesMap[key]!.apply(
        bodyColor: textColor,
        displayColor: textColor,
      );
    }

    _themesMap = appliedThemesMap;

    notifyListeners();
  }
}

/// Adds getter for particular themes
/// in [MultiTextThemeNotifier].
extension MultiTextThemeNotifierExt on MultiTextThemeNotifier {
  TextTheme get playFair => this["playfair"];

  TextTheme get sanFracisco => this["sanfracisco"];
}
