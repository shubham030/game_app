import 'package:flutter/material.dart';
import 'package:gogame_animation/splash_page.dart';

void main() => runApp(GoGameApp());

class GoGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
