class SurahDetailsModel {
  final int ayahNumber;
  final String arAyah;
  final String enAyah;
  final String audio;

  SurahDetailsModel({
    required this.ayahNumber,
    required this.arAyah,
    required this.enAyah,
    required this.audio,
  });

  factory SurahDetailsModel.fromJson(json) {
    return SurahDetailsModel(
        ayahNumber: json['id'],
        arAyah: json['ar'],
        enAyah: json['en'],
        audio: json['path']);
  }
}
