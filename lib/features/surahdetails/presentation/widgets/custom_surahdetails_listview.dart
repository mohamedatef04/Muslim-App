import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/surahdetails/cubits/surahdetails/surahdetails_cubit.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';
import 'package:quran_app/features/surahdetails/presentation/widgets/custom_listview_item.dart';

class CustomSurahDetailsListView extends StatefulWidget {
  const CustomSurahDetailsListView({
    super.key,
  });

  @override
  State<CustomSurahDetailsListView> createState() =>
      _CustomSurahDetailsListViewState();
}

class _CustomSurahDetailsListViewState
    extends State<CustomSurahDetailsListView> {
  List<SurahDetailsModel> displayedAyat = [];
  final int itemsPerPage = 20;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahdetailsCubit, SurahdetailsState>(
      listener: (context, state) {
        if (state is SurahdetailsLoadedState) {
          setState(() {
            displayedAyat = BlocProvider.of<SurahdetailsCubit>(context)
                .sewrs
                .take(itemsPerPage)
                .toList();
          });
        }
      },
      builder: (context, state) {
        if (state is SurahdetailsLoadedState || displayedAyat.isNotEmpty) {
          final allAyat = BlocProvider.of<SurahdetailsCubit>(context).sewrs;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayedAyat.length +
                (displayedAyat.length < allAyat.length ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < displayedAyat.length) {
                return CustomSurahDetailsListViewItem(
                  surahDetailsModel: displayedAyat[index],
                );
              } else {
                return TextButton(
                  onPressed: () {
                    int nextLimit = displayedAyat.length + itemsPerPage;
                    if (nextLimit > allAyat.length) nextLimit = allAyat.length;
                    setState(() {
                      displayedAyat.addAll(
                          allAyat.getRange(displayedAyat.length, nextLimit));
                    });
                  },
                  child: const Text('تحميل المزيد...',
                      style: TextStyle(color: Color(0xffA44AFF))),
                );
              }
            },
          );
        } else if (state is SurahdetailsFailureState) {
          return Center(child: Text(AppStrings.errorOccurred));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

