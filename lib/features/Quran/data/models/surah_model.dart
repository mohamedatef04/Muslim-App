class SurahModel {
  final int surahNumber;
  final String enSurahName;
  final String surahArKind;
  final String surahEnKind;
  final String arSurahName;

  SurahModel({
    required this.surahNumber,
    required this.enSurahName,
    required this.surahArKind,
    required this.surahEnKind,
    required this.arSurahName,
  });

  factory SurahModel.fromJson(json) {
    return SurahModel(
      surahNumber: json['id'],
      enSurahName: json['name_translation'],
      surahArKind: json['type'],
      surahEnKind: json['type_en'],
      arSurahName: json['name'],
    );
  }
}
