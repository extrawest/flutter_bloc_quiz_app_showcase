import 'dart:ui';

import 'package:flutter/material.dart';

import '../../features/theme/theme_info.dart';

class AnimatedPathPainter extends CustomPainter {
  final Animation<double>? _animation;
  final double? radius;
  final Size? size;
  final Color color;

  AnimatedPathPainter(this._animation, {this.size, this.radius, this.color = white})
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0 + radius!, 0)
      ..lineTo(size.width - radius!, 0)
      ..arcToPoint(Offset(size.width, radius!),
          largeArc: false, radius: Radius.circular(radius!), clockwise: true)
      ..moveTo(size.width, 0 + radius!)
      ..lineTo(size.width, size.height - radius!)
      ..arcToPoint(Offset(size.width - radius!, size.height),
          largeArc: false, radius: Radius.circular(radius!), rotation: 90, clockwise: true)
      ..moveTo(size.width - radius!, size.height)
      ..lineTo(0 + radius!, size.height)
      ..arcToPoint(Offset(0, size.height - radius!),
          largeArc: false, radius: Radius.circular(radius!), rotation: 90, clockwise: true)
      ..moveTo(0, size.height - radius!)
      ..lineTo(0, 0 + radius!)
      ..arcToPoint(Offset(radius!, 0),
          largeArc: false, radius: Radius.circular(radius!), clockwise: true);
  }

  Path createAnimatedPath(
      Path originalPath,
      double animationPercent,
      ) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
      Path originalPath,
      double length,
      ) {
    var currentLength = 0.0;

    final path = Path();

    final metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;

      final nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation!.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
