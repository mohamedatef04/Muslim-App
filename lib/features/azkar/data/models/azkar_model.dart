class AzkarModel {
  final int categoryId;
  final String category;

  AzkarModel({
    required this.categoryId,
    required this.category,
  });

  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      categoryId: json['id'],
      category: json['category'],
    );
  }
}

