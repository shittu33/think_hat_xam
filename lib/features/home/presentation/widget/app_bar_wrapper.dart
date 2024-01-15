import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/theme.dart';

class AppBarWrapper extends StatelessWidget {
  const AppBarWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(seconds: 1),
        child: SlideAnimation(
            verticalOffset: -50.0,
            child: FadeInAnimation(
                child: Container(
              child: child,
            ))));
  }
}
