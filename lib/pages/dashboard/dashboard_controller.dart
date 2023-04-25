import 'package:get/get.dart';

import '../../db/user_db.dart';
import '../../models/user.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  final Rx<User> currentUser = User(token: '').obs;

  @override
  void onInit() async {
    UserPreferences().getUser().then((value) => currentUser.value = value);

    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
