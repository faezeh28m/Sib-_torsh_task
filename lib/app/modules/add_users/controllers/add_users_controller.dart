import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sib_torsh_task/app/data/model/user.dart';
import 'package:sib_torsh_task/app/data/repository/user.repository.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sib_torsh_task/app/theme/styles.dart';

class AddUsersController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  RxBool isAdding = false.obs;

  Future<void> validator() async {
    if (firstNameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Enter first name",
        icon: const Icon(Icons.error, color: SibTorshColor.color1),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        duration: const Duration(seconds: 3),
        backgroundColor: SibTorshColor.color3,
        colorText: SibTorshColor.color1,
        instantInit: false,
      );
    } else if (lastNameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Enter last name",
        icon: const Icon(Icons.error, color: SibTorshColor.color1),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        duration: const Duration(seconds: 3),
        backgroundColor: SibTorshColor.color3,
        colorText: SibTorshColor.color1,
        instantInit: false,
      );
    } else {
      await addUser();
    }
  }

  Future addUser() async {
    Get.defaultDialog(
      title: "Adding user",
      backgroundColor: SibTorshColor.color3,
      titleStyle: dialogTitleTextStyle,
      barrierDismissible: false,
      content: const Column(
        children: [
          CircularProgressIndicator(color: SibTorshColor.color2),
        ],
      ),
    );
    User user = User(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    dio.Response response = await UserRepository.createUser(user);
    if (response.statusCode == 201) {
      Get.back();
      Get.defaultDialog(
        title: "Successful",
        backgroundColor: SibTorshColor.color3,
        titleStyle: dialogTitleTextStyle,
        barrierDismissible: false,
        content: Column(
          children: [
            Text('User added successfully.', style: dialogDetailTextStyle),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Ok", style: dialogTitleTextStyle),
            )
          ],
        ),
      );
      firstNameController.clear();
      lastNameController.clear();
    } else {
      Get.back();
      Get.defaultDialog(
        title: "Error",
        backgroundColor: SibTorshColor.color3,
        titleStyle: dialogTitleTextStyle,
        barrierDismissible: false,
        content: Column(
          children: [
            Icon(Icons.error, size: 50.r, color: SibTorshColor.color1),
            SizedBox(height: 20.h),
            Text("Failed to add user! Check your internet connection.",
                style: dialogDetailTextStyle),
            SizedBox(height: 20.h),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    addUser();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: SibTorshColor.color1,
                  ),
                  child: Text("Retry", style: dialogTitleTextStyle),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: SibTorshColor.color1,
                  ),
                  child: Text("Ok", style: dialogTitleTextStyle),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
