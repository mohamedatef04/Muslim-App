import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';

class AhadeethListViewItem extends StatelessWidget {
  const AhadeethListViewItem({
    super.key,
    required this.ahadeethCategoryModel,
  });

  final AhadeethCategoryModel ahadeethCategoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push('/AhadeethDetailsView', extra: ahadeethCategoryModel);
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
                      child:
                          Text(ahadeethCategoryModel.categoryNumber.toString()),
                    ),
                  ),
                  Text(
                    ahadeethCategoryModel.categoryEn,
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
                    ahadeethCategoryModel.categoryAr,
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
