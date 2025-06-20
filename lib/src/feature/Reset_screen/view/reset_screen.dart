import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/src/feature/Reset_screen/widgets/confirm_BottomSheet.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/custom_button.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF4F1EC),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Reset Swipe History",
          style: style.headlineSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Color(0xff4B4B4B),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppIcons.circle,
                height: 72.h,
                width: 72.w,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Are you sure you want to clear your",
              style: style.titleSmall!.copyWith(color: Color(0xff1D1F2C)),
            ),
            Text(
              "swipe history?",
              style: style.titleSmall!.copyWith(color: Color(0xff1D1F2C)),
            ),
            SizedBox(height: 16.h),

            Text(
              "Your favorites will not be affected*",
              style: style.bodyMedium!.copyWith(color: Color(0xff9CA4AB)),
            ),
            SizedBox(height: 32.h),
            CustomButton(
              width: double.infinity,
              color: Color(0xff9CADA6), 
              text: "Reset", 
              textColor: Color(0xffFFFFFF), 
              onTap: (){
                showConfirmSheet(context);
              }
              )
          ],
        ),
      ),
    );
  }
}
