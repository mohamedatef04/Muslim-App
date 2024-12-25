import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Container(
        width: 327,
        height: 257,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Frame 33 (1).png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            spacing: 6,
            children: [
              Text(
                surahModel.enSurahName,
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                surahModel.arSurahName,
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Divider(
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
