import 'package:flutter/material.dart';

class LoadingAnimationBuilder extends StatefulWidget {
  final Widget? child;

  final Widget Function(BuildContext context, Widget? child, Gradient gradient)
      builder;

  const LoadingAnimationBuilder({Key? key, this.child, required this.builder})
      : super(key: key);

  @override
  State<LoadingAnimationBuilder> createState() =>
      _LoadingAnimationBuilderState();
}

class _LoadingAnimationBuilderState extends State<LoadingAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..repeat(
        period: const Duration(seconds: 3),
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) => widget.builder(
        context,
        child,
        LinearGradient(
          colors: [
            Colors.grey,
            Colors.grey[350]!,
            Colors.grey,
          ],
          begin: const Alignment(-1, 0),
          end: const Alignment(1, 0),
          tileMode: TileMode.mirror,
          stops: [0, _controller.value, 1],
        ),
      ),
    );
  }
}
