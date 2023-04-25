import 'package:assignment/models/user.dart';
import 'package:assignment/pages/dashboard/dashboard_binding.dart';
import 'package:assignment/pages/dashboard/dashboard_controller.dart';
import 'package:assignment/pages/dashboard/dashboard_page.dart';
import 'package:assignment/pages/login/login_page.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'db/user_db.dart';
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
