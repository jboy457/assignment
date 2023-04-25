import 'package:assignment/models/user.dart';
import 'package:assignment/pages/register/register_provider.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/utils/base_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../db/user_db.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey();

  Map<String, dynamic> registerData = {
    'role': 'student',
  }.obs;
  RxBool cObsecure = true.obs;

  void submitForm() {
    if (!registerFormKey.currentState!.validate()) {
      return;
    }
    registerFormKey.currentState!.save();
    Utils.showLoader(Get.context);
    RegisterProvider().registerUser(registerData, onSuccess: ((data) {
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
