import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sib_torsh_task/app/data/model/user.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:sib_torsh_task/app/theme/styles.dart';
import 'package:sib_torsh_task/app/widgets/loading.dart';
import 'package:sib_torsh_task/app/widgets/user_card.dart';

import '../controllers/show_users_controller.dart';

class ShowUsersView extends GetView<ShowUsersController> {
  const ShowUsersView({Key? key}) : super(key: key);

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
      body: Obx(
        () => controller.isLoading.value
            ? const SibTorshLoading()
            : controller.users.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 100.r,
                          color: SibTorshColor.color1.withOpacity(0.7),
                        ),
                        Text('Users not found', style: showNotFoundTextStyle),
                        TextButton(
                          onPressed: () {
                            controller.getUserRequests();
                          },
                          child: Text('Retry', style: showRetryTextStyle),
                        )
                      ],
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.all(20.r),
                    children: [
                      for (User user in controller.users)
                        Column(
                          children: [
                            UserCard(
                              name: '${user.firstName} ${user.lastName}',
                              email: user.email!,
                              imgUrl: "https://reqres.in/img/faces/1-image.jpg",
                            ),
                            SizedBox(height: 20.h),
                          ],
                        )
                    ],
                  ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: SibTorshColor.color1,
        padding: EdgeInsets.all(10.r),
        child: Text(
          '@exam.siiibtorsh.com',
          style: bottomBarTitleTextStyle,
        ),
      ),
    );
  }
}
