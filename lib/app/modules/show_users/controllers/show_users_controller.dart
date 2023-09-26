import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sib_torsh_task/app/data/model/user.dart';
import 'package:sib_torsh_task/app/data/repository/user.repository.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';

class ShowUsersController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<User> users = RxList();

  final count = 0.obs;

  @override
  Future<void> onInit() async {
    await getUserRequests();
    super.onInit();
  }

  Future getUserRequests() async {
    users.value = RxList();
    isLoading.value = true;
    dio.Response response = await UserRepository.getUsers();
    if (response.statusCode == 200) {
      users.value = User.getListFromJson(response.data["data"]);
    } else {
      Get.snackbar(
        "Error",
        "Check your internet connection.",
        icon: const Icon(Icons.error, color: SibTorshColor.color1),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        duration: const Duration(seconds: 3),
        backgroundColor: SibTorshColor.color3,
        colorText: SibTorshColor.color1,
        instantInit: false,
      );
    }
    isLoading.value = false;
  }
}
