import 'package:get/get.dart';

import '../controllers/show_users_controller.dart';

class ShowUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowUsersController>(
      () => ShowUsersController(),
    );
  }
}
