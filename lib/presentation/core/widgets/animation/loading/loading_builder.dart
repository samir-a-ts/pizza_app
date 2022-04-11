import 'package:flutter/material.dart';

const _animationDuration = Duration(seconds: 4);

const _delayDuration = Duration(seconds: 1);

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
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    _controller.addListener(() async {
      if (_controller.isCompleted) {
        await Future.delayed(_delayDuration);
        _controller.forward(from: 0.0);
      }
    });

    _controller.forward(from: 0.0);
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
            Colors.grey[500]!,
            Colors.grey[500]!,
            Colors.grey[350]!,
            Colors.grey[350]!,
            Colors.grey[500]!,
            Colors.grey[500]!,
          ],
          begin: const Alignment(-1.4, 0),
          end: const Alignment(1.4, 0),
          tileMode: TileMode.mirror,
          stops: [
            0,
            _controller.value - 0.17,
            _controller.value - 0.05,
            _controller.value + 0.05,
            _controller.value + 0.17,
            1
          ],
        ),
      ),
    );
  }
}
