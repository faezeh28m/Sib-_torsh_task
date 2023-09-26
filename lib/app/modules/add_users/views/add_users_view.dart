import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:sib_torsh_task/app/theme/styles.dart';
import 'package:sib_torsh_task/app/widgets/add_user_text_field.dart';

import '../controllers/add_users_controller.dart';

class AddUsersView extends GetView<AddUsersController> {
  const AddUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SibTorshColor.color2,
      appBar: AppBar(
        title: const Text('SibTorsh'),
        titleTextStyle: appBarTitleTextStyle,
        centerTitle: true,
        backgroundColor: SibTorshColor.color1,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          Form(
            child: Column(
              children: [
                AddUserTextField(
                  label: 'First name',
                  hint: 'Enter your first name.',
                  controller: controller.firstNameController,
                ),
                SizedBox(height: 20.h),
                AddUserTextField(
                  label: 'Last name',
                  hint: 'Enter your last name.',
                  controller: controller.lastNameController,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          controller.firstNameController.clear();
                          controller.lastNameController.clear();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: SibTorshColor.color1,
                          foregroundColor: SibTorshColor.color3,
                        ),
                        child: Text(
                          'clear',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          controller.validator();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: SibTorshColor.color1,
                          foregroundColor: SibTorshColor.color3,
                        ),
                        child: Text(
                          'Add',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: SibTorshColor.color1,
        padding: const EdgeInsets.all(10),
        child: Text(
          '@exam.siiibtorsh.com',
          style: bottomBarTitleTextStyle,
        ),
      ),
    );
  }
}
