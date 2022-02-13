import 'package:flutter/cupertino.dart';

class _None extends LeafRenderObjectWidget {
  const _None({Key? key}) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderNone();
  }
}

class _RenderNone extends RenderBox {
  @override
  Rect get paintBounds => Rect.zero;

  @override
  Rect get semanticBounds => Rect.zero;

  @override
  void performLayout() {
    size = Size.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {}

  @override
  void performResize() {}

  @override
  double computeMinIntrinsicWidth(double height) => 0;

  @override
  double computeMaxIntrinsicWidth(double height) => 0;

  @override
  double computeMinIntrinsicHeight(double width) => 0;

  @override
  double computeMaxIntrinsicHeight(double width) => 0;
}

const none = _None(key: Key("none"));
