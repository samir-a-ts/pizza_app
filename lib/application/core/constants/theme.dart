part of '../constants.dart';

const _primaryColor = Color(0xFFFC4C4C);

final playfairTextTheme = GoogleFonts.playfairDisplayTextTheme(
  const TextTheme(
    headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 14),
    subtitle2: TextStyle(fontSize: 13),
    bodyText1: TextStyle(fontSize: 14),
    bodyText2: TextStyle(fontSize: 12),
    caption: TextStyle(fontSize: 8),
  ),
);

final sanFraciscoTextTheme = GoogleFonts.robotoTextTheme(
  const TextTheme(
    headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 14),
    subtitle2: TextStyle(fontSize: 13),
    bodyText1: TextStyle(fontSize: 14),
    bodyText2: TextStyle(fontSize: 12),
    caption: TextStyle(fontSize: 8),
  ),
);

const whiteColor = Color(0xFFFFFFFF);

const blackColor = Color(0xFF000000);

/// Basement of both themes.
final _theme = ThemeData(
  primaryColor: _primaryColor,
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

const loadingGray = Color(0x00a3a3a3);
const loadingGrayAccent = Color(0x008c8c8c);
