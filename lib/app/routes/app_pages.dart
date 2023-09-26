import 'package:get/get.dart';

import '../modules/add_users/bindings/add_users_binding.dart';
import '../modules/add_users/views/add_users_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/show_users/bindings/show_users_binding.dart';
import '../modules/show_users/views/show_users_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS,
      page: () => const AddUsersView(),
      binding: AddUsersBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_USERS,
      page: () => const ShowUsersView(),
      binding: ShowUsersBinding(),
    ),

  ];
}
