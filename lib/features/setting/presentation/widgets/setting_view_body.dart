import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Settings',
          style: GoogleFonts.amiri(textStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 5,
          children: [
            CustomBookmarkRow(
              category: 'BookMarks(Quran) - (قران)المفضله',
              onPressed: () {
                GoRouter.of(context).push('/QuranBookmarkView');
              },
            ),
            CustomBookmarkRow(
              category: 'BookMarks(Hadeeth) - (احاديث)المفضله',
              onPressed: () {
                GoRouter.of(context).push('/HadeethBookmarkView');
              },
            ),
            CustomBookmarkRow(
              category: 'BookMarks(Quran) - (اذكار)المفضله',
              onPressed: () {
                GoRouter.of(context).push('/AzkarBookmarkView');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBookmarkRow extends StatelessWidget {
  const CustomBookmarkRow({
    super.key,
    required this.category,
    this.onPressed,
  });

  final String category;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  'assets/images/folder.png',
                ),
                width: 40,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                category,
                style: GoogleFonts.amiri(
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              Spacer(
                flex: 5,
              ),
              IconButton(
                  onPressed: onPressed, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
