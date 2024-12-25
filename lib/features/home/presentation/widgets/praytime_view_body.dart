import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/home/data/cubits/monthdays/monthdays_cubit.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_pray_time_view_container.dart';

class PraytimeViewBody extends StatelessWidget {
  const PraytimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Prayer times - ',
                    style: GoogleFonts.amiri(
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'مواقيت الصلاه',
                    style: GoogleFonts.amiri(
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<MonthdaysCubit, MonthdaysState>(
              builder: (context, state) {
                if (state is MonthdaysLoadedState) {
                  return CustomPrayTimesViewContainer(
                      monthDayModel:
                          BlocProvider.of<MonthdaysCubit>(context).days);
                } else if (state is MonthdaysFailureState) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(62, 135, 62, 213),
                      ),
                      child: Center(
                        child: Text(
                          'Oops Conection Error',
                          style: GoogleFonts.amiri(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            CustomNavBar()
          ],
        ),
      ),
    );
  }
}
