// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
void Function()? onTap ;
 final double? width;
  CustomButton( {super.key,
  required this.color,
  required this.text,
  required this.textColor,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width:width ?? 326.w  ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: color,
        ),
        child: Center(
          child: Text(text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: textColor
          ),
          ),
        ),
      ),
    );
  }
}