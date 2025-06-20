import 'package:flutter_riverpod/flutter_riverpod.dart';

final swipeStatusProvider =
StateNotifierProvider<SwipeStatusNotifier, String?>((ref) {
  return SwipeStatusNotifier();
});

class SwipeStatusNotifier extends StateNotifier<String?> {
  SwipeStatusNotifier() : super(null);

  void update(String direction) {
    if (state != direction) {
      state = direction;

      Future.delayed(const Duration(seconds: 2), () {
        if (state == direction) {
          state = null;
        }
      });
    }
  }

  void clear() {
    state = null;
  }
}
