import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';

class SearchViewListviewItem extends StatelessWidget {
  const SearchViewListviewItem({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/SurahDetailsView', extra: surahModel);
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/muslim (1) 1.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Center(
                        child: Text(
                          surahModel.surahNumber.toString(),
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surahModel.enSurahName,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xffFFFFFF)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                '${surahModel.surahEnKind} - ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffA19CC5),
                                ),
                              ),
                              Text(
                                surahModel.surahArKind,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffA19CC5),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      surahModel.arSurahName,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffA44AFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Divider(
                indent: 15.w,
                endIndent: 15.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
