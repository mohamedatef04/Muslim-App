class HadeethDetailsModel {
  final String hadeethText;
  final int hadeethId;

  HadeethDetailsModel({required this.hadeethText, required this.hadeethId});

  factory HadeethDetailsModel.fromJson(json) {
    return HadeethDetailsModel(
      hadeethText: json['arabic'],
      hadeethId: json['idInBook'],
    );
  }
}
