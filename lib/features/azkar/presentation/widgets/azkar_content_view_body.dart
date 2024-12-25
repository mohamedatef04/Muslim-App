import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/azkar/cubits/azkarcontent/azkarcontent_cubit.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_content_listview_item.dart';

class AzkarContentViewBody extends StatefulWidget {
  const AzkarContentViewBody({super.key, required this.azkarCategoryModel});
  final AzkarCategoryModel azkarCategoryModel;

  @override
  State<AzkarContentViewBody> createState() => _AzkarContentViewBodyState();
}

class _AzkarContentViewBodyState extends State<AzkarContentViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AzkarcontentCubit>(context)
        .getAzkarContent(azkarId: widget.azkarCategoryModel.categoryNumber - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          widget.azkarCategoryModel.categoryAr,
          style: GoogleFonts.amiri(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AzkarcontentCubit, AzkarcontentState>(
        builder: (context, state) {
          if (state is AzkarContentSuccessState) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: BlocProvider.of<AzkarcontentCubit>(context)
                    .askarContent
                    .length,
                itemBuilder: (context, index) {
                  return AzkarContentListviewItem(
                    azkarArrayModel: BlocProvider.of<AzkarcontentCubit>(context)
                        .askarContent[index],
                  );
                },
              ),
            );
          } else if (state is AzkarContentFailureState) {
            return Center(child: Text('ops there was an error'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
