import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_app/generated/l10n.dart';
import 'package:pizza_app/presentation/core/widgets/animation/loading/loading_builder.dart';

class MenuLoadingPlaceholder extends StatelessWidget {
  const MenuLoadingPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 12.sp,
          ),
          child: LoadingAnimationBuilder(
            builder: (context, child, gradient) => _LoadingText(
              gradient: gradient,
              text: S.of(context).loading,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.sp,
          ),
          child: LoadingAnimationBuilder(
            builder: (context, child, gradient) => _LoadingContainer(
              gradient: gradient,
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingText extends StatelessWidget {
  final Gradient gradient;
  final String text;
  final TextStyle? style;

  const _LoadingText({
    Key? key,
    required this.gradient,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class _LoadingContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxDecoration decoration;
  final Gradient gradient;
  final Widget? child;

  const _LoadingContainer({
    Key? key,
    this.width,
    this.height,
    this.decoration = const BoxDecoration(),
    required this.gradient,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration.copyWith(
        gradient: gradient,
      ),
      child: child,
    );
  }
}
