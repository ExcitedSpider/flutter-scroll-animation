import 'package:flutter/material.dart';
import "package:bezier/bezier.dart";
import './base_sprite.dart';

class CurveSprite extends BaseSprite {
  /// 贝塞尔曲线
  /// https://pub.dev/packages/bezier
  final Bezier curve;
  /// 动画进度
  final double progress;

  const CurveSprite(
      {Key? key,
      required this.curve,
      required this.progress,
      required Widget spriteWidget})
      : super(key: key, spriteWidget: spriteWidget);

  @override
  _CruveSpriteState createState() => _CruveSpriteState();
}

class _CruveSpriteState extends BaseSpriteState<CurveSprite> {
  @override
  get interpolation {
    final dVector2 = widget.curve.pointAt(widget.progress);
    return Offset(dVector2[0], dVector2[1]);
  }
}
