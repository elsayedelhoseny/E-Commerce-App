import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int index;
  const DotIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 4,
      position: index,
      decorator: DotsDecorator(
        activeColor: Colors.grey,
        size: const Size.square(10.0),
        activeSize: const Size(40.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
