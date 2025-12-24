import 'package:flutter/material.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';

class QuranSavedItem extends ChangeNotifier {
  final List<SurahDetailsModel> ayas = [];

  void addAyah(SurahDetailsModel surahDetailsModel) {
    ayas.add(surahDetailsModel);
    notifyListeners();
  }

  void deleteAyah(SurahDetailsModel surahDetailsModel) {
    ayas.remove(surahDetailsModel);
    notifyListeners();
  }
}

