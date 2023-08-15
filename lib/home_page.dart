import 'package:flutter/material.dart';
import 'package:loader_animation/extensions.dart';
import 'package:loader_animation/circle_animation.dart';
import 'package:loader_animation/line_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double squareSide = 120;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Loader Animation - 1
            Center(
              child: SizedBox(
                width: squareSide,
                height: squareSide,
                child: Stack(
                  children: squareSide
                      .pathsList()
                      .map(
                        (element) => CircleAnimation(
                          path: element,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            /// Loader Animation - 2
            Center(
              child: SizedBox(
                width: double.infinity,
                height: squareSide,
                child: Stack(
                  children: squareSide
                      .linePath(context)
                      .map(
                        (element) => LineAnimation(
                          path: element,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
