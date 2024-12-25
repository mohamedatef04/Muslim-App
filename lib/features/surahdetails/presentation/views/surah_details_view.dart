import 'package:flutter/material.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';

import 'package:quran_app/features/surahdetails/presentation/widgets/surahdetails_view_body.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return SurahdetailsViewBody(
      surahModel: surahModel,
    );
  }
}
