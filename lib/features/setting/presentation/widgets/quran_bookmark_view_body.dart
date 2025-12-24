import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';
import 'package:quran_app/providers/quran_saved_item.dart';

class QuranBookmarkViewBody extends StatefulWidget {
  const QuranBookmarkViewBody({super.key});

  @override
  State<QuranBookmarkViewBody> createState() => _QuranBookmarkViewBodyState();
}

class _QuranBookmarkViewBodyState extends State<QuranBookmarkViewBody> {
  final player = AudioPlayer();
  int playingIndex = -1;

  @override
  void initState() {
    super.initState();
    player.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          playingIndex = -1;
        });
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SurahDetailsModel> ayas = Provider.of<QuranSavedItem>(context).ayas;
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
          AppStrings.quranBookmarks,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ayas.isNotEmpty
          ? ListView.builder(
              itemCount: ayas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Column(
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
                                    ayas[index].ayahNumber.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () async {
                                  if (playingIndex == index) {
                                    await player.pause();
                                    setState(() {
                                      playingIndex = -1;
                                    });
                                  } else {
                                    await player.play(
                                      AssetSource(ayas[index].audio),
                                    );
                                    setState(() {
                                      playingIndex = index;
                                    });
                                  }
                                },
                                icon: Icon(
                                  playingIndex == index
                                      ? Icons.pause
                                      : Icons.play_arrow_outlined,
                                  size: 28.r,
                                  color: const Color(0xffA44AFF),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<QuranSavedItem>(context,
                                          listen: false)
                                      .deleteAyah(ayas[index]);
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
                          ayas[index].arAyah,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          ayas[index].enAyah,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffA19CC5)),
                        ),
                      ),
                      const Divider()
                    ],
                  ),
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
