import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNextText extends StatelessWidget {
  const CustomNextText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        'Your Way to janna',
        style: GoogleFonts.amiri(
          textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
