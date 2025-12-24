import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_content_view_body.dart';

class AzkarContentView extends StatelessWidget {
  const AzkarContentView({super.key, required this.azkarCategoryModel});
  final AzkarCategoryModel azkarCategoryModel;
  @override
  Widget build(BuildContext context) {
    return AzkarContentViewBody(
      azkarCategoryModel: azkarCategoryModel,
    );
  }
}

