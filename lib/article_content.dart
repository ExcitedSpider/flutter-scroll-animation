import 'package:flutter/material.dart';
import 'package:path_demo/sprite/linear_sprite.dart';

const moveStart = 0.3;
const moveEnd = 0.4;
const spriteSize = 72.0;

class ArticelContent extends StatelessWidget {
  final double scrollProgress;
  final double width;

  const ArticelContent({Key? key, required this.scrollProgress, required this.width}) : super(key: key);

  double get animationProgress {
    if (scrollProgress > moveEnd) {
      return 1;
    } else if (scrollProgress < moveStart) {
      return 0;
    } else {
      return (scrollProgress - moveStart) / (moveEnd - moveStart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
            image: AssetImage('assets/article_1.JPG'), fit: BoxFit.fill),
        Stack(
          children: [
            const Image(
                image: AssetImage('assets/article_2.JPG'), fit: BoxFit.fill),
            Positioned(
                left: 0 - spriteSize,
                bottom: 0,
                child: LinearSprite(
                  from: const Offset(0, 0),
                  to: Offset(width + spriteSize, 0),
                  progress: animationProgress,
                  spriteWidget: const Image(
                    image: AssetImage('assets/sprit.png'),
                    height: spriteSize,
                    width: spriteSize,
                  ),
                ))
          ],
        ),
        const Image(
            image: AssetImage('assets/article_3.JPG'), fit: BoxFit.fill),
        const Image(
            image: AssetImage('assets/article_4.JPG'), fit: BoxFit.fill),
        const Image(
            image: AssetImage('assets/article_5.JPG'), fit: BoxFit.fill),
      ],
    );
  }
}
