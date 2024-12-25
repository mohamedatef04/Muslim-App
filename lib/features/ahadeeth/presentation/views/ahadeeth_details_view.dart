import 'package:flutter/material.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';
import 'package:quran_app/features/ahadeeth/presentation/widgets/ahadeeth_details_view_body.dart';

class AhadeethDetailsView extends StatelessWidget {
  const AhadeethDetailsView({super.key, required this.ahadeethCategoryModel});
  final AhadeethCategoryModel ahadeethCategoryModel;
  @override
  Widget build(BuildContext context) {
    return AhadeethDetailsViewBody(
      ahadeethCategoryModel: ahadeethCategoryModel,
    );
  }
}
