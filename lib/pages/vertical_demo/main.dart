import './article_content.dart';
import 'package:path_demo/article_layout.dart';
import 'package:flutter/material.dart';

class VerticalDemoPage extends StatefulWidget {
  const VerticalDemoPage({Key? key, required this.title, this.author, this.mark})
      : super(key: key);

  final String title;
  final String? author;
  final String? mark;

  @override
  State<VerticalDemoPage> createState() => _VerticalDemoPageState();
}

const titleHeight = 140.0;

class _VerticalDemoPageState extends State<VerticalDemoPage> {
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
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(key: articleKey, children: [
        ArticleLayout(
          title: widget.title,
          author: widget.author,
          mark: widget.mark,
          child: ArticelContent(scrollProgress: _scrollRatio, width: (articleSize?.width ?? 375)),
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
