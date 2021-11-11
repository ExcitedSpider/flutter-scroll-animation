import 'package:flutter/material.dart';

/// 基础 Sprite
abstract class BaseSprite extends StatefulWidget {
  final Widget spriteWidget;
  /// 动画进度
  final double progress;

  const BaseSprite({ Key? key, required this.spriteWidget, required this.progress }) : super(key: key);
}

/// 基础 Sprite State
/// 在每次组件动画时，获取当前的插值
abstract class BaseSpriteState<T extends BaseSprite> extends State<T> {
  late Offset translateOffset;

  /// 获取当前插值
  get interpolation {
    throw Exception('Subclas need to override get interpolation');
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      translateOffset = interpolation;
    });
  }

  @override
  void initState() {
    super.initState();
    translateOffset = const Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      child: widget.spriteWidget,
      offset: translateOffset,
    );
  }
}
