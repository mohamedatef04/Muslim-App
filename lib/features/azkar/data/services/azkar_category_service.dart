import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';

class AzkarCategoryService {
  Future<List<AzkarModel>> getAzkarCategory() async {
    String jsonString = await rootBundle.loadString('assets/azkar/adhkar.json');

    List<dynamic> jsonData = jsonDecode(jsonString);

    List<AzkarModel> azkar = [];
    for (var element in jsonData) {
      azkar.add(AzkarModel.fromJson(element));
    }
    print(azkar);
    return azkar;
  }
}
