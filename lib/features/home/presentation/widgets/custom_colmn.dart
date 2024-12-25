import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColmn extends StatelessWidget {
  const CustomColmn({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Color.fromARGB(88, 135, 62, 213),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.amiri(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
