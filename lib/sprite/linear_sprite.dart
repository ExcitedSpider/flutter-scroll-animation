import 'package:flutter/material.dart';

/// 实现线性运动
class LinearSprite extends StatefulWidget {
  /// 动画进度
  final double progress;
  /// 动画开始点
  final Offset from;
  /// 动画结束点
  final Offset to;

  const LinearSprite(
      {Key? key,
      required this.progress,
      required this.from,
      required this.to})
      : super(key: key);

  @override
  _LinearSpriteState createState() => _LinearSpriteState();
}

class _LinearSpriteState extends State<LinearSprite> {
  late Offset _translateOffset;

  get interpolation {
    final dx = widget.to.dx - widget.from.dx;
    final dy = widget.to.dy - widget.from.dy;
    return Offset(dx * widget.progress, dy * widget.progress);
  }

  @override
  void didUpdateWidget(LinearSprite oldSpirit) {
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
