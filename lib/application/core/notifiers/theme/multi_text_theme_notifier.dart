import 'package:flutter/material.dart';

/// Class that holds all text themes
/// in map. Allows to hold several text themes
/// and propogate it throughout the app.
class MultiTextThemeNotifier extends ChangeNotifier {
  late Map<String, TextTheme> _themesMap;

  MultiTextThemeNotifier({required Map<String, TextTheme> themesMap}) {
    assert(themesMap.isNotEmpty);

    _themesMap = themesMap;
  }

  TextTheme operator [](String data) {
    if (_themesMap.containsKey(data)) return _themesMap[data]!;

    return _themesMap[_themesMap.keys.first]!;
  }

  void apply({
    Color? textColor,
  }) {
    if (_themesMap[_themesMap.keys.first]!.bodyText1!.color == textColor) {
      return;
    }

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

extension MultiTextThemeNotifierExt on MultiTextThemeNotifier {
  TextTheme get playFair => this["playfair"];

  TextTheme get sanFracisco => this["sanfracisco"];
}
