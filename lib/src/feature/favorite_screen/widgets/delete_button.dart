import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/delete_bottomSheet.dart';

class DeleteButton extends StatelessWidget {
  VoidCallback onTap;
   DeleteButton({super.key,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCustomSheet(context, onTap);
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Color(0xffffffff)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AppIcons.trash),
        ),
      
      ),
    );
  }
}