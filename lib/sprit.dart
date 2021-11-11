import 'package:flutter/material.dart';

class Spirit extends StatefulWidget {
  double progress;
  Spirit({ Key? key, required this.progress }) : super(key: key);

  @override
  _SpiritState createState() => _SpiritState();
}

class _SpiritState extends State<Spirit> {
  late AnimationController _controller;
  late Offset _translateOffset;

  @override
  void didUpdateWidget(Spirit oldSpirit){
    super.didUpdateWidget(oldSpirit);

    setState(() {
      _translateOffset = Offset(widget.progress * 100, widget.progress * 100);
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
    return FractionalTranslation(
      child: const Image(image: AssetImage('assets/sprit.png'), height: 72, width: 72,),
      translation: _translateOffset,
    );
  }
}