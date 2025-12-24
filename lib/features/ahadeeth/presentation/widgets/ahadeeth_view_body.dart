import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';
import 'package:quran_app/features/ahadeeth/presentation/widgets/ahadeeth_listview_item.dart';

class AhadeethViewBody extends StatelessWidget {
  AhadeethViewBody({super.key});

  final List<AhadeethCategoryModel> ahadeethList = [
    AhadeethCategoryModel(
        categoryNumber: 1,
        categoryEn: 'The Forty Hadith of Imam Nawawi',
        categoryAr: 'الأربعون النووية'),
    AhadeethCategoryModel(
        categoryNumber: 2,
        categoryEn: 'The Forty Hadith Qudsi',
        categoryAr: 'الأربعون القدسية'),
    AhadeethCategoryModel(
        categoryNumber: 3,
        categoryEn: 'Sunan al-Darimi',
        categoryAr: 'سنن الدارمي'),
    AhadeethCategoryModel(
        categoryNumber: 4,
        categoryEn: 'Sunan Ibn Majah',
        categoryAr: 'سنن ابن ماجه'),
    AhadeethCategoryModel(
        categoryNumber: 5,
        categoryEn: 'Sunan al-Nasa\'i',
        categoryAr: 'سنن النسائي'),
    AhadeethCategoryModel(
        categoryNumber: 6,
        categoryEn: 'Sunan Abi Dawud',
        categoryAr: 'سنن أبي داود'),
    AhadeethCategoryModel(
        categoryNumber: 7,
        categoryEn: 'Sahih al-Bukhari',
        categoryAr: 'صحيح البخاري'),
    AhadeethCategoryModel(
        categoryNumber: 8, categoryEn: 'Sahih Muslim', categoryAr: 'صحيح مسلم'),
    AhadeethCategoryModel(
        categoryNumber: 9,
        categoryEn: 'Muwatta Malik',
        categoryAr: 'موطأ مالك'),
    AhadeethCategoryModel(
        categoryNumber: 10,
        categoryEn: 'Jami\' al-Tirmidhi',
        categoryAr: 'جامع الترمذي'),
    AhadeethCategoryModel(
        categoryNumber: 11,
        categoryEn: 'Musnad Ahmad ibn Hanbal',
        categoryAr: 'مسند الإمام أحمد بن حنبل'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          AppStrings.hadeeth,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ahadeethList.length,
        itemBuilder: (context, index) {
          return AhadeethListViewItem(
              ahadeethCategoryModel: ahadeethList[index]);
        },
      ),
    );
  }
}
