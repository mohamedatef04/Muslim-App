import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';
import 'package:quran_app/providers/askar_saved_item.dart';

class AzkarBookmarkViewBody extends StatelessWidget {
  const AzkarBookmarkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<AskarArrayModel> azkar = Provider.of<AskarSavedItem>(context).azkar;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          AppStrings.azkarBookmarks,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: azkar.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: azkar.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: const Color(0xff121931),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffA44AFF),
                              ),
                              child: Center(
                                child: Text(
                                  azkar[index].zkrId.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                await FlutterClipboard.copy(
                                    azkar[index].zkrText);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppStrings.copySuccess,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(20.r),
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: const Color(0xffA44AFF),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.copy,
                                size: 22.r,
                                color: const Color(0xffA44AFF),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Provider.of<AskarSavedItem>(context,
                                        listen: false)
                                    .deleteZkr(azkar[index]);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 24.r,
                                color: const Color(0xffA44AFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        azkar[index].zkrText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty-folder.png',
                    width: 200.w,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'لا توجد عناصر محفوظة',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffA19CC5)),
                  ),
                ],
              ),
            ),
    );
  }
}
