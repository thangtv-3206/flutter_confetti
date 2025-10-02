import 'package:flutter/painting.dart';

const List<Gradient> defaultColors = [redColor, sliverColor, goldColor];

const redColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFEF3945),
    Color(0xFFE65C64),
    Color(0xFFAC333B),
    Color(0xFF582024)
  ],
  stops: [0, 0.22, 0.66, 1.0],
);

const sliverColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFD5D3CC),
    Color(0xFF848172),
    Color(0xFFFFFFFF),
    Color(0xFF3E3E3E),
    Color(0xFFE5E5E5)
  ],
);

const goldColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFFEAC3),
    Color(0xFF9F8325),
    Color(0xFFF7D237),
    Color(0xFFFFFFFF),
    Color(0xFFD8BC21)
  ],
  stops: [0, 0.2, 0.51, 0.78, 1.0],
);

class ConfettiOptions {
  /// The number of confetti to launch.
  final int particleCount;

  /// The angle in which to launch the confetti, in degrees. 90 is straight up.
  final double angle;

  /// How far off center the confetti can go, in degrees.
  /// 45 means the confetti will launch at the defined angle plus or minus 22.5 degrees.
  final double spread;

  /// How fast the confetti will start going, in pixels.
  final double startVelocity;

  /// How quickly the confetti will lose speed.
  /// Keep this number between 0 and 1, otherwise the confetti will gain speed.
  /// Better yet, just never change it.
  final double decay;

  /// How quickly the particles are pulled down.
  /// 1 is full gravity, 0.5 is half gravity, etc.,
  /// but there are no limits. You can even make particles go up if you'd like.
  final double gravity;

  ///  Optionally turns off the tilt and wobble that three dimensional confetti
  /// would have in the real world.
  final bool flat;

  /// How many times the confetti will move.
  final int ticks;

  /// The x position on the page,
  /// with 0 being the left edge and 1 being the right edge.
  final double x;

  /// The y position on the page,
  /// with 0 being the top edge and 1 being the bottom edge.
  final double y;

  /// An array of color strings.
  final List<Gradient> colors;

  /// Scale factor for each confetti particle.
  /// Use decimals to make the confetti smaller.
  final double scalar;

  const ConfettiOptions(
      {this.colors = defaultColors,
      this.particleCount = 50,
      this.angle = 90,
      this.spread = 45,
      this.startVelocity = 45,
      this.decay = 0.9,
      this.gravity = 1,
      this.flat = false,
      this.scalar = 1,
      this.x = 0.5,
      this.y = 0.5,
      this.ticks = 200})
      : assert(decay >= 0 && decay <= 1),
        assert(ticks > 0);

  /// Create a copy of this object with the given fields replaced with new values.
  ConfettiOptions copyWith({
    int? particleCount,
    double? angle,
    double? spread,
    double? startVelocity,
    double? decay,
    double? gravity,
    double? drift,
    bool? flat,
    double? scalar,
    double? x,
    double? y,
    int? ticks,
    List<Gradient>? colors,
  }) {
    return ConfettiOptions(
      particleCount: particleCount ?? this.particleCount,
      angle: angle ?? this.angle,
      spread: spread ?? this.spread,
      startVelocity: startVelocity ?? this.startVelocity,
      decay: decay ?? this.decay,
      gravity: gravity ?? this.gravity,
      flat: flat ?? this.flat,
      scalar: scalar ?? this.scalar,
      x: x ?? this.x,
      y: y ?? this.y,
      ticks: ticks ?? this.ticks,
      colors: colors ?? this.colors,
    );
  }
}
