import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/home/data/models/month_day_model.dart';
import 'package:quran_app/features/home/presentation/widgets/custom_pray_time_row.dart';

class CustomPrayTimesViewContainer extends StatefulWidget {
  const CustomPrayTimesViewContainer({
    super.key,
    required this.monthDayModel,
  });
  final MonthDayModel monthDayModel;

  @override
  State<CustomPrayTimesViewContainer> createState() =>
      _CustomPrayTimesViewContainerState();
}

class _CustomPrayTimesViewContainerState
    extends State<CustomPrayTimesViewContainer> {
  final List images = [
    'assets/images/fajr.png',
    'assets/images/sunrise.png',
    'assets/images/duhr.png',
    'assets/images/asr.png',
    'assets/images/sunset.png',
    'assets/images/isha (1).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color.fromARGB(62, 135, 62, 213),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            children: [
              Text(
                '${widget.monthDayModel.weakDayEn} - ${widget.monthDayModel.weakDayAr}',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.monthDayModel.date,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              CustomPrayTimeRow(
                image: images[0],
                prayAr: 'الفجر',
                prayEn: 'Fajr',
                date: '${widget.monthDayModel.fajrDate.substring(0, 5)} AM',
              ),
              CustomPrayTimeRow(
                image: images[1],
                prayAr: 'الشروق',
                prayEn: 'SunRise',
                date: '${widget.monthDayModel.sunriseDate.substring(0, 5)} AM',
              ),
              CustomPrayTimeRow(
                image: images[2],
                prayAr: 'الظهر',
                prayEn: 'Dohr',
                date: '${widget.monthDayModel.dohrDate.substring(0, 5)} PM',
              ),
              CustomPrayTimeRow(
                image: images[3],
                prayAr: 'العصر',
                prayEn: 'Asr',
                date: '${widget.monthDayModel.asrDate.substring(0, 5)} PM',
              ),
              CustomPrayTimeRow(
                image: images[4],
                prayAr: 'المغرب',
                prayEn: 'Maghrib',
                date: '${widget.monthDayModel.maghribDate.substring(0, 5)} PM',
              ),
              CustomPrayTimeRow(
                image: images[5],
                prayAr: 'العشاء',
                prayEn: 'Isha',
                date: '${widget.monthDayModel.ishaDate.substring(0, 5)} PM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
