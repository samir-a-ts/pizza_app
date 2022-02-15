import 'package:flutter/material.dart';
import 'package:pizza_app/presentation/core/icons/pizza_icons.dart';
import 'package:pizza_app/presentation/core/widgets/other/logo.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 128),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    PizzaIcons.menu,
                    size: 24,
                  ),
                  Hero(
                    tag: "logo_hero",
                    child: Logo(),
                  ),
                  Icon(
                    PizzaIcons.search,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
