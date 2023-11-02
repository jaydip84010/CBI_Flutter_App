import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimation extends StatelessWidget {
  final Widget child;
  final int seconds;
  final double horizontalOffset;
  final double verticalOffset;
  final  int position;

  const CustomAnimation({
    Key? key,
    required this.child,
    required this.seconds,
    this.horizontalOffset = 0,
    this.verticalOffset = 0,
    this.position =10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: position,
        duration: Duration(milliseconds: seconds),
        child: SlideAnimation(
          verticalOffset: verticalOffset,
          horizontalOffset: horizontalOffset,
          child: FadeInAnimation(
            child: child,
          ),
        ),
      ),
    );
  }
}
