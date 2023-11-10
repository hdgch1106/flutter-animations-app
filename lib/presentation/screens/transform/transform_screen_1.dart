import 'dart:math';

import 'package:flutter/material.dart';

class TransformScreen1 extends StatefulWidget {
  final String title;
  const TransformScreen1({super.key, required this.title});

  @override
  State<TransformScreen1> createState() => _TransformScreen1State();
}

class _TransformScreen1State extends State<TransformScreen1> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 15),
            Transform(
              //angle: _value,
              //offset: Offset(_value * -30, _value * 30),
              //scale: _value * 2.0,
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi * _value),

              //..scale(_value * 2.0),
              child: Image.asset(
                "assets/images/milkonight.jpg",
                height: 150,
              ),
            ),
            Slider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            Text("Value: ${_value.toStringAsFixed(1)}")
          ],
        ),
      ),
    );
  }
}
