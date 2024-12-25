import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPrayTimeRow extends StatelessWidget {
  const CustomPrayTimeRow({
    super.key,
    required this.image,
    required this.prayAr,
    required this.prayEn,
    required this.date,
  });
  final String image;
  final String prayAr;
  final String prayEn;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 50,
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$prayEn - ',
                style: GoogleFonts.amiri(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                prayAr,
                style: GoogleFonts.amiri(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 6,
          ),
          Text(
            date,
            style: GoogleFonts.amiri(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
