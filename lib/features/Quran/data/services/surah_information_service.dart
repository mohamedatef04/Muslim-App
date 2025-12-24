import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';

class SurahInformationService {
  Future<List<SurahModel>> getSurahInformation() async {
    var responce = await rootBundle.loadString('assets/Quran_json/Quran.json');
    var jsonData = jsonDecode(responce);
    List<dynamic> data = jsonData;

    List<SurahModel> sewars = [];
    for (var surah in data) {
      sewars.add(
        SurahModel.fromJson(surah),
      );
    }
    print(sewars);
    return sewars;
  }
}

