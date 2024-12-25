import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';
import 'package:quran_app/providers/quran_saved_item.dart';

class QuranBookmarkViewBody extends StatelessWidget {
  const QuranBookmarkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    List<SurahDetailsModel> ayas = Provider.of<QuranSavedItem>(context).ayas;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Quran BookMarks',
          style: GoogleFonts.amiri(textStyle: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (ayas.isNotEmpty) {
            return ListView.builder(
              itemCount: ayas.length,
              itemBuilder: (context, index) {
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
                                      ayas[index].ayahNumber.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 8,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await player.play(
                                      AssetSource(ayas[index].audio),
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
                                    QuranSavedItem quranSavedItem =
                                        Provider.of<QuranSavedItem>(context,
                                            listen: false);

                                    quranSavedItem.deleteAyah(ayas[index]);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: Color(0xffA44AFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            ayas[index].arAyah,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.amiri(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            ayas[index].enAyah,
                            style: GoogleFonts.amiri(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffA19CC5),
                              ),
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty-folder.png',
                    width: 200,
                  ),
                  Text(
                    'No Saved Items',
                    style: GoogleFonts.amiri(
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA19CC5),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
