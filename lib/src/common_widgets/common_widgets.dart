import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/color_scheme.dart';
import 'package:morsl_app_celina0057/src/common_widgets/src/auto_spacer.dart';

class CommonWidget {
  static Future<void> openBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // Allow full height
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 16.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Radius 10
                      child: Divider(
                        color: AppColorScheme.primaryColor,
                        thickness: 5.h,
                        height: 5.h,
                      ),
                    ),
                  ),
                ),
                AutoSpacer(space: 10.h),
                child,
                AutoSpacer(space: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
