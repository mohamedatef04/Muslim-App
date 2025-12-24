import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColmn extends StatelessWidget {
  const CustomColmn({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(88, 135, 62, 213),
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
