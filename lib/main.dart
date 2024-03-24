import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/theme/light_theme.dart';

import 'core/app_route.dart';
import 'core/dependency_injection.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: AppRoute.splash,
          getPages: AppRoute.routes,
        );
      },
    );
  }
}
