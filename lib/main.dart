import 'package:flutter/material.dart';
import './pages/vertical_demo/main.dart';

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
      home: MyHomePage(
        title: data['title']!,
        author: data['author'] ?? '',
        mark: data['mark'] ?? '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.author, this.mark})
      : super(key: key);

  final String title;
  final String? author;
  final String? mark;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey articleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: VerticalDemoPage(title: widget.title, author: widget.author, mark: widget.mark),
    );
  }
}
