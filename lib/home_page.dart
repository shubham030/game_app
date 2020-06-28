import 'package:flutter/material.dart';
import 'package:gogame_animation/home_screen_content.dart';
import 'package:gogame_animation/utils/strings.dart';
import 'package:gogame_animation/widgets/drawer_buttons.dart';
import 'package:gogame_animation/widgets/two_color_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController drawerController;
  AnimationController carouselController;

  bool isDrawerOpen = false;

  @override
  void initState() {
    drawerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    carouselController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    drawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: drawerController,
            color: Colors.black,
          ),
          onPressed: () {
            if (isDrawerOpen) {
              drawerController.reverse();
              isDrawerOpen = false;
            } else {
              drawerController.forward();
              isDrawerOpen = true;
            }
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Hero(
          tag: "title",
          child: TwoColorText(
            text: title,
            fontSize: 26,
          ),
        ),
      ),
      body: Stack(
        children: [
          HomeScreenContent(),
          AnimatedBuilder(
            animation: drawerController,
            builder: (context, child) => Container(
              width: 250,
              height: size.height * drawerController.value,
              color: Colors.black,
              child: drawerController.value > 0.5 ? child : Container(),
            ),
            child: DrawerButtons(
              onChanged: (int index) => print(index),
            ),
          ),
        ],
      ),
    );
  }
}
