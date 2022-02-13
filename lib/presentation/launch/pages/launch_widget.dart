import 'package:flutter/material.dart';
import 'package:pizza_app/application/core/notifiers/theme/multi_text_theme_notifier.dart';
import 'package:pizza_app/presentation/core/icons/pizza_icons.dart';
import 'package:pizza_app/presentation/core/widgets/other/gap.dart';
import 'package:pizza_app/presentation/core/widgets/other/none.dart';
import 'package:provider/provider.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _LaunchText(),
            const Gap(size: 10),
            const Icon(PizzaIcons.location),
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColoredBox(
                    color: Colors.red,
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
