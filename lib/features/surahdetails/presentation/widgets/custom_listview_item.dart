import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';
import 'package:quran_app/providers/quran_saved_item.dart';

class CustomSurahDetailsListViewItem extends StatefulWidget {
  const CustomSurahDetailsListViewItem({
    super.key,
    required this.surahDetailsModel,
  });
  final SurahDetailsModel surahDetailsModel;

  @override
  State<CustomSurahDetailsListViewItem> createState() =>
      _CustomSurahDetailsListViewItemState();
}

class _CustomSurahDetailsListViewItemState
    extends State<CustomSurahDetailsListViewItem> {
  bool isPlaying = false;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = false;
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
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Container(
              width: 327.w,
              height: 47.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: const Color(0xff121931),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 27.w,
                      height: 27.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: const Color(0xffA44AFF),
                      ),
                      child: Center(
                        child: Text(
                          widget.surahDetailsModel.ayahNumber.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                    IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await player.pause();
                        } else {
                          await player.play(
                            AssetSource(widget.surahDetailsModel.audio),
                          );
                        }
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                        size: 30.r,
                        color: const Color(0xffA44AFF),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          QuranSavedItem quransavedItem =
                              Provider.of<QuranSavedItem>(context,
                                  listen: false);

                          bool exist = false;
                          var itemInSaved = quransavedItem.ayas;
                          for (var item in itemInSaved) {
                            if (item.arAyah ==
                                widget.surahDetailsModel.arAyah) {
                              exist = true;
                            }
                          }

                          if (exist) {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text: AppStrings.alreadyInSaved);
                          } else {
                            quransavedItem.addAyah(widget.surahDetailsModel);
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: AppStrings.itemAdded);
                          }
                        },
                        icon: Icon(
                          Icons.bookmark_add,
                          size: 24.r,
                          color: const Color(0xffA44AFF),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.surahDetailsModel.arAyah,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.surahDetailsModel.enAyah,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffA19CC5)),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
