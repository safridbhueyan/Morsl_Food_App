import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/data/dummy_data/card_data.dart';
import 'package:morsl_app_celina0057/provider/swipe_status_provider.dart';

class RecipeCardStack extends ConsumerWidget {
  const RecipeCardStack({super.key, required this.onSwipe});

  final void Function(String direction) onSwipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onDoubleTap: () {
        ref.read(swipeStatusProvider.notifier).clear();
        Future.delayed(const Duration(milliseconds: 10), () {
          onSwipe('love');
        });
      },
      child: SizedBox(
        height: 674,
        width: double.infinity,
        child: CardSwiper(
          isLoop: true,
          cardsCount: cardData.length,
          onSwipe: (_, __, ___) {
            ref.read(swipeStatusProvider.notifier).clear();
            return true;
          },
          cardBuilder: (context, index, percentX, percentY) {
            String? direction;
            if (percentX > 0.3) {
              direction = "right";
            } else if (percentX < -0.3 || percentY.abs() > 0.3) {
              direction = "left";
            }

            if (direction != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onSwipe(direction!);
              });
            }

            return cardData[index];
          },
        ),
      ),
    );
  }
}
