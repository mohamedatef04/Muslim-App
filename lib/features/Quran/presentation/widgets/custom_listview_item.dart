import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          '/SurahDetailsView',
          extra: surahModel,
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/muslim (1) 1.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Center(
                        child: Text(surahModel.surahNumber.toString()),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          surahModel.enSurahName,
                          style: GoogleFonts.amiri(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${surahModel.surahEnKind} - ',
                              style: GoogleFonts.amiri(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA19CC5),
                                ),
                              ),
                            ),
                            Text(
                              surahModel.surahArKind,
                              style: GoogleFonts.amiri(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA19CC5),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(
                      flex: 8,
                    ),
                    Text(
                      surahModel.arSurahName,
                      style: GoogleFonts.amiri(
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffA44AFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 15,
                endIndent: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
