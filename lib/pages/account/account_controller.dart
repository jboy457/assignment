import 'package:assignment/db/user_db.dart';
import 'package:assignment/models/user.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
    Rx<User> user = User().obs;

    @override
  void onInit() async {
     User user = await UserPreferences().getUser();
    if(user.firstName == null) {
      Get.offNamed(AppRoutes.login);
    } else {
      user = user;
      Get.offNamed(AppRoutes.dashboard);
    }
    super.onInit();
  }
}
