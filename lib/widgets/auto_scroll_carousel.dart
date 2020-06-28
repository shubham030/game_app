import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollCarousel extends StatefulWidget {
  final List<String> images;

  const AutoScrollCarousel({Key key, this.images}) : super(key: key);
  @override
  _AutoScrollCarouselState createState() => _AutoScrollCarouselState();
}

class _AutoScrollCarouselState extends State<AutoScrollCarousel> {
  PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentPage == widget.images.length) {
        currentPage = 0;
      }
      controller.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage++;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.images.length,
            itemBuilder: (_, index) =>
                Image.asset(widget.images[index], fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
