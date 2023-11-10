import 'package:animations_app/config/const/names_titles.dart';
import 'package:animations_app/presentation/screens/transform/transform_screen_1.dart';
import 'package:animations_app/presentation/screens/transform/transform_screen_2.dart';
import 'package:animations_app/presentation/screens/tween/tween_screen_1.dart';
import 'package:animations_app/presentation/screens/second_screen.dart';
import 'package:animations_app/presentation/screens/tween/tween_screen_2.dart';
import 'package:animations_app/presentation/screens/tween/tween_screen_3.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: _Buttons(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.code,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, animation, __) {
                return FadeTransition(
                  opacity: animation,
                  child: const SecondScreen(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const TweenScreen1(title: NamesTitles.tween1),
              ));
            },
            child: const Text(NamesTitles.tween1),
          ),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const TweenScreen2(title: NamesTitles.tween2),
              ));
            },
            child: const Text(NamesTitles.tween2),
          ),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const TweenScreen3(title: NamesTitles.tween3),
              ));
            },
            child: const Text(NamesTitles.tween3),
          ),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    const TransformScreen1(title: NamesTitles.transform1),
              ));
            },
            child: const Text(NamesTitles.transform1),
          ),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    const TransformScreen2(title: NamesTitles.transform2),
              ));
            },
            child: const Text(NamesTitles.transform2),
          ),
        ),
      ],
    );
  }
}
