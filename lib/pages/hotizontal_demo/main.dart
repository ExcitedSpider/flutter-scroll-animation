import 'package:path_demo/article_layout.dart';
import 'package:flutter/material.dart';

class HorizontalDemoPage extends StatefulWidget {
  const HorizontalDemoPage(
      {Key? key, required this.title, this.author, this.mark})
      : super(key: key);

  final String title;
  final String? author;
  final String? mark;

  @override
  State<HorizontalDemoPage> createState() => _HorizontalDemoPageState();
}

class _HorizontalDemoPageState extends State<HorizontalDemoPage> {
  double _scrollRatio = 0;
  GlobalKey articleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final articleContext = articleKey.currentContext;

    Size? articleSize;
    if (articleContext != null) {
      final box = articleContext.findRenderObject() as RenderBox;
      articleSize = box.size;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 36,
      ),
      body: Stack(key: articleKey, children: [
        ArticleLayout(
          title: widget.title,
          author: widget.author,
          mark: widget.mark,
          child: Text('你好'),
          onScroll: (double ratio, {ScrollNotification? notification}) {
            setState(() {
              _scrollRatio = ratio;
            });
            return;
          },
        ),
      ]),
    );
  }
}
