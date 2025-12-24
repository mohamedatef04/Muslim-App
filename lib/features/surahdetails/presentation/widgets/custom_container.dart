import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Container(
        width: 327.w,
        height: 257.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Frame 33 (1).png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            children: [
              Text(
                surahModel.enSurahName,
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 6.h),
              Text(
                surahModel.arSurahName,
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 6.h),
              const Divider(
                color: Colors.white,
                indent: 60,
                endIndent: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
