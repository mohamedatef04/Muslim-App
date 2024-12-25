import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/home/data/cubits/monthdays/monthdays_cubit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Muslim App',
                  style: GoogleFonts.amiri(
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Learn Quran and\nRecite once everyday',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiri(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/images/Group 35.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 108,
            top: 675,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push('/PraytimeView');
                BlocProvider.of<MonthdaysCubit>(context).getMonthDays();
              },
              child: Container(
                width: 185,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffF9B091),
                ),
                child: Center(
                    child: Text(
                  'Get Started',
                  style: GoogleFonts.amiri(
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
