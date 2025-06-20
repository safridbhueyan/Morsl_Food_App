// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';

class Customcontainer extends StatelessWidget {
  final String pic;
  final String text;
   void Function()? onTap;
   Customcontainer({super.key,
  
  required this.pic,
  required this.text,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
        final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 382.w,
        height: 64.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),
        color: Color(0xffffffff)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SvgPicture.asset(pic, height: 40.h, width: 40.w),
              SizedBox(width: 8.w),
              Text(text,
              style: style.bodyLarge!.copyWith(
                color: Color(0xff151916)
              ),
              ),
              SizedBox(width: 8.w),
              Spacer(),
              SvgPicture.asset(AppIcons.arrow),
            ],
          ),
        ),
      ),
    );
  }
}
