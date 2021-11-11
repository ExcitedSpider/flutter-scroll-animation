import 'package:flutter/material.dart';

class BaseSprite extends StatefulWidget {
  /// 动画进度
  final double progress;

  const BaseSprite({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  BaseSpriteState createState() => BaseSpriteState();
}

class BaseSpriteState extends State<BaseSprite> {
  late Offset _translateOffset;

  get interpolation {
    return const Offset(0, 0);
  }

  @override
  void didUpdateWidget(BaseSprite oldSpirit) {
    super.didUpdateWidget(oldSpirit);

    setState(() {
      _translateOffset = interpolation;
    });
  }

  @override
  void initState() {
    super.initState();
    _translateOffset = const Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      child: const Image(
        image: AssetImage('assets/sprit.png'),
        height: 72,
        width: 72,
      ),
      offset: _translateOffset,
    );
  }
}
