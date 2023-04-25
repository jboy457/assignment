import 'package:assignment/pages/login/login_provider.dart';
import 'package:assignment/utils/base_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../db/user_db.dart';
import '../../models/user.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final Map<String, dynamic> loginData = {};
  RxBool cObsecure = true.obs;

  void submitForm() {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    loginFormKey.currentState!.save();
    Utils.showLoader(Get.context);
    print(loginData);
    LoginProvider().loginUser(loginData, onSuccess: ((data) {
      Utils.showTopSnackBar(Get.context!, data['message'], Colors.green);
      final Map<String, dynamic> userData = data['data']['user'];
      userData['token'] = data['data']['token'];
      User user = User.fromJson(userData);
      UserPreferences().saveUser(user);
      Get.offNamedUntil(AppRoutes.dashboard, ((route) => false));
    }), onError: ((error) {
      Get.back();
      Utils.showTopSnackBar(
          Get.context!, error['message'], Get.theme.errorColor);
    }));
  }
}
