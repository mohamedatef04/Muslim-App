import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';

class AzkarListViewItem extends StatelessWidget {
  const AzkarListViewItem({
    super.key,
    required this.azkarCategoryModel,
  });

  final AzkarCategoryModel azkarCategoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push('/AzkarContentView', extra: azkarCategoryModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 4,
            children: [
              Row(
                spacing: 15,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/muslim (1) 1.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                      child: Text(azkarCategoryModel.categoryNumber.toString()),
                    ),
                  ),
                  Text(
                    azkarCategoryModel.categoryEn,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.amiri(
                      textStyle: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    azkarCategoryModel.categoryAr,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.amiri(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA44AFF),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
