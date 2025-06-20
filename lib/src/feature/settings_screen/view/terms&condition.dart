// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/riverpod/scrool_provider.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/widget/policyCard.dart';

class PrivacyPolicy extends ConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollModel = ref.watch(scrollProvider);
    final notifier = ref.read(scrollProvider.notifier);

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        
        // automaticallyImplyLeading: true,
        title: Text('Terms & Conditions', style: textTheme.titleLarge),
        backgroundColor: Color(0xffF4F1EC),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding:  EdgeInsets.only(left:  20.w, right: 14.w, top: 20.h , bottom: 20.h),
            child: SvgPicture.asset(AppIcons.backarrow,
                     
            ),
          )),
        
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Effective Date: December 20, 2024',
                    style: textTheme.headlineMedium,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: scrollModel.scrollController,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return PolicyCard(textTheme: textTheme);
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: scrollModel.scrollBarHeight,
                          width: scrollModel.scrollBarWidth,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: scrollModel.indicatorPosition,
                                child: Container(
                                  width: scrollModel.scrollBarWidth,
                                  height: scrollModel.indicatorHeight,
                                  decoration: BoxDecoration(
                                    color: Color(0xff000000),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
