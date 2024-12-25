import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';

class SurahDetailsServices {
  Future<List<SurahDetailsModel>> getSurahDetails(
      {required int suraIndex}) async {
    var responce = await rootBundle.loadString('assets/Quran_json/Quran.json');

    var jsonData = jsonDecode(responce);

    List<dynamic> ayahsList = jsonData[suraIndex]['array'];
    List<SurahDetailsModel> ayas = [];
    for (var ayah in ayahsList) {
      ayas.add(
        SurahDetailsModel.fromJson(ayah),
      );
    }
    print(ayas);
    return ayas;
  }
}
