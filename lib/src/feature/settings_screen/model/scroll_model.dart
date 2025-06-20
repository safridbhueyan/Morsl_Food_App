import 'package:flutter/cupertino.dart';

class ScrollModel {
  final double scrollBarHeight;
  final double scrollBarWidth;
  final double indicatorHeight;
  final double indicatorPosition;
  final ScrollController scrollController;

  ScrollModel({
    required this.scrollBarHeight,
    required this.scrollBarWidth,
    required this.indicatorHeight,
    required this.indicatorPosition,
    required this.scrollController,
  });

  ScrollModel copyWith({
    double? scrollBarHeight,
    double? scrollBarWidth,
    double? indicatorHeight,
    double? indicatorPosition,
    ScrollController? scrollController,
  }) {
    return ScrollModel(
      scrollBarHeight: scrollBarHeight ?? this.scrollBarHeight,
      scrollBarWidth: scrollBarWidth ?? this.scrollBarWidth,
      indicatorHeight: indicatorHeight ?? this.indicatorHeight,
      indicatorPosition: indicatorPosition ?? this.indicatorPosition,
      scrollController: scrollController ?? this.scrollController,
    );
  }
}