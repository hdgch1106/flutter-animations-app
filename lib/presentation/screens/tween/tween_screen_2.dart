import 'package:flutter/material.dart';

class TweenScreen2 extends StatelessWidget {
  final String title;
  const TweenScreen2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: const Duration(seconds: 1),
                child: const Text("MilkoNight"),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, -200 * value),
                    child: child!,
                  );
                },
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.decelerate,
                duration: const Duration(seconds: 1),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/milkonight.jpg"),
                  radius: 40,
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(200 * value, 0.0),
                    child: child!,
                  );
                },
              ),
              const SizedBox(height: 15),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 1),
                child: const Text(
                  "Fugiat sint consectetur ex veniam consequat voluptate labore consequat. Eu eu culpa ad fugiat deserunt aute duis laborum aute sunt in esse minim. Aute elit aliqua ut est commodo eiusmod Lorem in dolore. Elit in ullamco sint magna dolore et elit. Exercitation Lorem officia sit ad adipisicing qui. Minim reprehenderit magna laborum commodo sit do fugiat duis nisi adipisicing aliquip nisi commodo. Aute amet eiusmod duis cillum ut sunt anim quis aute deserunt reprehenderit ea.",
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, 300 * value),
                    child: child!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
