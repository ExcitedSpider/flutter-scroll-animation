import 'package:flutter/material.dart';
import 'package:path_demo/sprite/linear_sprite.dart';
import 'dart:math' as math;

const spriteSize = 240.0;

const spriteImage = Image(
  image: AssetImage('assets/sprite.png'),
  width: spriteSize,
);

class ArticelContent extends StatelessWidget {
  final double scrollProgress;
  final double width;

  const ArticelContent(
      {Key? key, required this.scrollProgress, required this.width})
      : super(key: key);

  double getAnimationProgress(double start, double end) {
    if (scrollProgress > end) {
      return 1;
    } else if (scrollProgress < start) {
      return 0;
    } else {
      return (scrollProgress - start) / (end - start);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(scrollProgress);

    return Column(
      children: [
        const Image(
            image: AssetImage('assets/article_1.JPG'), fit: BoxFit.fill),
        Stack(
          children: [
            const Image(
                image: AssetImage('assets/article_2.PNG'), fit: BoxFit.fill),
            Positioned(
                left: 0 - spriteSize,
                bottom: 0,
                child: LinearSprite(
                  from: const Offset(0, 0),
                  to: Offset(width + spriteSize, 0),
                  progress: getAnimationProgress(0.2, 0.4),
                  spriteWidget: spriteImage,
                ))
          ],
        ),
        const Image(
            image: AssetImage('assets/article_3.JPG'), fit: BoxFit.fill),
        Stack(
          children: [
            const Image(
                image: AssetImage('assets/article_4.jpg'), fit: BoxFit.fill),
            Positioned(
              child: LinearSprite(
                spriteWidget: Transform(child: spriteImage, transform: Matrix4.rotationY(math.pi),),
                to: const Offset(0, 0),
                from: Offset(width + spriteSize, 0),
                progress: getAnimationProgress(0.5, 0.7),
              ),
              top: 16,
              right: 0 - 2 * spriteSize,
            )
          ],
        ),
        const Image(
            image: AssetImage('assets/article_5.JPG'), fit: BoxFit.fill),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/landing');
          },
          child: Image.asset('assets/article_6.JPG', fit: BoxFit.cover),
        )
      ],
    );
  }
}
