import 'dart:ui';

import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({
    super.key,
    required this.path,
  });

  final Path path;

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  final double widgetSize = 16;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(
        () => setState(() {}),
      );
    _controller.forward();
    _controller.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Offset? offset = calculate(_animation.value);

    if (offset == null) return const SizedBox.shrink();

    return Positioned(
      top: offset.dy - widgetSize / 2,
      left: offset.dx - widgetSize / 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        width: widgetSize,
        height: widgetSize,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Offset? calculate(value) {
    PathMetrics pathMetrics = widget.path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos?.position;
  }
}
