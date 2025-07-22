import 'package:flutter/material.dart';
import 'package:flutter_confetti/src/utils/glue.dart';

class Painter extends CustomPainter {
  final AnimationController? animationController;
  final List<Glue> glueList;

  Painter({required this.glueList, this.animationController})
      : super(repaint: animationController);

  Duration? _lastUpdate;
  final Stopwatch _stopwatch = Stopwatch()..start();
  @override
  void paint(Canvas canvas, Size size) {

    _lastUpdate = _lastUpdate ?? Duration.zero;
    final currentTime = _stopwatch.elapsed;
    final delta = currentTime - _lastUpdate!;

    _lastUpdate = currentTime;

    for (var i = 0; i < glueList.length; i++) {
      final glue = glueList[i];
      final physics = glue.physics;

      if (!physics.finished) {

        physics.updateWithDelta(delta.inMilliseconds/1000.0);
        glue.particle.paint(physics: physics, canvas: canvas);
      }
    }
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return true;
  }
}
