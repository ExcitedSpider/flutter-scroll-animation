import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("乐高 DC 蝙蝠侠战车...", style: TextStyle(color: Colors.black),),
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.black)),
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 36,
      ),
      body: Image.asset(
        'assets/landing.png',
        fit: BoxFit.contain,
      )
    );
  }
}
