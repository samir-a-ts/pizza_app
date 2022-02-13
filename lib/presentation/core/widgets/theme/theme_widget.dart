import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:pizza_app/application/core/notifiers/theme/multi_text_theme_notifier.dart';
import 'package:provider/provider.dart';

class ThemeWidget extends StatefulWidget {
  final Widget child;

  const ThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> with WidgetsBindingObserver {
  late MultiTextThemeNotifier _textThemeNotifier;

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    _brightnessUpdated();
  }

  @override
  void initState() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;

    _textThemeNotifier = MultiTextThemeNotifier(
      themesMap: {
        "playfair": playfairTextTheme,
        "sanfracisco": sanFraciscoTextTheme,
      },
    )..apply(
        textColor: brightness == Brightness.light ? blackColor : whiteColor,
      );

    WidgetsBinding.instance!.addObserver(this);

    super.initState();
  }

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
        ChangeNotifierProvider(
          create: (context) => _textThemeNotifier,
        ),
      ],
      child: widget.child,
    );
  }
}
