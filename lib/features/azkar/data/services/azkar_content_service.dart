import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';

class AzkarContentService {
  Future<List<AskarArrayModel>> getAzkarContent({required int azkarId}) async {
    String jsonString =
        await rootBundle.loadString('assets/azkar/askar edited.json');

    var jsonData = jsonDecode(jsonString);
    List<dynamic> data = jsonData[azkarId]['array'];

    List<AskarArrayModel> azkar = [];
    for (var element in data) {
      azkar.add(AskarArrayModel.fromJson(element));
    }

    return azkar;
  }
}
