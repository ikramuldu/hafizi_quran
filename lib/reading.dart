import 'package:flutter/material.dart';
import 'constants.dart' as Constants;

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  String title = "null";

  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView.builder(itemBuilder: (BuildContext context, int i) {
            return TextButton(
              style: TextButton.styleFrom(
                  backgroundColor:
                      i.isEven ? Colors.transparent : const Color(0xfff0f5f0),
                  foregroundColor: Colors.black),
              onPressed: () {
                pageController.jumpToPage(i);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Text(
                  "page-$i",
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.2,
                  maxLines: 2,
                ),
              ),
            );
          }),
        ),
        appBar: AppBar(
          title: Text(title),
        ),
        body: PageView.builder(
          reverse: false,
          itemCount: Constants.pageCount,
          controller: pageController,
          onPageChanged: onPageChange,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              "assets/pages/q${index + 1}",
            );
          },
        ));
  }

  void onPageChange(int page) {
    setState(() {
      if (page == 0) {
        title = "Cover Page";
      } else {
        title = "Page${page + 1}";
      }
    });
  }
}
