import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/ahadeeth/data/cubits/ahadeethdetails_cubit.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';
import 'package:quran_app/features/ahadeeth/presentation/widgets/ahadeeth_details_listview_item.dart';

class AhadeethDetailsViewBody extends StatefulWidget {
  const AhadeethDetailsViewBody(
      {super.key, required this.ahadeethCategoryModel});
  final AhadeethCategoryModel ahadeethCategoryModel;

  @override
  State<AhadeethDetailsViewBody> createState() =>
      _AhadeethDetailsViewBodyState();
}

class _AhadeethDetailsViewBodyState extends State<AhadeethDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AhadeethdetailsCubit>(context).getHadeethDetails(
        categoryIndex: widget.ahadeethCategoryModel.categoryNumber - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          widget.ahadeethCategoryModel.categoryAr,
          style: GoogleFonts.amiri(
            textStyle: TextStyle(),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AhadeethdetailsCubit, AhadeethdetailsState>(
        builder: (context, state) {
          if (state is AhadeethdetailsLoadedState) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: BlocProvider.of<AhadeethdetailsCubit>(context)
                    .ahadeeth
                    .length,
                itemBuilder: (context, index) {
                  return AhadeethDetailsListViewItem(
                    hadeethDetailsModel:
                        BlocProvider.of<AhadeethdetailsCubit>(context)
                            .ahadeeth[index],
                  );
                },
              ),
            );
          } else if (state is AhadeethdetailsFailureState) {
            return Center(child: Text('Oops there was an error'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
