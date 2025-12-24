import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_colmn.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color.fromARGB(56, 135, 62, 213),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomColmn(
                image: 'assets/images/quran.png',
                text: AppStrings.quran,
                onTap: () {
                  GoRouter.of(context).push('/QuranView');
                },
              ),
              CustomColmn(
                image: 'assets/images/prayer-mat.png',
                text: AppStrings.hadeeth,
                onTap: () {
                  GoRouter.of(context).push('/PraytimesView');
                },
              ),
              CustomColmn(
                image: 'assets/images/praying.png',
                text: AppStrings.azkar,
                onTap: () {
                  GoRouter.of(context).push('/AzkarView');
                },
              ),
              CustomColmn(
                image: 'assets/images/apps.png',
                text: AppStrings.settings,
                onTap: () {
                  GoRouter.of(context).push('/SettingView');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

