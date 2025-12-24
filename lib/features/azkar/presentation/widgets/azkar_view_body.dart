import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_list_view_item.dart';

class AzkarViewBody extends StatefulWidget {
  const AzkarViewBody({super.key});

  @override
  State<AzkarViewBody> createState() => _AzkarViewBodyState();
}

class _AzkarViewBodyState extends State<AzkarViewBody> {
  final ScrollController _scrollController = ScrollController();
  List<AzkarCategoryModel> displayedAzkar = [];
  final int itemsPerPage = 15;
  bool isLoadingMore = false;

  final List<AzkarCategoryModel> allAzkar = [
    AzkarCategoryModel(
        categoryNumber: 1,
        categoryEn: 'Morning and Evening Azkar',
        categoryAr: 'اذكار الصباح و المساء'),
    AzkarCategoryModel(
        categoryNumber: 2,
        categoryEn: 'Sleeping Azkar',
        categoryAr: 'اذكار النوم'),
    AzkarCategoryModel(
        categoryNumber: 3,
        categoryEn: 'Waking Up Azkar',
        categoryAr: 'اذكار الاستيقاظ من النوم'),
    AzkarCategoryModel(
        categoryNumber: 4,
        categoryEn: 'Call for Getting Bathroom',
        categoryAr: 'دعاء دخول الخلاء'),
    AzkarCategoryModel(
        categoryNumber: 5,
        categoryEn: 'Call for Leaving Bathroom',
        categoryAr: 'دعاء الخروج من الخلاء'),
    AzkarCategoryModel(
        categoryNumber: 6,
        categoryEn: 'Before Ablution Azkar',
        categoryAr: 'الذكر قبل الوضوء'),
    AzkarCategoryModel(
        categoryNumber: 7,
        categoryEn: 'After Ablution Azkar',
        categoryAr: 'الذكر بعدالوضوء'),
    AzkarCategoryModel(
        categoryNumber: 8,
        categoryEn: 'Leaving Home Azkar',
        categoryAr: 'الذكر عند الخروج من المنزل'),
    AzkarCategoryModel(
        categoryNumber: 9,
        categoryEn: 'Getting Home Azkar',
        categoryAr: 'الذكر عند دخول المنزل'),
    AzkarCategoryModel(
        categoryNumber: 10,
        categoryEn: 'Going to Mosque Azkar',
        categoryAr: 'دعاء الذهاب إلى المسجد'),
    AzkarCategoryModel(
        categoryNumber: 11,
        categoryEn: 'Getting into Mosque Azkar',
        categoryAr: 'دعاء دخول المسجد'),
    AzkarCategoryModel(
        categoryNumber: 12,
        categoryEn: 'Leaving Mosque Azkar',
        categoryAr: 'دعاء الخروج من المسجد'),
    AzkarCategoryModel(
        categoryNumber: 13,
        categoryEn: 'Aladn Azkar',
        categoryAr: 'أذكار الآذان'),
    AzkarCategoryModel(
        categoryNumber: 14,
        categoryEn: 'Wearing a New Clothes Azkar',
        categoryAr: 'دعاء ُلبْس الثوب الجديد'),
    AzkarCategoryModel(
        categoryNumber: 15,
        categoryEn: 'Call for the Openning',
        categoryAr: 'دعاء الاستفتاح'),
    AzkarCategoryModel(
        categoryNumber: 16,
        categoryEn: 'Call during Kneeling',
        categoryAr: 'دعاء الركوع'),
    AzkarCategoryModel(
        categoryNumber: 17,
        categoryEn: 'Call after Kneeling',
        categoryAr: 'دعاء الرفع من الركوع'),
    AzkarCategoryModel(
        categoryNumber: 18,
        categoryEn: 'Call for Prostration',
        categoryAr: 'دعاء السجود'),
    AzkarCategoryModel(
        categoryNumber: 19,
        categoryEn: 'Call between the two prostrations',
        categoryAr: 'دعاء الجلسة بين السجدتين'),
    AzkarCategoryModel(
        categoryNumber: 20,
        categoryEn: 'Call for Prostration of recitation',
        categoryAr: 'دعاء سجود التلاوة'),
    AzkarCategoryModel(
        categoryNumber: 21, categoryEn: 'The Tashahhud', categoryAr: 'التشهد'),
    AzkarCategoryModel(
        categoryNumber: 22,
        categoryEn: 'Pray for the Prophet after Tashahhud',
        categoryAr: 'الصلاة على النبي بعد التشهد'),
    AzkarCategoryModel(
        categoryNumber: 23,
        categoryEn: 'The Call After The Latest Tashahhud',
        categoryAr: 'الدعاء بعد التشهد الأخير'),
    AzkarCategoryModel(
        categoryNumber: 24,
        categoryEn: 'After Praying Azkar',
        categoryAr: 'الأذكار بعدالصلاة'),
    AzkarCategoryModel(
        categoryNumber: 25,
        categoryEn: 'Call for Pray of Istikhara ',
        categoryAr: 'دعاء صلاة الاستخارة'),
    AzkarCategoryModel(
        categoryNumber: 26,
        categoryEn: 'The Call if You fluctuates Evening ',
        categoryAr: 'الدعاء إذا تقلب ليلا'),
    AzkarCategoryModel(
        categoryNumber: 27,
        categoryEn: 'Call of Panic during Sleeping',
        categoryAr: 'دعاء الفزع في النوم'),
    AzkarCategoryModel(
        categoryNumber: 28,
        categoryEn: 'The Call for Having a dream',
        categoryAr: 'ما يفعل من رأى الرؤيا أو الحلم'),
    AzkarCategoryModel(
        categoryNumber: 29,
        categoryEn: 'Call for Qunoot Witr',
        categoryAr: 'دعاء قنوت الوتر'),
    AzkarCategoryModel(
        categoryNumber: 30,
        categoryEn: 'After Witr Azkar ',
        categoryAr: 'الذكر بعدالوتر'),
    AzkarCategoryModel(
        categoryNumber: 31,
        categoryEn: 'Call Of being Sad ',
        categoryAr: 'دعاء الهم والحزن'),
    AzkarCategoryModel(
        categoryNumber: 32,
        categoryEn: 'Call Of being Anguish',
        categoryAr: 'دعاء الكرب'),
    AzkarCategoryModel(
        categoryNumber: 33,
        categoryEn: 'Call For Meeting the enemy ',
        categoryAr: 'دعاء لقاء العدو'),
    AzkarCategoryModel(
        categoryNumber: 34,
        categoryEn: 'Call of being Oppressed',
        categoryAr: 'دعاء من خاف ظلم السلطان'),
    AzkarCategoryModel(
        categoryNumber: 35,
        categoryEn: 'Praying against the Enemy ',
        categoryAr: 'الدعاء على العدو'),
    AzkarCategoryModel(
        categoryNumber: 36,
        categoryEn: 'Praying of having doubt in Faith',
        categoryAr: 'دعاء من أصابه وسوسة في الإيمان'),
    AzkarCategoryModel(
        categoryNumber: 37,
        categoryEn: 'prayeing to repay the debt',
        categoryAr: 'دعاء قضاء الدين'),
    AzkarCategoryModel(
        categoryNumber: 38,
        categoryEn: 'prayer for whispers during prayer',
        categoryAr: 'دعاء الوسوسة في الصلاة'),
    AzkarCategoryModel(
        categoryNumber: 39,
        categoryEn: 'Prayer of finding a matter difficult',
        categoryAr: 'دعاء من استصعب عليه أمر'),
    AzkarCategoryModel(
        categoryNumber: 40,
        categoryEn: 'Prayer for committing a sin',
        categoryAr: 'ما يقول ويفعل من أذنب ذنبا'),
    AzkarCategoryModel(
        categoryNumber: 41,
        categoryEn: 'Prayer to drive away the devil',
        categoryAr: 'دعاء طرد الشيطان'),
    AzkarCategoryModel(
        categoryNumber: 42,
        categoryEn: 'Congratulations on the newborn',
        categoryAr: 'ﺗﻬنئة المولود'),
    AzkarCategoryModel(
        categoryNumber: 43,
        categoryEn: 'Prayers for protecting children',
        categoryAr: 'ما يعوذ به الاولاد'),
    AzkarCategoryModel(
        categoryNumber: 44,
        categoryEn: 'Prayers for Patient',
        categoryAr: 'الدعاء للمريض'),
    AzkarCategoryModel(
        categoryNumber: 45,
        categoryEn: 'Prayer for the deceased during\nthe prayer',
        categoryAr: 'الدعاء للميت في الصلاة عليه'),
    AzkarCategoryModel(
        categoryNumber: 46,
        categoryEn: 'Prayer of placing the deceased\nin the grave',
        categoryAr: 'الدعاء عند إدخال الميت القبر'),
    AzkarCategoryModel(
        categoryNumber: 47,
        categoryEn: 'Prayer after burying the deceased',
        categoryAr: 'الدعاء بعد دفن الميت'),
    AzkarCategoryModel(
        categoryNumber: 48,
        categoryEn: 'Prayer for visiting the graves',
        categoryAr: 'دعاء زيارة القبور'),
    AzkarCategoryModel(
        categoryNumber: 49,
        categoryEn: 'Prayer of The Wind',
        categoryAr: 'دعاء الريح'),
    AzkarCategoryModel(
        categoryNumber: 50,
        categoryEn: 'The prayer for thunder',
        categoryAr: 'دعاء الرعد'),
    AzkarCategoryModel(
        categoryNumber: 51,
        categoryEn: 'Supplications for seeking rain',
        categoryAr: 'من أدعية الاستسقاء'),
    AzkarCategoryModel(
        categoryNumber: 52,
        categoryEn: 'After the Rain Azkar',
        categoryAr: 'الذكر بعد نزول المطر'),
    AzkarCategoryModel(
        categoryNumber: 53,
        categoryEn: 'Prayers for seeking health',
        categoryAr: 'من أدعية الاستصحاء'),
    AzkarCategoryModel(
        categoryNumber: 54,
        categoryEn: 'Prayer upon sighting the\ncrescent moon',
        categoryAr: 'دعاء رؤية الهلال'),
    AzkarCategoryModel(
        categoryNumber: 55,
        categoryEn: 'Prayer at the time of breaking\nthe fast',
        categoryAr: 'الدعاء عند إفطار الصائم'),
    AzkarCategoryModel(
        categoryNumber: 56,
        categoryEn: 'Call before the eat',
        categoryAr: 'الدعاء قبل الطعام'),
    AzkarCategoryModel(
        categoryNumber: 57,
        categoryEn: 'Call after the eat',
        categoryAr: 'الدعاء عند الفراغ من الطعام'),
    AzkarCategoryModel(
        categoryNumber: 58,
        categoryEn: 'حrayer of the guest for the host',
        categoryAr: 'دعاء الضيف لصاحب الطعام'),
    AzkarCategoryModel(
        categoryNumber: 59,
        categoryEn: 'Indirectly  making a prayer to\nask for food',
        categoryAr: 'التعريض بالدعاء لطلب الطعام أو الشراب'),
    AzkarCategoryModel(
        categoryNumber: 60,
        categoryEn: 'Prayer when breaking the fast at\nsomeone\'s home',
        categoryAr: 'الدعاء إذا أفطر عند أهل بيت'),
  ];

  @override
  void initState() {
    super.initState();
    displayedAzkar = allAzkar.take(itemsPerPage).toList();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (displayedAzkar.length < allAzkar.length) {
      setState(() {
        isLoadingMore = true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          int nextLimit = displayedAzkar.length + itemsPerPage;
          if (nextLimit > allAzkar.length) nextLimit = allAzkar.length;
          setState(() {
            displayedAzkar
                .addAll(allAzkar.getRange(displayedAzkar.length, nextLimit));
            isLoadingMore = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          AppStrings.azkar,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: displayedAzkar.length,
              itemBuilder: (context, index) {
                return AzkarListViewItem(
                  azkarCategoryModel: displayedAzkar[index],
                );
              },
            ),
          ),
          if (isLoadingMore)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
