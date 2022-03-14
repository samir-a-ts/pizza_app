import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:pizza_app/application/core/notifiers/theme/multi_text_theme_notifier.dart';
import 'package:provider/provider.dart';

/// Set ups [MultiTextThemeNotifier] in lower widget tree.
/// Listens to [didChangePlatformBrightness], and changing
/// text theme color based on [brightness].
class ThemeWidget extends StatefulWidget {
  final Widget child;

  const ThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

/// [WidgetsBindingObserver] allows us
/// to listen to the platform and engine changes.
class _ThemeWidgetState extends State<ThemeWidget> with WidgetsBindingObserver {
  /// Instance if [MultiTextThemeNotifier].
  /// Holds logic of managing text themes and
  /// notifies changes throughout the app.
  late MultiTextThemeNotifier _textThemeNotifier;

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    _brightnessUpdated();
  }

  @override
  void initState() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;

    /// Instance initialization.
    _textThemeNotifier = MultiTextThemeNotifier(
      themesMap: {
        "playfair": playfairTextTheme,
        "sanfracisco": sanFraciscoTextTheme,
      },
    )

      /// Set up theme colors based on
      /// current app brightness.
      ..apply(
        textColor: brightness == Brightness.light ? blackColor : whiteColor,
      );

    WidgetsBinding.instance!.addObserver(this);

    super.initState();
  }

  /// Changes theme parameters based on
  /// [platformBrightness];
  void _brightnessUpdated() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;

    _textThemeNotifier.apply(
      textColor: brightness == Brightness.light ? blackColor : whiteColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiTextThemeNotifier>(
          create: (context) => _textThemeNotifier,
        ),
      ],
      child: widget.child,
    );
  }
}
