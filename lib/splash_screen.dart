import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
    SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/img_bg.png',
          fit: BoxFit.cover,),
        ],
      ),
    );
  }
}