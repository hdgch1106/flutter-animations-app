import 'package:animations_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double scale = 4.0;

  double getHeight() {
    return 100 * scale;
  }

  double getWidth() {
    return 160 * scale;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        scale = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.bounceOut,
              onEnd: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ),
              ),
              height: getHeight(),
              width: getWidth(),
              top: MediaQuery.of(context).size.height / 2 - getHeight() / 2,
              left: MediaQuery.of(context).size.width / 2 - getWidth() / 2,
              child: Image.asset(
                "assets/images/logo-batman.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _waitForSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }
}
