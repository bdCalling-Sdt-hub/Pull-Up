import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../widget/text/custom_text.dart';

Widget identifyImage() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const CustomText(
        text: "Upload your identification information",
        color: AppColors.white50,
        fontSize: 18,
        maxLines: 3,
        bottom: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [8],
            color: AppColors.primaryColor,
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileController.instance.identifyFont != null
                      ? GestureDetector(
                          onTap: ProfileController.instance.font,
                          child: Image.file(
                            File("${ProfileController.instance.identifyFont}"),
                            fit: BoxFit.fill,
                            height: 50,
                          ),
                        )
                      : GestureDetector(
                          onTap: ProfileController.instance.font,
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white50,
                            size: 32,
                          ),
                        ),
                ],
              ),
            ),
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [8],
            color: AppColors.primaryColor,
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileController.instance.identifyBack != null
                      ? GestureDetector(
                          onTap: ProfileController.instance.back,
                          child: Image.file(
                            File("${ProfileController.instance.identifyBack}"),
                            fit: BoxFit.fill,
                            height: 50,
                          ),
                        )
                      : GestureDetector(
                          onTap: ProfileController.instance.back,
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white50,
                            size: 32,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
