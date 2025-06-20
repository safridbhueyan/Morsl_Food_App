import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_scheme.dart';

class RecipeCard extends StatelessWidget {
  final String image;
  final String title;
  const RecipeCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          Container(
            height: 674.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Container(
            height: 54.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColorScheme.secondaryColor.withAlpha(150),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(48.r),
                bottomRight: Radius.circular(48.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(48.r),
                bottomRight: Radius.circular(48.r),
              ),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    title,
                    style: textTheme.titleSmall!.copyWith(
                      color: AppColorScheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
