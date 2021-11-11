import 'package:flutter/material.dart';

class BaseSprite extends StatefulWidget {
  final Widget spriteWidget;

  const BaseSprite({ Key? key, required this.spriteWidget }) : super(key: key);

  @override
  BaseSpriteState createState() => BaseSpriteState();
}

class BaseSpriteState<T extends BaseSprite> extends State<T> {
  late Offset translateOffset;

  /// 获取当前插值
  get interpolation {
    throw Exception('Subclas need to override get interpolation');
  }

  @override
  void didUpdateWidget(T oldSpirit) {
    super.didUpdateWidget(oldSpirit);

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
