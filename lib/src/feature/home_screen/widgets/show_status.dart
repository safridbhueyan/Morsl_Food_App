import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowStatus extends StatelessWidget {
  final String path;

  const ShowStatus({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        final curved = animation.drive(
          CurveTween(curve: const _SafeCurve(Curves.easeOutBack)),
        );

        return ScaleTransition(
          scale: curved,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: SvgPicture.asset(
        path,
        key: const ValueKey('svg'),
        height: 115.h,
        width: 115.w,
      ),
    );
  }
}

class _SafeCurve extends Curve {
  final Curve baseCurve;
  const _SafeCurve(this.baseCurve);

  @override
  double transform(double t) {
    final clampedT = t.clamp(0.0, 1.0);
    final transformed = baseCurve.transform(clampedT);
    return transformed.clamp(0.0, 1.0);
  }
}
