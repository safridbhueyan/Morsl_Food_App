import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyCard extends StatelessWidget {
  const PolicyCard({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text('Privacy Policy', style: textTheme.bodyLarge),
        SizedBox(height: 5.h,),
        Text(
          'At TrueNote, we respect your privacy and are committed to protecting your personal information. This privacy policy outlines the types of personal data we collect and how we use, store, and protect it.',
          style: textTheme.labelLarge!.copyWith(
            color: Color(0xff777980)
          ),
        ),
      ],
    );
  }
}