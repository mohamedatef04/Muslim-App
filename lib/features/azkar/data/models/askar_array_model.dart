class AskarArrayModel {
  final int zkrId;
  final String zkrText;

  AskarArrayModel({
    required this.zkrId,
    required this.zkrText,
  });

  factory AskarArrayModel.fromJson(json) {
    return AskarArrayModel(
      zkrId: json['id'],
      zkrText: json['text'],
    );
  }
}
