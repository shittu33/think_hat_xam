import 'package:flutter/material.dart';
import 'dart:math' as math;
class SnapScrollPhysics1 extends ScrollPhysics {
  final double itemHeight;

  const SnapScrollPhysics1({required this.itemHeight, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  SnapScrollPhysics1 applyTo(ScrollPhysics? ancestor) {
    return SnapScrollPhysics1(itemHeight: itemHeight, parent: buildParent(ancestor)!);
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final double itemPixels = itemHeight * 0.8;

    if (velocity.abs() < tolerance.velocity) return null;

    if (velocity > 0.0) {
      final double targetPixels =
      (position.pixels + itemPixels).ceilToDouble();
      return ScrollSpringSimulation(spring, position.pixels,
          targetPixels, velocity, tolerance: tolerance);
    } else {
      final double targetPixels =
      (position.pixels - itemPixels).floorToDouble();
      return ScrollSpringSimulation(spring, position.pixels,
          targetPixels, velocity, tolerance: tolerance);
    }
  }
}

class CustomScrollPhysics extends ClampingScrollPhysics {
  final double itemHeight;

  const CustomScrollPhysics({required this.itemHeight, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(itemHeight: itemHeight, parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position,
      double velocity,
      ) {
    final double itemPixels = itemHeight;
    final int itemIndex = (position.pixels / itemHeight).round();
    final double itemScrollOffset = itemIndex * itemHeight;

    if (velocity.abs() < tolerance.velocity) return null;

    if (velocity > 0.0) {
      final double targetPixels = itemScrollOffset + itemPixels;
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        targetPixels,
        velocity,
        tolerance: tolerance,
      );
    } else {
      final double targetPixels = itemScrollOffset - itemPixels;
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        targetPixels,
        velocity,
        tolerance: tolerance,
      );
    }
  }

  @override
  double get minFlingDistance => itemHeight * 0.8;

  @override
  double get maxFlingVelocity => double.infinity;
}

class MySnapScrollPhysics extends PageScrollPhysics {
  const MySnapScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  MySnapScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MySnapScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final tolerance = this.tolerance;
    if ((velocity.abs() > tolerance.velocity) &&
        (velocity.sign == position.extentInside.sign)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final double pixelsPerSecond = velocity * 1000.0;
    if (pixelsPerSecond.abs() < tolerance.velocity) {
      return super.createBallisticSimulation(position, velocity);
    }
    return ScrollSpringSimulation(
      spring,
      position.pixels,
      position.maxScrollExtent,
      math.min(0.0, velocity),
      tolerance: tolerance,
    );
  }
}
