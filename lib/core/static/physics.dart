// Flutter imports:
import 'package:flutter/material.dart';

class CustomPageScrollPhysics extends PageScrollPhysics {
  const CustomPageScrollPhysics({
    super.parent,
    this.childWidth,
  });

  final double? childWidth;

  @override
  CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      CustomPageScrollPhysics(
        childWidth: childWidth,
        parent: buildParent(ancestor),
      );

  double _getPage(ScrollMetrics position) =>
      position.pixels / (childWidth ?? position.viewportDimension);

  double _getPixels(
    ScrollMetrics position,
    double page,
  ) =>
      page * (childWidth ?? position.viewportDimension);

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
  ) {
    var page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }

    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final tolerance = this.tolerance;

    final target = _getTargetPixels(position, tolerance, velocity);

    return target == position.pixels
        ? null
        : ScrollSpringSimulation(
            spring,
            position.pixels,
            target,
            velocity,
            tolerance: tolerance,
          );
  }

  @override
  bool get allowImplicitScrolling => false;
}
