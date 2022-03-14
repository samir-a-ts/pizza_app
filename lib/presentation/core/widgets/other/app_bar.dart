import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:pizza_app/presentation/core/icons/pizza_icons.dart';
import 'package:pizza_app/presentation/core/widgets/other/logo.dart';

class PizzaBar extends StatelessWidget with PreferredSizeWidget {
  final String heroKey;

  PizzaBar({Key? key, this.heroKey = "logo_hero"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const _DrawerButton(),
              Hero(
                tag: heroKey,
                child: const Logo(),
              ),
              const _SearchButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 128.sp);
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: blackColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox.fromSize(
        size: const Size(40, 40),
        child: Center(
          child: Icon(
            PizzaIcons.search,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Scaffold.maybeOf(context)?.openDrawer();
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(
          PizzaIcons.menu,
          size: 24.sp,
        ),
      ),
    );
  }
}
