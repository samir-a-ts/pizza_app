import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/notifiers/theme/multi_text_theme_notifier.dart';
import 'package:provider/provider.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _LaunchText(),
      ),
    );
  }
}

class _LaunchText extends StatelessWidget {
  const _LaunchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "wow",
      style: context.select<MultiTextThemeNotifier, TextStyle>(
        (value) => value.playFair.bodyText1!,
      ),
    );
  }
}
