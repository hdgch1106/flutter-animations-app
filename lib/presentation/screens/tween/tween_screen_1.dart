import 'package:flutter/material.dart';

class TweenScreen1 extends StatelessWidget {
  final String title;
  const TweenScreen1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: Colors.green, end: Colors.blue),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Container(
              height: 250,
              width: 250,
              color: value,
            );
          },
        ),
      ),
    );
  }
}
