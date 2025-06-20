import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckbox({
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
            color: const Color(0xff4B4B4B),
            width: 2,
          ),
          
        ),
        child: isSelected
            ?  Icon(Icons.check, size: 16, color:  Color(0xff4B4B4B))
            : null,
      ),
    );
  }
}
