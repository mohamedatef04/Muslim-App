import 'package:dio/dio.dart';
import 'package:quran_app/features/home/data/models/month_day_model.dart';

class GetMonthDaysSercice {
  final dio = Dio();

  Future<MonthDayModel> getMonthDays() async {
    var responce = await dio.get(
        'https://api.aladhan.com/v1/timings/${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}?latitude=30.044420&longitude=31.235712');
    Map<String, dynamic> jsonData = responce.data;
    Map<String, dynamic> data = jsonData['data'];

    MonthDayModel dayModel = MonthDayModel.fromJson(data);
    return dayModel;
  }
}

