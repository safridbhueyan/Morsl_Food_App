import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/data/routes/route_const.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/widget/customContainer.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/widget/feedback_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF4F1EC),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Settings",
          style: style.headlineSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Color(0xff4B4B4B),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(child: SvgPicture.asset(AppIcons.logo)),
            SizedBox(height: 8.h),
            Text(
              "V1.0",
              style: style.bodyLarge!.copyWith(
                color: Color(0xff1D1F2C),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 48.h),
            Customcontainer(
              pic: AppIcons.term,
              text: 'Terms & Conditions',
              onTap: () {
                context.push(RouteName.policyScreen);
              },
            ),
            SizedBox(height: 8.h),

            Customcontainer(
              pic: AppIcons.bell,
              text: 'Feedback',
              onTap: () {
                feedbackSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
