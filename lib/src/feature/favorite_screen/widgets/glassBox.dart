// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Glassbox extends StatelessWidget {
  final String text;
  const Glassbox({super.key,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(28.r),
      child: SizedBox(
        width: 340.w,
        height: 56.h,
        child: Stack(
        children: [
        //blurr effect
          BackdropFilter(filter:ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5 ,
          )),
      
          //gradient effect
       Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.4),
          ]
        )
      ),
    ),
      
          //child
      Center(
        child: Text(text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w400,
          color: Color(0xFFFFFFFF),
        ),
        ),
      ),
        ],
        ),
      ),
    );
  }
}