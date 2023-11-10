import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.bounceOut,
            duration: const Duration(seconds: 1),
            child: const Column(
              children: [
                Text(
                  "SecondPage",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Sit esse officia fugiat ipsum sit. Aute pariatur reprehenderit consequat mollit ex quis. Exercitation non fugiat culpa deserunt minim eu dolor non. Incididunt proident dolore tempor velit commodo laborum voluptate. Lorem quis pariatur ad aliquip.",
                ),
              ],
            ),
            builder: (context, value, child) {
              return Transform(
                transform: Matrix4.identity()..translate(0.0, -200 * value),
                alignment: Alignment.center,
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}
