class MonthDayModel {
  final String weakDayEn;
  final String weakDayAr;

  final String date;
  final String fajrDate;
  final String sunriseDate;
  final String dohrDate;
  final String asrDate;
  final String maghribDate;
  final String ishaDate;

  factory MonthDayModel.fromJson(json) {
    return MonthDayModel(
      weakDayEn: json['date']['gregorian']['weekday']['en'],
      weakDayAr: json['date']['hijri']['weekday']['ar'],
      date: json['date']['gregorian']['date'],
      fajrDate: json['timings']['Fajr'],
      sunriseDate: json['timings']['Sunrise'],
      dohrDate: json['timings']['Dhuhr'],
      asrDate: json['timings']['Asr'],
      maghribDate: json['timings']['Maghrib'],
      ishaDate: json['timings']['Isha'],
    );
  }

  MonthDayModel(
      {required this.weakDayEn,
      required this.weakDayAr,
      required this.date,
      required this.fajrDate,
      required this.sunriseDate,
      required this.dohrDate,
      required this.asrDate,
      required this.maghribDate,
      required this.ishaDate});
}
