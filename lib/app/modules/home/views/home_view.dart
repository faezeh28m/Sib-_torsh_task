import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sib_torsh_task/app/routes/app_pages.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:sib_torsh_task/app/theme/styles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
          CardButton(
            iconData: Icons.add_circle_rounded,
            title: 'Add User',
            onPress: () {
              Get.toNamed(Routes.ADD_USERS);
            },
          ),
          SizedBox(height: 20.h),
          CardButton(
            iconData: Icons.search_outlined,
            title: 'Show Users',
            onPress: () {
              Get.toNamed(Routes.SHOW_USERS);
            },
          ),
        ],
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

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPress,
  });

  final String title;
  final IconData iconData;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        backgroundColor: SibTorshColor.color2,
        foregroundColor: SibTorshColor.color1,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: SibTorshColor.color3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            iconData,
            color: SibTorshColor.color1,
            size: 50.r,
          ),
          Text(title, style: homeTitleTextStyle),
        ],
      ),
    );
  }
}
