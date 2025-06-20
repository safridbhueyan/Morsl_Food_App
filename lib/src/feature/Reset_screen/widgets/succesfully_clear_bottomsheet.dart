import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/custom_button.dart';

void showsuccesConfirmSheet(BuildContext context,  String text) {
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
                      AppIcons.greenCircle,
                      height: 54.h,
                      width: 54.w,
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      text,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                 

                  
                    SizedBox(height: 16.h),
                    CustomButton(
                      color: Color(0xff9CADA6),
                      text: "Continue",
                      textColor: Color(0xff4A4C56),
                      onTap: () {
                        Navigator.pop(context);
                      },
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
