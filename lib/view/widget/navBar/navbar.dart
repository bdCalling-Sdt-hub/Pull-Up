import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_route.dart';
import '../../../utils/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.white50),
    const Icon(Icons.notifications, color: AppColors.white50),
    const Icon(Icons.add, color: AppColors.white50),
    const Icon(Icons.settings, color: AppColors.white50),
    const Icon(Icons.person, color: AppColors.white50),
  ];
  List<Widget> selectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.white50),
    const Icon(Icons.notifications, color: AppColors.white50),
    const Icon(Icons.add, color: AppColors.white50),
    const Icon(Icons.settings, color: AppColors.white50),
    const Icon(Icons.person, color: AppColors.white50),
  ];

  // List<Widget> selectedIcons = [
  //   NeumorphicButton(
  //       onPressed: () {},
  //       style: NeumorphicStyle(
  //           shape: NeumorphicShape.flat,
  //           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
  //           color: AppColors.grey600,
  //           depth: 0),
  //       padding: const EdgeInsets.all(12.0),
  //       child: const Icon(
  //         Icons.home,
  //         color: AppColors.white50,
  //       )),
  //   NeumorphicButton(
  //       onPressed: () {},
  //       style: NeumorphicStyle(
  //           shape: NeumorphicShape.flat,
  //           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
  //           color: AppColors.grey600,
  //           depth: 0),
  //       padding: const EdgeInsets.all(12.0),
  //       child: const Icon(
  //         Icons.notifications,
  //         color: AppColors.white50,
  //       )),
  //   NeumorphicButton(
  //       onPressed: () {},
  //       style: NeumorphicStyle(
  //           shape: NeumorphicShape.flat,
  //           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
  //           color: AppColors.grey600,
  //           depth: 0),
  //       padding: const EdgeInsets.all(12.0),
  //       child: const Icon(
  //         Icons.add,
  //         color: AppColors.white50,
  //       )),
  //   NeumorphicButton(
  //       onPressed: () {},
  //       style: NeumorphicStyle(
  //           shape: NeumorphicShape.flat,
  //           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
  //           color: AppColors.grey600,
  //           depth: 0),
  //       padding: const EdgeInsets.all(12.0),
  //       child: const Icon(
  //         Icons.settings,
  //         color: AppColors.white50,
  //       )),
  //   NeumorphicButton(
  //       onPressed: () {},
  //       style: NeumorphicStyle(
  //           shape: NeumorphicShape.flat,
  //           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
  //           color: AppColors.grey600,
  //           depth: 0),
  //       padding: const EdgeInsets.all(12.0),
  //       child: const Icon(
  //         Icons.person,
  //         color: AppColors.white50,
  //       )),
  // ];


  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.grey900,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                color: index == bottomNavIndex
                    ? AppColors.grey900
                    : AppColors.grey900,
                child: Column(
                  children: [
                    index == bottomNavIndex
                        ? selectedIcons[index]
                        : unselectedIcons[index],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.toNamed(AppRoute.home);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.toNamed(AppRoute.notification);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoute.home);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.toNamed(AppRoute.home);
      }
    } else if (index == 4) {
      if (!(widget.currentIndex == 4)) {
        Get.toNamed(AppRoute.home);
      }
    }
  }
}
