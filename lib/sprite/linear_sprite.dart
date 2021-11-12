import 'package:flutter/material.dart';
import './base_sprite.dart';

/// 实现线性运动
class LinearSprite extends BaseSprite {
  /// 动画开始点
  final Offset from;
  /// 动画结束点
  final Offset to;

  const LinearSprite(
      {Key? key,
      required double progress,
      required Widget spriteWidget,
      required this.from,
      required this.to,
      })
      : super(key: key, spriteWidget: spriteWidget, progress: progress);

  @override
  _LinearSpriteState createState() => _LinearSpriteState();
}

class _LinearSpriteState extends BaseSpriteState<LinearSprite> {
  @override
  get interpolation {
    final dx = widget.to.dx - widget.from.dx;
    final dy = widget.to.dy - widget.from.dy;

    return Offset(dx * widget.progress, dy * widget.progress);
  }
}
