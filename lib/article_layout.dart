import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/color.dart';

typedef ScrollListener = void Function(double ratio,
    {ScrollNotification? notification});

class ArticleLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final String? author;
  final String? mark;
  final ScrollListener? onScroll;

  const ArticleLayout(
      {Key? key,
      required this.child,
      required this.title,
      this.author,
      this.mark,
      this.onScroll})
      : super(key: key);

  handleScroll(ScrollNotification event) {
    if (onScroll != null) {
      onScroll!(event.metrics.pixels / event.metrics.maxScrollExtent,
          notification: event);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
              child: NotificationListener(
            onNotification: (notification) {
              if (notification.runtimeType == ScrollUpdateNotification) {
                handleScroll(notification as ScrollUpdateNotification);
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                  ),
                  MarkRow(author: author, mark: mark),
                  child,
                ],
              ),
            ),
          )),
        ],
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}

class MpHeading extends StatelessWidget {
  const MpHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SvgPicture.asset('assets/cancel.svg', width: 28, height: 28),
          SvgPicture.asset('assets/more-horiz.svg', width: 28, height: 28),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      margin: const EdgeInsets.only(bottom: 16),
    );
  }
}

class MarkRow extends StatelessWidget {
  final String? author;
  final String? mark;

  const MarkRow({Key? key, this.author, this.mark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            child: Text(
              author ?? '',
              style: TextStyle(color: HexColor('#5A709A')),
            ),
            margin: const EdgeInsets.only(right: 8),
          ),
          Text(
            mark ?? '',
            style: TextStyle(color: HexColor('#AEACAF')),
          )
        ],
      ),
    );
  }
}
