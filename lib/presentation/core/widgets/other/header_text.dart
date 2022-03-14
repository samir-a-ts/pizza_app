import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/application/core/notifiers/theme/multi_text_theme_notifier.dart';

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.select<MultiTextThemeNotifier, TextStyle>(
        (v) => v.playFair.headline1!,
      ),
    );
  }
}
