import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/intro/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementTo(const UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logo, width: 250),
            Text(
              'Taskati',
              style: TextStyles.getBodyTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(15),
            Text(
              'It\'s time to get organized',
              style: TextStyles.getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
