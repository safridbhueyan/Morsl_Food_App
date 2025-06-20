import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/icons.dart';
import '../../../core/constant/padding.dart';
import '../../../core/theme/theme_extension/color_scheme.dart';
import '../../../provider/food_provider.dart';
import '../../../provider/swipe_status_provider.dart';
import '../../common_widgets/common_widgets.dart';
import '../../common_widgets/src/auto_spacer.dart';
import 'bottom_sheet_content/bottom_sheet_content.dart';
import 'widgets/recipe_card.dart';
import 'widgets/show_status.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  int currentIndex = 0; // Track the current card index

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final direction = ref.watch(swipeStatusProvider);
    var foodState = ref.watch(foodProviderFamily(null));
    var foodList = foodState.foods;
    debugPrint("\nrebuilding... update foods length : ${foodList.length}\n");
    if (direction == 'love' && direction == 'left') {
      _controller.reset();
      _controller.forward();
    }
    return Scaffold(
      backgroundColor: AppColorScheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Morsl', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          GestureDetector(
            onTap: () {
              CommonWidget.openBottomSheet(
                context,
                BottomSheetContent(), // You can pass logic for category here if needed
              );
            },
            child: Container(
              height: 40.r,
              width: 40.r,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColorScheme.secondaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(AppIcons.filterIcons),
            ),
          ),
          AutoSpacer(space: 16.w),
        ],
      ),
      body: Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: Stack(
          children: [
            if (foodState.isLoading && foodList.isEmpty)
              const Center(child: CircularProgressIndicator())
            else if (foodList.length<3)
              const Center(child: Text('No Data Found'))
            else
              GestureDetector(
                onDoubleTap: () {
                  if(currentIndex<foodList.length-2){
                    final food = foodList[currentIndex];
                    ref.read(swipeStatusProvider.notifier).clear();
                    Future.delayed(const Duration(milliseconds: 200), () async {
                      ref.read(swipeStatusProvider.notifier).update('love');
                      await saveToHive(food, 'favourite');
                      ref
                          .read(foodProviderFamily(null).notifier)
                          .foodRemoveAt(currentIndex);
                      debugPrint(
                        "\nindex : $currentIndex and length : ${foodList.length}\n",
                      );
                      currentIndex = currentIndex == foodList.length - 1
                          ? 0
                          : currentIndex; // Update index after removal
                    });
                  }
                },
                child: SizedBox(
                  height: 674.h,
                  width: double.infinity,
                  child: CardSwiper(
                    isLoop: false,
                    cardsCount: foodList.length,
                    onSwipe: (_, __, ___) {
                      ref.read(swipeStatusProvider.notifier).clear();
                      return true;
                    },
                    cardBuilder: (context, index, percentX, percentY) {
                      final food = foodList[index];
                      String? direction;
                      if (percentX > 0.3) {
                        direction = "right";
                      } else if (percentX < -0.3 || percentY.abs() > 0.3) {
                        direction = "left";
                        saveToHive(food, 'delete');
                      }
                      if (direction != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref
                              .read(swipeStatusProvider.notifier)
                              .update(direction!);
                        });
                      }

                      return RecipeCard(title: food.name, image: food.image);
                    },
                  ),
                ),
              ),

            if (direction != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: direction == 'love'
                    ? SlideTransition(
                        position: _slideAnimation,
                        child: ShowStatus(
                          key: ValueKey(direction),
                          path: getSwipeIconPath(direction),
                        ),
                      )
                    : ShowStatus(
                        key: ValueKey(direction),
                        path: getSwipeIconPath(direction),
                      ),
              ),
          ],
        ),
      ),
    );
  }

  String getSwipeIconPath(String direction) {
    switch (direction) {
      case 'right':
        return 'assets/icons/new_check_mark.svg';
      case 'left':
        return 'assets/icons/cross.svg';
      case 'love':
        return 'assets/icons/love.svg';
      default:
        return '';
    }
  }
}
