import 'package:flutter/material.dart';
import './pages/vertical_demo/main.dart';
import './pages/hotizontal_demo/main.dart';

void main() {
  runApp(const MyApp());
}

var data = const {'title': '蝙蝠战车出动！', 'author': 'LEGO乐高', 'mark': '一周之前'};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => VerticalDemoPage(
              title: data['title']!,
              author: data['author'] ?? '',
              mark: data['mark'] ?? '',
            ),
        '/horizontal': (context) => HorizontalDemoPage(
              title: data['title']!,
              author: data['author'] ?? '',
              mark: data['mark'] ?? '',
            ),
      },
    );
  }
}
