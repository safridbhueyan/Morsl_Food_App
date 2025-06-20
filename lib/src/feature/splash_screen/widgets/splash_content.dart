import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../common_widgets/src/auto_spacer.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSpacer(space: 370.h),
                Center(child: Image.asset(AppImages.logo, width: 74.w)),
                Text(
                  'Morsl',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.primaryColor,
                  ),
                ),
                AutoSpacer(space: 48.h),
                Text('Swipe. Crave. Choose', style: textTheme.titleMedium),
                AutoSpacer(space: 160.h),
                Text('V1.0'),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              AppImages.splashScreenCircle,
            ),
          ),
        ],
      ),
    );
  }
}