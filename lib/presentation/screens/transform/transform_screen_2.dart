import 'dart:math';

import 'package:flutter/material.dart';

class TransformScreen2 extends StatefulWidget {
  final String title;
  const TransformScreen2({super.key, required this.title});

  @override
  State<TransformScreen2> createState() => _TransformScreen2State();
}

class _TransformScreen2State extends State<TransformScreen2> {
  final List<String> _images = [
    "assets/images/paisaje1.jpg",
    "assets/images/paisaje2.jpg",
    "assets/images/paisaje3.jpg",
    "assets/images/paisaje4.jpg",
  ];

  final _pageController = PageController();
  double? _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              double percent = 0.0;
              double value = 0.0;
              if (_currentPage != null) {
                percent = (_currentPage! - index);
                value = percent.clamp(0.0, 1.0);
                print(percent);
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Opacity(
                  opacity: 1 - value,
                  child: Transform(
                    //scale: value * 1.5,
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(pi * value),
                    child: Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
