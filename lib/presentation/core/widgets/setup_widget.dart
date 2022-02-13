import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:provider/provider.dart';

class SetupWidget extends StatefulWidget {
  const SetupWidget({Key? key}) : super(key: key);

  @override
  _SetupWidgetState createState() => _SetupWidgetState();
}

class _SetupWidgetState extends State<SetupWidget> with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    _brightnessUpdated();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);

    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => _brightnessUpdated());
  }

  void _brightnessUpdated() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;

    Provider.of<MultiTextThemeNotifier>(context, listen: false).apply(
      textColor: brightness == Brightness.light ? blackColor : whiteColor,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "wow",
          style: context.select<MultiTextThemeNotifier, TextStyle>(
            (value) => value["playfair"].bodyText1!,
          ),
        ),
      ),
    );
  }
}
