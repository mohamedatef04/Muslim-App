import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';

class HadeethDetailsService {
  Future<List<HadeethDetailsModel>> getAllAhadeeth(
      {required int categoryIndex}) async {
    var jsonData =
        await rootBundle.loadString('assets/Ahadeeth/All Hadeeth.json');

    var data = jsonDecode(jsonData);

    List<dynamic> json = data[categoryIndex]['hadiths'];

    List<HadeethDetailsModel> ahadeeth = [];
    for (var element in json) {
      ahadeeth.add(
        HadeethDetailsModel.fromJson(element),
      );
    }
    print(ahadeeth);
    return ahadeeth;
  }
}

