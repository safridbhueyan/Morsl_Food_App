
// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xff019877);
    final unselectedColor = Colors.grey[400];

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: Container(
        color: const Color(0xFFFFFFFF),
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 0 ? AppIcons.homeC : AppIcons.home,
                   height: 32.h,
                width: 32.w,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 1 ? AppIcons.heartC : AppIcons.heart,
                   height: 32.h,
                width: 32.w,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 2 ? AppIcons.redoC : AppIcons.redo,
                height: 36.h,
                width: 36.w,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  currentIndex == 3 ? AppIcons.settingsC : AppIcons.settings,
                   height: 32.h,
                width: 32.w,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
