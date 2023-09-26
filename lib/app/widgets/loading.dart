import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sib_torsh_task/app/theme/colors.dart';

class SibTorshLoading extends StatelessWidget {
  const SibTorshLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.waveDots(
              color: SibTorshColor.color1.withOpacity(0.7), size: 100.r),
        ],
      ),
    );
  }
}
