import 'package:flutter/material.dart';

class ArticelContent extends StatelessWidget {
  const ArticelContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Image(image: AssetImage('assets/content-1.png'), fit: BoxFit.fill),
        Image(image: AssetImage('assets/content-2.png'), fit: BoxFit.fill),
        Image(image: AssetImage('assets/content-3.png'), fit: BoxFit.fill),
        Image(image: AssetImage('assets/content-4.png'), fit: BoxFit.fill),
        Image(image: AssetImage('assets/content-5.jpg'), fit: BoxFit.fill),
        Image(image: AssetImage('assets/content-6.jpg'), fit: BoxFit.fill),
      ],
    );
  }
}