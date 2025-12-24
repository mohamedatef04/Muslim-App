import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          AppStrings.settings,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 5.h),
            CustomBookmarkRow(
              category: AppStrings.quranBookmarks,
              onPressed: () {
                GoRouter.of(context).push('/QuranBookmarkView');
              },
            ),
            CustomBookmarkRow(
              category: AppStrings.hadeethBookmarks,
              onPressed: () {
                GoRouter.of(context).push('/HadeethBookmarkView');
              },
            ),
            CustomBookmarkRow(
              category: AppStrings.azkarBookmarks,
              onPressed: () {
                GoRouter.of(context).push('/AzkarBookmarkView');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBookmarkRow extends StatelessWidget {
  const CustomBookmarkRow({
    super.key,
    required this.category,
    this.onPressed,
  });

  final String category;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/folder.png',
                ),
                width: 40.w,
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Text(
                  category,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

