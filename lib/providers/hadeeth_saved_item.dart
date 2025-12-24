import 'package:flutter/material.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';

class HadeethSavedItem extends ChangeNotifier {
  List<HadeethDetailsModel> hadeeth = [];

  void addHadeeth(HadeethDetailsModel hadeethDetailsModel) {
    hadeeth.add(hadeethDetailsModel);
    notifyListeners();
  }

  void deleteHadeeth(HadeethDetailsModel hadeethDetailsModel) {
    hadeeth.remove(hadeethDetailsModel);
    notifyListeners();
  }
}

