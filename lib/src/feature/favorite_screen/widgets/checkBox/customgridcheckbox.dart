import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomGridCheckbox({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: const Color(0xffFFFFFF),
            width: 2,
          ),
                      color: isSelected? const Color(0xffFFFFFF) : Colors.transparent,

        ),
        child: 
             Icon(Icons.check, size: 16, color: isSelected ? Color(0xff000000) : Color(0xffffffff) )
            
      ),
    );
  }
}