import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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
  bool isSaved = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 18,
          children: [
            Container(
              width: 327,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff121931),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffA44AFF),
                      ),
                      child: Center(
                        child: Text(
                          widget.surahDetailsModel.ayahNumber.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 8,
                    ),
                    IconButton(
                      onPressed: () async {
                        await player.play(
                          AssetSource(widget.surahDetailsModel.audio),
                        );
                      },
                      icon: Icon(
                        Icons.play_arrow_outlined,
                        size: 30,
                        color: Color(0xffA44AFF),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await player.stop();
                      },
                      icon: Icon(
                        Icons.pause,
                        size: 30,
                        color: Color(0xffA44AFF),
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
                                text: 'Already in your Saved');
                          } else {
                            quransavedItem.addAyah(widget.surahDetailsModel);

                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Item added');
                          }
                        },
                        icon: Icon(
                          Icons.bookmark_add,
                          color: Color(0xffA44AFF),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.surahDetailsModel.arAyah,
                textAlign: TextAlign.end,
                style: GoogleFonts.amiri(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.surahDetailsModel.enAyah,
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffA19CC5)),
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
