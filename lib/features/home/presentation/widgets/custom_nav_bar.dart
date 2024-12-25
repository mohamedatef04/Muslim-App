import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_colmn.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(56, 135, 62, 213),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: Row(
            spacing: 30,
            children: [
              CustomColmn(
                image: 'assets/images/quran.png',
                text: 'Quran',
                onTap: () {
                  GoRouter.of(context).push('/QuranView');
                },
              ),
              CustomColmn(
                image: 'assets/images/prayer-mat.png',
                text: 'Hadeeth',
                onTap: () {
                  GoRouter.of(context).push('/PraytimesView');
                },
              ),
              CustomColmn(
                image: 'assets/images/praying.png',
                text: 'Azkar',
                onTap: () {
                  GoRouter.of(context).push('/AzkarView');
                },
              ),
              CustomColmn(
                image: 'assets/images/apps.png',
                text: 'More',
                onTap: () {
                  GoRouter.of(context).push('/SettingView');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
