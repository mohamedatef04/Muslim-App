import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';
import 'package:quran_app/features/surahdetails/cubits/surahdetails/surahdetails_cubit.dart';
import 'package:quran_app/features/surahdetails/presentation/widgets/custom_container.dart';
import 'package:quran_app/features/surahdetails/presentation/widgets/custom_surahdetails_listview.dart';

class SurahdetailsViewBody extends StatefulWidget {
  const SurahdetailsViewBody({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;

  @override
  State<SurahdetailsViewBody> createState() => _SurahdetailsViewBodyState();
}

class _SurahdetailsViewBodyState extends State<SurahdetailsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahdetailsCubit>(context)
        .getALLSurahDetails(suraIndex: widget.surahModel.surahNumber - 1);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'سورة ${widget.surahModel.arSurahName}',
          style: GoogleFonts.amiri(
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomContainer(
              surahModel: widget.surahModel,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomSurahDetailsListView(),
          ),
        ],
      ),
    );
  }
}
