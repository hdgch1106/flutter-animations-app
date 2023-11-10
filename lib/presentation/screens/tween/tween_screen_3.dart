import 'package:flutter/material.dart';

class TweenScreen3 extends StatefulWidget {
  final String title;
  const TweenScreen3({super.key, required this.title});

  @override
  State<TweenScreen3> createState() => _TweenScreen3State();
}

class _TweenScreen3State extends State<TweenScreen3> {
  int _counter = 0;
  int? _oldCounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          key: Key(_counter.toString()),
          duration: const Duration(milliseconds: 700),
          builder: (context, value, child) {
            return Stack(
              children: [
                if (_oldCounter != null)
                  Opacity(
                    opacity: 1.0 - value,
                    child: Transform.translate(
                      offset: Offset(50 * (value), 0.0),
                      child: Text(
                        _oldCounter.toString(),
                        style: const TextStyle(fontSize: 80),
                      ),
                    ),
                  ),
                Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(-50 * (1 - value), 0.0),
                    child: Text(
                      _counter.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _oldCounter = _counter;
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}
