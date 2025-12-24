import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/utils/app_strings.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Text(
        AppStrings.muslim,
        style: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

