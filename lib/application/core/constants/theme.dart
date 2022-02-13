part of '../constants.dart';

const _primaryColor = Color(0xFFFC4C4C);

final playfairTextTheme = GoogleFonts.playfairDisplayTextTheme();

final sanFraciscoTextTheme = GoogleFonts.robotoTextTheme();

const whiteColor = Color(0xFFFFFFFF);

const blackColor = Color(0xFF000000);

/// Basement of both themes.
final _theme = ThemeData(
  primaryColor: _primaryColor,
  iconTheme: const IconThemeData(
    color: _primaryColor,
  ),
);

/// Data for light theme.
final lightTheme = _theme.copyWith(
  backgroundColor: const Color(0xFFFEFEFE),
  scaffoldBackgroundColor: const Color(0xFFFEFEFE),
);

/// Data for dark theme.
final darkTheme = _theme.copyWith(
  backgroundColor: const Color(0xFF231E36),
  scaffoldBackgroundColor: const Color(0xFF231E36),
);

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
    final appliedThemesMap = <String, TextTheme>{};

    final keys = _themesMap.keys.toList();

    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];

      appliedThemesMap[key] = _themesMap[key]!.apply(
        bodyColor: textColor,
      );
    }

    _themesMap = appliedThemesMap;

    notifyListeners();
  }
}
