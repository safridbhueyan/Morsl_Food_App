import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/data/services/hive_box_services.dart';
import 'package:morsl_app_celina0057/src/feature/Reset_screen/widgets/succesfully_clear_bottomsheet.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/custom_button.dart';

void showConfirmSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 20.h),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),

          child: IntrinsicHeight(
            child: ClipPath(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                    bottom: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 5.w,
                        width: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xff171717),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    SvgPicture.asset(
                      AppIcons.circle,
                      height: 54.h,
                      width: 54.w,
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      "Are You Sure?",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xff131313),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      "Do you want to clear your swipe history?",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xff9CA4AB),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            color: Color(0xffD7CCC8),
                            text: "Cancel",
                            textColor: Color(0xff4A4C56),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 12.h),
                        Expanded(
                          child: CustomButton(
                            color: Color(0xff9CADA6),
                            text: "Continue",
                            textColor: Color(0xffFFFFFF),
                            onTap: () {
                              Navigator.pop(context);
                              HiveServices.clearAllData(boxName: 'normal');
                              HiveServices.clearAllData(boxName: 'favourite');
                              HiveServices.clearAllData(boxName: 'delete');
                              showsuccesConfirmSheet(
                                context,
                                "Swipe history cleared.",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
