import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';

class AzkarrListViewItem extends StatelessWidget {
  const AzkarrListViewItem({
    super.key,
    required this.azkarModel,
  });
  final AzkarModel azkarModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/AzkarContentView', extra: azkarModel);
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Spacer(
                  flex: 8,
                ),
                Text(
                  azkarModel.category,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.amiri(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xffA44AFF),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/muslim (1) 1.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: Text(azkarModel.categoryId.toString()),
                  ),
                ),
              ],
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
          ],
        ),
      ),
    );
  }
}
