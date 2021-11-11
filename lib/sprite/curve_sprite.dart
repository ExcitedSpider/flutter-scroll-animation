import 'package:flutter/material.dart';
import "package:bezier/bezier.dart";
import './base_sprite.dart';

class CurveSprite extends BaseSprite {
  /// 贝塞尔曲线
  /// https://pub.dev/packages/bezier
  final Bezier curve;

  const CurveSprite(
      {Key? key,
      required double progress,
      required Widget spriteWidget,
      required this.curve,
      })
      : super(key: key, spriteWidget: spriteWidget, progress: progress);

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
