import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/home/data/cubits/monthdays/monthdays_cubit.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_pray_time_view_container.dart';

class PraytimeViewBody extends StatelessWidget {
  const PraytimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80.h),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.prayerTimes,
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
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
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
                    child: Container(
                      width: double.infinity,
                      height: 400.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: const Color.fromARGB(62, 135, 62, 213),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.connectionError,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const CustomNavBar()
          ],
        ),
      ),
    );
  }
}

