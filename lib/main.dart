import 'package:assignment/models/user.dart';
import 'package:assignment/pages/dashboard/dashboard_controller.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/shared/binding/defualt_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'routes/app_pages.dart';
import 'themes/app_theme.dart';

void main() {
  Get.lazyPut<DashboardController>(() => DashboardController());

  runApp(const MyApp());
}

final user = Rxn<User>();

class MyApp extends GetWidget<DashboardController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        initialBinding: DefaultBinding(),
        initialRoute: AppRoutes.login,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
