import 'package:flutter/material.dart';

class LinearSpirit extends StatefulWidget {
  double progress;
  Size? containerSize;
  Offset from;
  Offset to;

  LinearSpirit({Key? key, required this.progress, this.containerSize,required this.from,required this.to })
      : super(key: key);

  @override
  _LinearSpiritState createState() => _LinearSpiritState();
}

class _LinearSpiritState extends State<LinearSpirit> {
  late AnimationController _controller;
  late Offset _translateOffset;

  get interpolation {
    final dx = widget.to.dx - widget.from.dx;
    final dy = widget.to.dy - widget.from.dy;
    return Offset(dx * widget.progress, dy * widget.progress);
  }

  @override
  void didUpdateWidget(LinearSpirit oldSpirit) {
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
  void dispose() {
    super.dispose();
    _controller.dispose();
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
