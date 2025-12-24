import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';

class AskarSavedItem extends ChangeNotifier {
  final List<AskarArrayModel> azkar = [];

  void addZkr(AskarArrayModel askarArrayModel) {
    azkar.add(askarArrayModel);
    notifyListeners();
  }

  void deleteZkr(AskarArrayModel askarArrayModel) {
    azkar.remove(askarArrayModel);
    notifyListeners();
  }
}

