import 'package:assignment/pages/account/account_controller.dart';
import 'package:get/get.dart';

class DefaultBinding extends Bindings {
    @override
    void dependencies() {
      Get.put<AccountController>(AccountController(), permanent: true);
    }
}