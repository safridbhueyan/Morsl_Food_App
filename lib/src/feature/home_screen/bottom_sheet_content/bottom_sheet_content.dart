import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/core/constant/padding.dart';

import '../../../../core/theme/theme_extension/color_scheme.dart';
import '../widgets/mood_cravings.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TabBar with rounded background
          Container(
            padding: AppPadding.screenHorizontalPadding,
            decoration: BoxDecoration(
              color: AppColorScheme.secondaryColor,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                labelColor: AppColorScheme.secondaryColor,
                unselectedLabelColor: AppColorScheme.primaryColor,
                indicator: BoxDecoration(
                  color: AppColorScheme.buttonColor,
                  borderRadius: BorderRadius.circular(39.r),
                ),
                dividerColor: Colors.transparent,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Tab(
                      child: Text('Cravings', style: textTheme.bodyMedium),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Tab(child: Text('Mood', style: textTheme.bodyMedium)),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),
          SizedBox(
            height: 500.h,
            child: const TabBarView(
              children: [
                MoodCravings(category: 'Cravings',),
                MoodCravings(category: 'Mood',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

