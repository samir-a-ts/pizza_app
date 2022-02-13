import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Gap extends LeafRenderObjectWidget {
  final double size;

  const Gap({Key? key, required this.size}) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = RenderConstrainedBox(
      additionalConstraints: BoxConstraints(
        maxHeight: size,
        maxWidth: size,
        minHeight: size,
        minWidth: size,
      ),
    );

    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderConstrainedBox renderObject) {
    if (renderObject.size.width == size) return;

    renderObject.additionalConstraints = BoxConstraints(
      maxHeight: size,
      maxWidth: size,
      minHeight: size,
      minWidth: size,
    );
  }
}
