import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';
import 'package:sib_torsh_task/app/theme/styles.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.imgUrl,
  });

  final String name;
  final String email;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        border: Border.all(color: SibTorshColor.color3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: showNameTextStyle),
              Row(
                children: [
                  const Icon(Icons.email, color: SibTorshColor.color1),
                  SizedBox(width: 5.w),
                  Text(email, style: showEmailTextStyle),
                ],
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: SibTorshColor.color1,
            radius: 30,
            backgroundImage: NetworkImage(imgUrl),
          ),
        ],
      ),
    );
  }
}
