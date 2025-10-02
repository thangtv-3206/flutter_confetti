import 'dart:math';
import 'dart:ui';

import 'package:flutter_confetti/src/confetti_particle.dart';
import 'package:flutter_confetti/src/confetti_physics.dart';

class Quadrangle extends ConfettiParticle {
  Quadrangle();

  static final _random = Random();

  final double distortionX = 1.0 + _random.nextDouble() * 3.0;
  final double distortionY = 1.0 + _random.nextDouble() * 3.0;

  double get _r => _random.nextDouble() * 2 - 1;

  late final dx1 = _r * distortionX;
  late final dy1 = _r * distortionY;
  late final dx2 = _r * distortionX;
  late final dy2 = _r * distortionY;
  late final dx3 = _r * distortionX;
  late final dy3 = _r * distortionY;
  late final dx4 = _r * distortionX;
  late final dy4 = _r * distortionY;

  @override
  void paint({required Canvas canvas, required ConfettiPhysics physics}) {
    final p0 = Offset(physics.x + dx1, physics.y + dy1);
    final p1 = Offset(physics.wobbleX + dx3, physics.y1 + dy3);
    final p2 = Offset(physics.x2 + dx2, physics.y2 + dy2);
    final p3 = Offset(physics.x1 + dx4, physics.wobbleY + dy4);

    final pts = [p0, p1, p2, p3];
    const t = 0.3;
    const f = t / 6.0;

    final path = Path()..moveTo(p0.dx, p0.dy);
    for (var i = 0; i < 4; i++) {
      final a = pts[i];
      final b = pts[(i + 1) & 3];
      final prev = pts[(i - 1) & 3];
      final next2 = pts[(i + 2) & 3];
      final c1 = a + (b - prev) * f;
      final c2 = b - (next2 - a) * f;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, b.dx, b.dy);
    }
    path.close();

    canvas
      ..save()
      ..drawPath(
        path,
        Paint()
          ..style = PaintingStyle.fill
          ..color =
              physics.color.colors.first.withValues(alpha: 1 - physics.progress)
          ..shader = physics.color.createShader(path.getBounds()),
      )
      ..restore();
  }
}
