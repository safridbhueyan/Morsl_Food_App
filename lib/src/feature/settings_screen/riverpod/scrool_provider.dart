import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/model/scroll_model.dart';


final scrollProvider = StateNotifierProvider<ScrollNotifier, ScrollModel>((
  ref,
) {
  return ScrollNotifier();
});

class ScrollNotifier extends StateNotifier<ScrollModel> {
  ScrollNotifier()
    : super(
        ScrollModel(
          scrollBarHeight: 600.h,
          scrollBarWidth: 4.w,
          indicatorHeight: 100.h,
          indicatorPosition: 0,
          scrollController: ScrollController(),
        ),
      ) {
    state.scrollController.addListener(_updatePosition);
  }

  void _updatePosition() {
    final maxScroll = state.scrollController.position.maxScrollExtent;
    final currentScroll = state.scrollController.offset;
    final scrollPercent = (currentScroll / (maxScroll == 0 ? 1 : maxScroll))
        .clamp(0.0, 1.0);
    final indicatorPosition = scrollPercent*(state.scrollBarHeight - state.indicatorHeight);

    state = state.copyWith(indicatorPosition: indicatorPosition);
  }

  @override
  void dispose() {
    state.scrollController.removeListener(_updatePosition);
    state.scrollController.dispose();
    super.dispose();
  }
}